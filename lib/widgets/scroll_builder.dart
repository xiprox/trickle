import 'dart:math';

import 'package:flutter/material.dart';

abstract class ScrollBuilderDelegate {
  Widget build(double progress, Widget child);
}

class ScrollBuilderCustomDelegate extends ScrollBuilderDelegate {
  final Widget Function(double progress, Widget child) builder;

  ScrollBuilderCustomDelegate({required this.builder});

  @override
  Widget build(double progress, Widget child) {
    return builder(progress, child);
  }
}

enum FadeMode { fadeIn, fadeOut }

class ScrollBuilderFadeDelegate extends ScrollBuilderDelegate {
  final FadeMode mode;

  ScrollBuilderFadeDelegate({
    this.mode = FadeMode.fadeOut,
  });

  @override
  Widget build(double progress, Widget child) {
    return Opacity(
      opacity: mode == FadeMode.fadeIn ? progress : 1 - progress,
      child: child,
    );
  }
}

class ScrollBuilder extends StatefulWidget {
  final ScrollController scrollController;
  final ScrollBuilderDelegate delegate;
  final double breakpoint;
  final Widget child;

  ScrollBuilder({
    Key? key,
    required this.scrollController,
    required this.delegate,
    required this.child,
    this.breakpoint = 0,
  });

  @override
  _ScrollBuilderState createState() => _ScrollBuilderState();
}

class _ScrollBuilderState extends State<ScrollBuilder> {
  double _currentPosition = 0;

  @override
  initState() {
    super.initState();
    widget.scrollController.addListener(_setCurrentPosition);
  }

  @override
  dispose() {
    widget.scrollController.removeListener(_setCurrentPosition);
    super.dispose();
  }

  void _setCurrentPosition() {
    setState(() {
      _currentPosition = widget.scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final percentage = min(1, _currentPosition / widget.breakpoint).toDouble();
    return widget.delegate.build(
      percentage,
      widget.child,
    );
  }
}
