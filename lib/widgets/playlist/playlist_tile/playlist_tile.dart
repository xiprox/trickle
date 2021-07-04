import 'package:flutter/material.dart';
import 'package:trickle/config/consts.dart';

import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/utils/exts/all.dart';
import 'package:trickle/widgets/network_image_with_placeholder.dart';
import 'package:trickle/widgets/playlist/playlist_tile/playlist_image.dart';

import 'package:collection/collection.dart';
import 'package:supercharged/supercharged.dart';

class PlaylistTile extends StatelessWidget {
  final Playlist playlist;
  final Color? color;
  final bool selected;
  final bool compact;
  final bool draggable;
  final Size sizeWhenDragged;
  final Function()? onPress;

  PlaylistTile({
    Key? key,
    required this.playlist,
    this.color,
    this.selected = false,
    this.compact = false,
    this.draggable = false,
    this.sizeWhenDragged = const Size(
      kDesiredSlotWidth,
      kDesiredSlotWidth / kSlotAspectRatio,
    ),
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.colorSet;
    final imageUrl = playlist.images?.firstOrNull?.url;
    final borderRadius = BorderRadius.circular(8);
    final child = Material(
      color: colorSet.surface,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: !selected
            ? BorderSide.none
            : BorderSide(
                width: 3,
                color: colorSet.primary,
              ),
      ),
      child: InkWell(
        onTap: onPress,
        mouseCursor: draggable ? SystemMouseCursors.grab : null,
        borderRadius: borderRadius,
        child: Padding(
          padding: EdgeInsets.all(compact ? 8 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: NetworkImageWithPlaceholder.playlist(imageUrl),
              ),
              SizedBox(height: compact ? 6 : 12),
              Tooltip(
                message: playlist.name ?? '?',
                waitDuration: 0.5.seconds,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    playlist.name ?? '?',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (!draggable) {
      return child;
    } else {
      return Draggable<Playlist>(
        data: playlist,
        feedback: Container(
          width: sizeWhenDragged.width,
          height: sizeWhenDragged.height,
          child: child,
        ),
        childWhenDragging: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: colorSet.secondaryBackground,
          ),
        ),
        child: child,
      );
    }
  }
}
