import 'package:flutter/material.dart';

import 'package:trickle/config/consts.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/widgets/playlist/playlist_tile/playlist_tile.dart';

/// Renders a grid of playlists.
class PlaylistGrid extends StatelessWidget {
  final List<Playlist> playlists;
  final double spacing;
  final EdgeInsets padding;
  final List<String>? selectedPlaylistIds;
  final Function(Playlist)? onPlaylistPress;

  const PlaylistGrid({
    Key? key,
    required this.playlists,
    this.spacing = 16,
    this.padding = EdgeInsets.zero,
    this.selectedPlaylistIds,
    this.onPlaylistPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: kPlaylistGridColumnWidth,
        childAspectRatio: kSlotAspectRatio,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
      delegate: SliverChildBuilderDelegate(
        _buildItem,
        childCount: playlists.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final item = playlists[index];
    final selected = selectedPlaylistIds?.contains(item.id) == true;
    return PlaylistTile(
      playlist: item,
      selected: selected,
      draggable: true,
      onPress: onPlaylistPress == null ? null : () => onPlaylistPress!(item),
    );
  }
}
