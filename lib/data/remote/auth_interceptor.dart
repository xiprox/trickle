import 'package:dio/dio.dart';
import 'package:synchronized/extension.dart';
import 'package:trickle/services/services.dart';

const _kHandledErrorCodes = [401];

class AuthInterceptor extends Interceptor {
  final _api = get<Api>();
  final _credentials = get<Credentials>();

  static DateTime _lastReauth = DateTime.fromMicrosecondsSinceEpoch(0);
  static int _retries = 0;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.uri.host != 'accounts.spotify.com') {
      options.headers.addAll({
        'Authorization': 'Bearer ${_credentials.accessToken}',
      });
    }
    handler.next(options);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    final dio = _api.client;

    print(error);

    // Ignore all other errors.
    if (!_kHandledErrorCodes.contains(error.response?.statusCode)) {
      return handler.next(error);
    }

    print('Caught expired token. Blocking all traffic.');
    print('OLD TOKEN: ${_credentials.accessToken}');

    // Block all traffic while we check and maybe reauth.
    dio.lock();

    print('Obtaining new token.');

    await synchronized(_reauth);

    print('Done. Unblocking traffic.');

    // Don't forget to unblock traffic.
    dio.unlock();
  }

  Future<bool> _reauth() async {
    // Block duplicate requests by checking if the last reauth was less than a second ago.
    if (DateTime.now().difference(_lastReauth).inSeconds < 1) {
      return true;
    }

    if (_retries >= 3) {
      print('Tried too many times. Exiting to login.');
      _credentials.clear();
      return false;
    }

    final result = await _api.refreshToken();
    print('RESULT ${result.data}');
    if (result.data != null) {
      _credentials.accessToken = result.data!.accessToken;
      _credentials.refreshToken = result.data!.refreshToken;
      _retries = 0;
      print('NEW TOKEN: ${_credentials.accessToken}');
      return true;
    } else {
      print('Error obtaining new token: ${result.error?.message}');
    }

    _retries++;
    return false;
  }
}
