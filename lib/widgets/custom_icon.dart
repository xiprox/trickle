import 'package:universal_io/io.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class PlatformSpecificIconData {
  final String android;
  final String iOS;
  final String macOS;
  final String linux;
  final String windows;
  final String web;

  PlatformSpecificIconData({
    required this.android,
    required this.iOS,
    required this.macOS,
    required this.linux,
    required this.windows,
    required this.web,
  });

  String get() {
    if (kIsWeb) return web;
    if (Platform.isAndroid) return android;
    if (Platform.isIOS) return iOS;
    if (Platform.isMacOS) return macOS;
    if (Platform.isLinux) return linux;
    if (Platform.isWindows) return windows;
    throw UnsupportedError('Unknown platform');
  }
}

class CustomIconData {
  final String? _data;
  final PlatformSpecificIconData? _platformSpecific;

  /// Whether this icon should be horizontally flipped on RTL layouts.
  final bool matchTextDirection;

  const CustomIconData._(
    String? data, {
    PlatformSpecificIconData? platformSpecific,
    this.matchTextDirection = false,
  })  : _data = data,
        _platformSpecific = platformSpecific;

  String get data => _platformSpecific != null
      ? _platformSpecific!.get()
      : _data != null
          ? _data!
          : '';

  factory CustomIconData.single(
    String data, [
    bool matchTextDirection = false,
  ]) {
    return CustomIconData._(
      data,
      matchTextDirection: matchTextDirection,
    );
  }

  factory CustomIconData.specific(
    PlatformSpecificIconData data, [
    bool matchTextDirection = false,
  ]) {
    return CustomIconData._(
      null,
      platformSpecific: data,
      matchTextDirection: matchTextDirection,
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
  }) : super(key: key);

  final CustomIconData? icon;

  final double? size;

  final Color? color;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double? iconSize = size ?? iconTheme.size ?? 24;
    final textDirection = Directionality.of(context);

    if (icon == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox(width: iconSize, height: iconSize),
      );
    }

    Widget child = SvgPicture.asset(
      icon!.data,
      width: iconSize,
      height: iconSize,
      color: color ?? iconTheme.color,
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      excludeFromSemantics: true,
    );

    if (icon!.matchTextDirection == true &&
        textDirection == TextDirection.rtl) {
      child = Transform(
        transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
        alignment: Alignment.center,
        transformHitTests: false,
        child: child,
      );
    }

    return Semantics(
      label: semanticLabel,
      child: child,
    );
  }
}
