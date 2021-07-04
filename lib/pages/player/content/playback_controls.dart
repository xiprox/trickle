import 'package:flutter/material.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:veee/veee.dart';

class PlaybackControls extends ViewModelWidget<PlayerViewModel> {
  const PlaybackControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PlayerViewModel viewModel) {
    final data = viewModel.playback.data;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 36,
          height: 36,
          child: IconButton(
            onPressed: viewModel.onPreviousPress,
            icon: const Icon(
              Icons.skip_previous,
              size: 20,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: viewModel.onPlayPausePress,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
            ),
          ),
          child: Icon(
            data?.isPlaying == true ? Icons.pause : Icons.play_arrow,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: viewModel.onNextPress,
          icon: const Icon(
            Icons.skip_next,
            size: 20,
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
