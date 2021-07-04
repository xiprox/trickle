import 'package:flutter/material.dart';
import 'package:trickle/utils/exts/build_context_exts.dart';

class ColorSet {
  final Color primary;
  final Color secondary;
  final Color error;
  final Color surface;
  final Color background;
  final Color secondaryBackground;
  final Color divider;
  final Color text;
  final Color textLight;
  final Color textLighter;
  final Color textOnPrimary;
  final Color textOnSecondary;
  final Color textOnError;
  final Color border;

  ColorSet({
    required this.primary,
    required this.secondary,
    required this.surface,
    required this.error,
    required this.background,
    required this.secondaryBackground,
    required this.divider,
    required this.text,
    required this.textLight,
    required this.textLighter,
    required this.textOnPrimary,
    required this.textOnSecondary,
    required this.textOnError,
    required this.border,
  });

  static ColorSet basedOn(BuildContext context) {
    return context.theme.brightness == Brightness.light
        ? ColorSets.light
        : ColorSets.dark;
  }
}

class ColorSets {
  static final light = ColorSet(
    primary: Colors.black,
    secondary: Colors.black,
    error: Color(0xffFF5050),
    surface: Colors.white,
    background: Color(0xffe0e0e0),
    secondaryBackground: Color(0xffbdbdbd),
    divider: Color(0xffe0deda),
    text: Color(0xff232326),
    textLight: Color(0xff827E7E),
    textLighter: Color(0xff9E9898),
    textOnPrimary: Colors.white,
    textOnSecondary: Colors.white,
    textOnError: Colors.white,
    border: Color(0xffbdbdbd),
  );

  static final dark = ColorSet(
    primary: Colors.white,
    secondary: Colors.white,
    error: Color(0xffFF5050),
    surface: Color(0xff373737),
    background: Color(0xff1b1b1b),
    secondaryBackground: Color(0xff212121),
    divider: Color(0xff424242),
    text: Color(0xffe0e0e0),
    textLight: Color(0xffbdbdbd),
    textLighter: Color(0xff9e9e9e),
    textOnPrimary: Color(0xff232326),
    textOnSecondary: Color(0xff232326),
    textOnError: Color(0xff232326),
    border: Color(0xff424242),
  );
}
