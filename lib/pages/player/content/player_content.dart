import 'package:flutter/material.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:veee/veee.dart';

import 'artwork.dart';
import 'connect_controls.dart';
import 'playback_controls.dart';
import 'playback_info.dart';

class PlayerContent extends ViewModelWidget<PlayerViewModel> {
  const PlayerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PlayerViewModel viewModel) {
    return Row(
      children: [
        const Artwork(),
        const SizedBox(width: 16),
        const Expanded(child: const PlaybackInfo()),
        const PlaybackControls(),
        const ConnectControls(),
        const SizedBox(width: 4),
      ],
    );
  }

  @override
  void handleOrder(
      BuildContext context, ViewModelOrder order, PlayerViewModel viewModel) {
    // TODO: implement handleOrder
  }
}
