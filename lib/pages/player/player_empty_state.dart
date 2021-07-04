import 'package:flutter/material.dart';
import 'package:supp/sup.dart';

class PlayerEmptyState extends StatelessWidget {
  const PlayerEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sup(
      image: Icon(Icons.pause_circle_outline),
      title: Text('Nothing playing'),
      subtitle: Text('Start listening on Spotify'),
    );
  }
}
