import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// At what point (width) our layour should break.
const _kBreakpointTablet = 650;
const _kBreakpointDesktop = 1100;

class Responsive extends StatelessWidget {
  final WidgetBuilder mobile;
  final WidgetBuilder tablet;
  final WidgetBuilder desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < _kBreakpointTablet;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < _kBreakpointDesktop &&
      MediaQuery.of(context).size.width >= _kBreakpointTablet;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _kBreakpointDesktop;

  /// Whether we are running on the web.
  static bool get isWeb => kIsWeb;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= _kBreakpointDesktop) {
          return desktop(context);
        } else if (constraints.maxWidth >= _kBreakpointTablet) {
          return tablet(context);
        } else {
          return mobile(context);
        }
      },
    );
  }
}
