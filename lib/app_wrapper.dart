import 'package:flutter/material.dart';
import 'package:trickle/pages/home/home_view_model.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:veee/veee.dart';

/// Wraps our [MaterialApp] with [ViewModelProvider]s and similar.
class AppWrapper extends StatelessWidget {
  final MaterialApp app;

  const AppWrapper(this.app);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PlayerViewModel>(
      create: (_) => PlayerViewModel(),
      child: ViewModelProvider<HomeViewModel>(
        create: (_) => HomeViewModel(),
        child: app,
      ),
    );
  }
}
