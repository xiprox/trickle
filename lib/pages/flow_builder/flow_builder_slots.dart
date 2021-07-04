import 'package:veee/veee.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trickle/config/consts.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/widgets/badge_button.dart';
import 'package:trickle/widgets/badge_wrapper.dart';
import 'package:trickle/widgets/playlist/playlist_tile/playlist_tile.dart';
import 'package:trickle/utils/exts/all.dart';

import 'package:collection/collection.dart';
import 'package:supercharged/supercharged.dart';

import 'flow_builder_view_model.dart';

const _kDefaultHeight = 160.0;

class FlowBuilderSlots extends StatelessWidget {
  final double height;

  const FlowBuilderSlots({
    Key? key,
    this.height = _kDefaultHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.colorSet;
    return ViewModelBuilder<FlowBuilderViewModel>(
      builder: (context, viewModel, child) {
        final selected = viewModel.selected;
        return DragTarget<Playlist>(
          builder: (context, candidate, rejected) {
            return Container(
              height: height,
              child: ReorderableListView.builder(
                itemCount: selected.isEmpty ? 3 : selected.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  top: 8,
                  right: 88,
                  bottom: 8,
                  left: 16,
                ),
                onReorder: viewModel.onPlaylistReorder,
                buildDefaultDragHandles: false,
                proxyDecorator: (child, index, _) => child,
                itemBuilder: (context, index) {
                  final width = height * kSlotAspectRatio;

                  if (selected.isEmpty) {
                    return Row(
                      key: ValueKey(index),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DottedBorder(
                          color: colorSet.border,
                          dashPattern: [4, 2],
                          strokeWidth: 1.4,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(8),
                          child: SizedBox(width: width, height: height),
                        ),
                        if (index != 2)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: colorSet.border,
                            ),
                          ),
                      ],
                    );
                  }

                  final item = selected[index];
                  return GestureDetector(
                    key: ValueKey(item.id),
                    onSecondaryTap: () {
                      print('WOAH SEC');
                      showMenu(
                        context: context,
                        position:
                            RelativeRect.fromLTRB(40.0, 60.0, 100.0, 100.0),
                        items: [
                          PopupMenuItem<String>(
                            child: ListTile(
                              leading: const Icon(Icons.visibility),
                              title: Text('Test'),
                              onTap: () {},
                            ),
                            value: 'test',
                          ),
                          PopupMenuItem<String>(
                            child: ListTile(
                              leading: const Icon(Icons.visibility),
                              title: Text('Test 2'),
                              onTap: () {},
                            ),
                            value: 'test2',
                          ),
                        ],
                      );
                    },
                    child: ReorderableDragStartListener(
                      enabled: true,
                      index: index,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: width,
                            height: height,
                            child: BadgeWrapper(
                              badge: BadgeButton(
                                color: colorSet.surface,
                                child: Icon(Icons.remove),
                                onPress: () => viewModel.onPlaylistRemove(item),
                              ),
                              alignment: AlignmentDirectional.topEnd,
                              child: PlaylistTile(
                                playlist: item,
                                compact: true,
                                sizeWhenDragged: Size(width, height),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: index != selected.lastIndex ? 1 : 0,
                            duration: 200.milliseconds,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_right_alt,
                                color: colorSet.textLighter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          onWillAccept: viewModel.shouldAcceptPlaylist,
          onAccept: (playlist) {
            viewModel.onPlaylistAdd(playlist);
          },
        );
      },
    );
  }
}
