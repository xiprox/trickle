import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trickle/config/colors.dart';
import 'package:trickle/config/consts.dart';

class AppTheme {
  static ThemeData build(Brightness brightness) {
    final baseTheme =
        brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light();
    final textTheme = GoogleFonts.manropeTextTheme(baseTheme.textTheme);
    final borderRadius = BorderRadius.circular(kStandardCornerRadius);
    final colorSet =
        brightness == Brightness.dark ? ColorSets.dark : ColorSets.light;
    return ThemeData(
      primaryColor: colorSet.primary,
      backgroundColor: colorSet.background,
      scaffoldBackgroundColor: colorSet.background,
      cardColor: colorSet.surface,
      dividerColor: colorSet.divider,
      colorScheme: ColorScheme(
        background: colorSet.background,
        brightness: brightness,
        error: colorSet.error,
        onBackground: colorSet.text,
        onError: colorSet.textOnError,
        onPrimary: colorSet.textOnPrimary,
        onSecondary: colorSet.textOnSecondary,
        onSurface: colorSet.text,
        primary: colorSet.primary,
        primaryVariant: colorSet.primary,
        secondary: colorSet.secondary,
        secondaryVariant: colorSet.secondary,
        surface: colorSet.surface,
      ),
    );
  }
}
