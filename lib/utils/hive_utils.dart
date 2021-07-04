import 'package:universal_io/io.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// UNIQUE IDs for types registered with Hive.
class HiveTypes {
  static const trickleLink = 0;
}

class HiveUtils {
  static Future init() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  /// Initializes Hive for tests.
  static Future initTest() async {
    final path = 'test/resources/hive';
    final dir = Directory(path);
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
    Hive.init(path);
    _registerAdapters();
  }

  static _registerAdapters() {
    // Register future adapters here:
  }
}
