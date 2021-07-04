import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:trickle/utils/mixin/isolated.dart';

class Palette {
  final Color? vibrant;
  final Color? textOnVibrant;

  Palette({
    this.vibrant,
    this.textOnVibrant,
  });

  factory Palette.fromPaletteGenerator(PaletteGenerator source) {
    return Palette(
      vibrant: source.vibrantColor?.color,
      textOnVibrant: source.vibrantColor?.titleTextColor,
    );
  }
}

abstract class ColorGenerator {
  Future init();
  Future close();
  Stream<Palette?> getForPlaylist(String id, String? imgUrl);
}

class ColorGeneratorImpl extends ColorGenerator
    with Isolated<String, PaletteGenerator> {
  final Map<String, PaletteGenerator> _cache = {};

  @override
  Future init() async {
    await initIsolate(_isolateEntry);
  }

  @override
  Future close() async {
    closeIsolate();
  }

  String _generateKeyForPlaylist(String id) => 'playlist:$id';

  static void _isolateEntry(SendPort toMainPort) async {
    final toIsolatePort = Isolated.prepareToIsolatePort(toMainPort);

    await for (final message in toIsolatePort) {
      String imgUrl = message[0];
      SendPort callbackPort = message[1];

      final image = NetworkImage(imgUrl);
      final result = await PaletteGenerator.fromImageProvider(image);

      callbackPort.send(result);
    }
  }

  @override
  Stream<Palette?> getForPlaylist(String id, String? imgUrl) async* {
    if (imgUrl == null) yield null;
    final key = _generateKeyForPlaylist(id);
    if (_cache.containsKey(key)) {
      yield Palette.fromPaletteGenerator(_cache[key]!);
    } else {
      _cache[key] = PaletteGenerator.fromColors([]);
      final generated = await processInIsolate(imgUrl!);
      _cache[key] = generated;
      yield Palette.fromPaletteGenerator(generated);
    }
  }
}
