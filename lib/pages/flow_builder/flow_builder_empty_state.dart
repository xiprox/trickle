import 'package:flutter/material.dart';
import 'package:supp/sup.dart';

class FlowBuilderEmptyState extends StatelessWidget {
  final Function() onRefresh;

  const FlowBuilderEmptyState({
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Sup(
        title: const Text('No playlists'),
        subtitle: const Text('Create some on Spotify to see them here'),
        bottom: TextButton(
          onPressed: onRefresh,
          child: Text('Refresh'),
        ),
      ),
    );
  }
}
