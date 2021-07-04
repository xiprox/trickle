import 'package:flutter/material.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:veee/veee.dart';

class PlaybackInfo extends ViewModelWidget<PlayerViewModel> {
  const PlaybackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PlayerViewModel viewModel) {
    final data = viewModel.playback.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data?.item?.name ?? '?',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          data?.item?.artists?.map((it) => it?.name).join(' • ') ?? '?',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  void handleOrder(
      BuildContext context, ViewModelOrder order, PlayerViewModel viewModel) {
    // TODO: implement handleOrder
  }
}
