import 'dart:ffi' as ffi;
import 'package:path/path.dart' as path;
import 'package:universal_io/io.dart';

class Librespot {
  late final _libPath = _loadLibPath();

  late final dylib = ffi.DynamicLibrary.open(_libPath);

  String _loadLibPath() {
    return '';
    // if (Platform.isMacOS) {
    //   return path.join(
    //       Directory.current.path, 'liblibrespot', 'liblibrespot.dylib');
    // } else if (Platform.isWindows) {
    //   return path.join(
    //       Directory.current.path, 'liblibrespot', 'Debug', 'liblibrespot.dll');
    // } else {
    //   return path.join(
    //       Directory.current.path, 'liblibrespot', 'liblibrespot.so');
    // }
  }
}
