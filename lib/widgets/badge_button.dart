import 'package:flutter/material.dart';
import 'package:trickle/utils/exts/build_context_exts.dart';

class BadgeButton extends StatelessWidget {
  final double size;
  final Color? color;
  final Widget child;
  final Function()? onPress;

  const BadgeButton({
    Key? key,
    this.size = 30,
    required this.child,
    this.onPress,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FloatingActionButton(
        backgroundColor: color,
        onPressed: onPress,
        child: Theme(
          data: context.theme.copyWith(
            iconTheme: context.theme.iconTheme.copyWith(
              size: 16,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
