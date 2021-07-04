import 'package:trickle/widgets/resource_stream_builder.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/pages/flow_builder/flow_builder_app_bar.dart';
import 'package:trickle/pages/flow_builder/flow_builder_view_model.dart';
import 'package:trickle/widgets/playlist/playlist_grid.dart';
import 'package:trickle/widgets/resource_builder.dart';
import 'package:trickle/utils/exts/all.dart';

import 'flow_builder_empty_state.dart';
import 'flow_builder_slots.dart';

/// This page presents the user their playlists and allows them to pick two to
/// build a Flow.
///
/// A Flow is a pair of two playlists — a source and a target. When the user
/// plays music, if they are playing a playlist that is the source in a Flow,
/// we'll suggest adding the played song to the target playlist.
class FlowBuilderPage extends StatefulWidget {
  const FlowBuilderPage({Key? key}) : super(key: key);

  @override
  _FlowBuilderPageState createState() => _FlowBuilderPageState();
}

class _FlowBuilderPageState extends State<FlowBuilderPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuery.size;
    final horizontalPadding = size.width * 0.05;
    return ViewModelProvider<FlowBuilderViewModel>(
      create: (_) => FlowBuilderViewModel(),
      child: ViewModelBuilder<FlowBuilderViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: StreamBuilder<List<Playlist>>(
              stream: viewModel.playlists,
              builder: (context, snapshot) {
                final playlists = snapshot.data ?? [];

                if (playlists.isEmpty) {
                  return FlowBuilderEmptyState(
                    onRefresh: viewModel.onRefreshPress,
                  );
                }

                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    FlowBuilderAppBar(
                      scrollController: _scrollController,
                      syncing: viewModel.isBusy,
                    ),
                    if (playlists.isNotEmpty)
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: horizontalPadding,
                        ),
                        sliver: PlaylistGrid(
                          playlists: playlists,
                          // onPlaylistPress: cubit.onPlaylistPress,
                          selectedPlaylistIds: [
                            // if (state.selectedPair?.source?.id != null)
                            //   state.selectedPair!.source!.id!,
                            // if (state.selectedPair?.target?.id != null)
                            //   state.selectedPair!.target!.id!
                          ],
                        ),
                      ),
                    SliverToBoxAdapter(
                      child: const SizedBox(height: 80),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
