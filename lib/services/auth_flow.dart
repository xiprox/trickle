import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:trickle/config/consts.dart';
import 'package:trickle/data/remote/api.dart';
import 'package:trickle/pages/init/init_page.dart';
import 'package:universal_io/io.dart';
import 'package:trickle/services/services.dart';
import 'package:trickle/utils/exts/all.dart';

class KnownAuthErrors {
  static const stateMismatch = 'STATE_MISMATCH';
  static const authorizationCodeNull = 'AUTHORIZATION_CODE_NULL';
  static const tokenDataNull = 'TOKEN_DATA_NULL';
}

abstract class AuthFlow {
  /// Launches an authentication flow, returns any errors.
  Future<String?> auth();
  Future<String?> handleAuthorizationCode(
    String? state,
    String? code,
    String? error,
  );
}

class AuthFlowImpl extends AuthFlow {
  final _api = get<Api>();
  final _crypto = get<Crypto>();
  final _credentials = get<Credentials>();
  final _router = get<AppRouter>();

  late final String state;
  late final String codeVerifier;
  late final String codeChallenge;

  AuthFlowImpl() {
    _init();
  }

  Future _init() async {
    state = _crypto.generateRandomString(20);
    codeVerifier = _crypto.generateCodeVerifier();
    codeChallenge = await _crypto.generateCodeChallenge(codeVerifier);
  }

  @override
  Future<String?> auth() async {
    if (Platform.isMacOS) {
      return _authMacOs();
    }
    return 'Unsupported platform';
  }

  Future<String?> _authMacOs() async {
    final redirect = await FlutterWebAuth.authenticate(
      url: _api.generateAuthUri(state, codeChallenge),
      callbackUrlScheme: redirectUrlScheme,
    );

    final redirectedUri = Uri.tryParse(redirect.replaceFirst('#', '?'));
    if (redirectedUri != null) {
      final state = redirectedUri.queryParameters['state'];
      final code = redirectedUri.queryParameters['code'];
      final error = redirectedUri.queryParameters['error'];

      return handleAuthorizationCode(state, code, error);
    }

    return '???!?!?!?!??!?';
  }

  @override
  Future<String?> handleAuthorizationCode(
    String? state,
    String? code,
    String? error,
  ) async {
    if (state != this.state) {
      print('State mismatch. Returning.');
      return KnownAuthErrors.stateMismatch;
    }

    if (error != null) {
      return error;
    }

    if (code == null) {
      return KnownAuthErrors.authorizationCodeNull;
    }

    final response = await _api.exchangeCodeForToken(code, codeVerifier);

    if (response.data == null) {
      return KnownAuthErrors.tokenDataNull;
    }

    response.data?.let((it) {
      if (it.accessToken == null ||
          it.refreshToken == null ||
          it.expiresIn == null) {
        return KnownAuthErrors.tokenDataNull;
      }
      _credentials.accessToken = it.accessToken;
      _credentials.refreshToken = it.refreshToken;
      _credentials.expirationTimestamp =
          DateTime.now().millisecondsSinceEpoch + it.expiresIn!;
      _router.replace(InitRoute());
    });
  }
}
