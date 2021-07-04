import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart' as crpto;

abstract class Crypto {
  String generateRandomString(int length);
  Future<List<int>> sha256(List<int> data);
  Future<String> generateCodeChallenge(String codeVerifier);
  String generateCodeVerifier();
}

class CryptoImpl extends Crypto {
  final _random = Random.secure();

  @override
  String generateRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(
      length,
      (_) => _chars[_random.nextInt(_chars.length)],
    ).join();
  }

  @override
  Future<List<int>> sha256(List<int> data) async {
    return crpto.sha256.convert(data).bytes;
  }

  @override
  Future<String> generateCodeChallenge(String codeVerifier) async {
    final hashed = await sha256(codeVerifier.codeUnits);
    final encoded = base64UrlEncode(hashed);
    return encoded.replaceAll('=', '');
  }

  @override
  String generateCodeVerifier() {
    return generateRandomString(100);
  }
}
