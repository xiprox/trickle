import 'package:api_call/resource.dart';
import 'package:veee/veee.dart';
import 'package:trickle/data/models/database/flow.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/services/services.dart';

import 'package:supercharged/supercharged.dart';

class NowPlayingViewModel extends ViewModel {
  final _flowRepo = get<FlowRepo>();
  final _playlistsRepo = get<PlaylistsRepo>();

  Stream<List<Flow>>? flows;
  List<Playlist> targetPlaylists = [];

  String? currentPlaylistId;

  @override
  void onCreate() {}

  @override
  void dispose() {
    super.dispose();
  }

  void onCurrentPlaylistChanged(String playlistId) {
    if (playlistId != currentPlaylistId) {
      currentPlaylistId = playlistId;
      flows = _flowRepo.getAllFlowsWithPlaylistStream(playlistId);
      flows?.listen(_findTargetPlaylistsForThisPlaylist);
    }
  }

  void _findTargetPlaylistsForThisPlaylist(List<Flow> flows) async {
    final ids = <String>[];
    for (var flow in flows) {
      final indexOfCurrentPlaylistInFlow = flow.playlists.indexWhere(
        (id) => id == currentPlaylistId,
      );
      final nextIndex = indexOfCurrentPlaylistInFlow + 1;
      if (nextIndex <= (flow.playlists.lastIndex ?? 0)) {
        final nextPlaylistId = flow.playlists[nextIndex];
        ids.add(nextPlaylistId);
      }
    }
    targetPlaylists = await _playlistsRepo.getPlaylistsById(ids);
    notifyListeners();
  }

  void onCopyToPlaylistPress() {}

  void onMoveToPlaylistPress() {}
}
