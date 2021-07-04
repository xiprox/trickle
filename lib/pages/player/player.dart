import 'package:trickle/pages/player/content/player_content.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';
import 'package:trickle/core/common_view_model_orders.dart';
import 'package:trickle/data/models/spotify/player/current_playback.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:trickle/widgets/frame_builders.dart';
import 'package:trickle/widgets/resource_builder.dart';
import 'package:trickle/utils/exts/all.dart';

import 'player_empty_state.dart';

class Player extends ViewModelWidget<PlayerViewModel> {
  const Player();

  @override
  void handleOrder(
    BuildContext context,
    ViewModelOrder order,
    PlayerViewModel viewModel,
  ) {
    if (order is ShowSnackBar) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(order.message),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context, PlayerViewModel viewModel) {
    final colorSet = context.colorSet;
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: colorSet.secondaryBackground,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ResourceBuilder<CurrentPlayback>(
          resource: viewModel.playback,
          contentBuilder: (_, __) => const PlayerContent(),
          emptyBuilder: (_) => const PlayerEmptyState(),
        ),
      ),
    );
  }
}
