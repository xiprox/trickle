import 'package:flutter/material.dart';

class CommonProgressIndicator extends StatelessWidget {
  final EdgeInsets padding;
  final Color? color;
  final double radius;
  final double strokeWidth;

  const CommonProgressIndicator({
    this.padding = const EdgeInsets.all(8),
    this.color,
    this.radius = 16,
    this.strokeWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: radius * 2,
        width: radius * 2,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: color == null ? null : AlwaysStoppedAnimation(color),
        ),
      ),
    );
  }
}
