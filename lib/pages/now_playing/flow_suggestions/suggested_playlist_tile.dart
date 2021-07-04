import 'package:flutter/material.dart';
import 'package:trickle/config/icons.dart';
import 'package:trickle/data/local/assets.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/widgets/custom_icon.dart';
import 'package:trickle/widgets/network_image_with_placeholder.dart';
import 'package:trickle/widgets/playlist/playlist_tile/playlist_image.dart';

class SuggestedPlaylistTile extends StatelessWidget {
  final Playlist playlist;

  const SuggestedPlaylistTile({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          NetworkImageWithPlaceholder.playlist(
            playlist.images?.first.url,
            borderRadius: BorderRadius.circular(4),
            size: 40,
          ),
          const SizedBox(width: 16),
          Text(playlist.name ?? '?'),
          const Expanded(
            child: const SizedBox(),
          ),
          IconButton(
            onPressed: () {},
            icon: CustomIcon(I.flowCopy),
          ),
          IconButton(
            onPressed: () {},
            icon: CustomIcon(I.flowMove),
          ),
        ],
      ),
    );
  }
}
