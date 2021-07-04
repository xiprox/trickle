import 'package:flutter/material.dart';
import 'package:trickle/widgets/common_progress_indicator.dart';
import 'package:supercharged/supercharged.dart';

class SyncIndicator extends StatelessWidget {
  final bool visible;
  final double radius;

  const SyncIndicator({
    Key? key,
    this.visible = true,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    return SizedBox(
      width: size,
      height: size,
      child: AnimatedSwitcher(
        duration: 300.milliseconds,
        switchInCurve: Curves.fastOutSlowIn,
        switchOutCurve: Curves.fastOutSlowIn,
        child: visible ? _buildActualIndicator() : const SizedBox(),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildActualIndicator() {
    return Tooltip(
      message: 'Updating',
      child: CommonProgressIndicator(
        radius: radius,
        strokeWidth: 2,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
