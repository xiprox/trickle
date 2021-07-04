import 'package:flutter/material.dart';
import 'package:trickle/config/colors.dart';

extension BuildContextExts on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorSet get colorSet => ColorSet.basedOn(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
