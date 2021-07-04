import 'package:auto_route/auto_route.dart';
import 'package:trickle/pages/now_playing/flow_suggestions/flow_suggestions.dart';
import 'package:trickle/pages/player/player.dart';
import 'package:trickle/services/exported_services.dart';
import 'package:trickle/services/services.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart' hide Flow;
import 'package:trickle/data/models/database/flow.dart';
import 'package:trickle/navigation/router.gr.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:trickle/utils/spotify_utils.dart';

import 'now_playing_view_model.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  final _router = get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlayerViewModel>(
      // shouldRebuild: (previous, current) {
      //   return previous.playback.data?.context?.uri !=
      //       current.playback.data?.context?.uri;
      // },
      builder: (context, playerState, child) {
        final uri = playerState.playback.data?.context?.uri;
        final currentPlaylistId = SpotifyUtils.idFromUri(uri ?? '') ?? '';
        return ViewModelProvider<NowPlayingViewModel>(
          create: (_) => NowPlayingViewModel(),
          child: ViewModelBuilder<NowPlayingViewModel>(
            builder: (context, viewModel, child) {
              if (currentPlaylistId != viewModel.currentPlaylistId) {
                viewModel.onCurrentPlaylistChanged(currentPlaylistId);
              }
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 16,
                    left: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Player(),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              _router.push(FlowBuilderRoute());
                            },
                            child: const Text('Manage Flows'),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const VerticalDivider(width: 1),
                      Expanded(
                        child: Column(
                          children: [
                            const FlowSuggestions(),
                          ],
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
    );
  }
}
