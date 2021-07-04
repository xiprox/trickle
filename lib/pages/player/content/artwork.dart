import 'package:flutter/material.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:trickle/widgets/frame_builders.dart';
import 'package:trickle/widgets/network_image_with_placeholder.dart';
import 'package:veee/veee.dart';

class Artwork extends ViewModelWidget<PlayerViewModel> {
  const Artwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PlayerViewModel viewModel) {
    return NetworkImageWithPlaceholder.album(
      viewModel.playback.data?.item?.album?.images
          ?.firstWhere((it) => it?.height == 300)
          ?.url,
      borderRadius: BorderRadius.circular(8),
      size: 80,
    );
  }

  @override
  void handleOrder(
      BuildContext context, ViewModelOrder order, PlayerViewModel viewModel) {
    // TODO: implement handleOrder
  }
}
