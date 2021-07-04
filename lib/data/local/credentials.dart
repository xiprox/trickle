import 'package:hive/hive.dart';

abstract class Credentials {
  Future init();
  Future clear();

  bool get isAuthenticated;

  Stream<bool> get isAuthenticatedStream;

  String? get accessToken;
  set accessToken(String? value);

  String? get refreshToken;
  set refreshToken(String? value);

  int? get expirationTimestamp;
  set expirationTimestamp(int? value);
}

class CredentialsImpl implements Credentials {
  late Box _box;

  @override
  Future init() async {
    _box = await Hive.openBox('credentials');
  }

  @override
  Future clear() async {
    await _box.clear();
    // Box gets closed when cleared so call init to re-open it.
    // Failing to re-open after clearing a box will cause writes to not be
    // persisted.
    await init();
  }

  bool _isTokenValid(String? token) {
    return token != null;
  }

  @override
  bool get isAuthenticated => _isTokenValid(accessToken);

  @override
  Stream<bool> get isAuthenticatedStream =>
      accessTokenStream.map(_isTokenValid);

  @override
  String? get accessToken => _box.get('accessToken');
  @override
  set accessToken(String? value) => _box.put('accessToken', value);

  Stream<String?> get accessTokenStream =>
      _box.watch(key: 'accessToken').map((it) => it.value);

  @override
  String? get refreshToken => _box.get('refreshToken');
  @override
  set refreshToken(String? value) => _box.put('refreshToken', value);

  @override
  int? get expirationTimestamp => _box.get('expirationTimestamp');
  @override
  set expirationTimestamp(int? value) => _box.get('expirationTimestamp');
}
