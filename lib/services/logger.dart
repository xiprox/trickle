import 'package:flutter/foundation.dart' show kDebugMode;

abstract class Logger {
  void call(String tag, String message);
}

class LoggerImpl extends Logger {
  void call(String tag, String message) {
    final line = '$tag: $message';
    if (kDebugMode) print(line);
  }
}
