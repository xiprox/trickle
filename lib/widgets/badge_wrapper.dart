import 'package:flutter/material.dart';

class BadgeWrapper extends StatelessWidget {
  final Widget child;
  final Widget badge;
  final double offset;
  final AlignmentGeometry alignment;

  const BadgeWrapper({
    Key? key,
    required this.child,
    required this.badge,
    required this.alignment,
    this.offset = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned.fill(
          bottom: -offset,
          right: -offset,
          left: -offset,
          top: -offset,
          child: Align(
            alignment: alignment,
            child: badge,
          ),
        ),
      ],
    );
  }
}
