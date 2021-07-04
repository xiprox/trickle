import 'dart:isolate';

/// A mixin that makes it easy to use an Isolate in a service.
mixin Isolated<T, R> {
  late final Isolate _isolate;

  /// SendPort to our Isolate.
  late SendPort _sendPort;

  Future initIsolate(void entryPoint(SendPort port)) async {
    final toMainPort = ReceivePort();
    _isolate = await Isolate.spawn(entryPoint, toMainPort.sendPort);
    _sendPort = await toMainPort.first;
  }

  void closeIsolate() {
    _isolate.kill();
  }

  static ReceivePort prepareToIsolatePort(SendPort toMainPort) {
    final toIsolatePort = ReceivePort();
    toMainPort.send(toIsolatePort.sendPort);
    return toIsolatePort;
  }

  /// Sends given [data] to the isolate to be processed.
  Future<R> processInIsolate(T data) {
    final callbackPort = ReceivePort();
    _sendPort.send([data, callbackPort.sendPort]);
    return callbackPort.first as Future<R>;
  }
}
