import 'package:jwt_decoder/jwt_decoder.dart';

class JwtUtils {
  static bool isValid(String? jwt) {
    return jwt != null && JwtDecoder.tryDecode(jwt) != null;
  }
}
