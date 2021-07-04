import 'package:flutter/material.dart' hide Flow;
import 'package:trickle/pages/now_playing/flow_suggestions/suggested_playlist_tile.dart';
import 'package:trickle/pages/now_playing/now_playing_view_model.dart';
import 'package:veee/veee.dart';

class FlowSuggestions extends ViewModelWidget<NowPlayingViewModel> {
  const FlowSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, NowPlayingViewModel viewModel) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: viewModel.targetPlaylists.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return SuggestedPlaylistTile(
          playlist: viewModel.targetPlaylists[index],
        );
      },
    );
  }

  @override
  void handleOrder(BuildContext context, ViewModelOrder order,
      NowPlayingViewModel viewModel) {
    // TODO: implement handleOrder
  }
}
