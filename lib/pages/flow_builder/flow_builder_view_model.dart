import 'dart:async';

import 'package:api_call/resource.dart';
import 'package:veee/veee.dart';
import 'package:trickle/config/consts.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/services/services.dart';
import 'package:supercharged/supercharged.dart';

class FlowBuilderViewModel extends ViewModel with BusyViewModel {
  final _flowRepo = get<FlowRepo>();
  final _playlistsRepo = get<PlaylistsRepo>();

  late Stream<List<Playlist>> playlists = _playlistsRepo.getPlaylistsStream();

  List<Playlist> selected = [];

  @override
  void onCreate() {
    _refreshPlaylists();
  }

  void _refreshPlaylists() {
    runBusyFuture(_playlistsRepo.syncPlaylists());
  }

  void onRefreshPress() {
    _refreshPlaylists();
  }

  void onPlaylistAdd(Playlist playlist) {
    selected.add(playlist);
    notifyListeners();
  }

  bool shouldAcceptPlaylist(Playlist? playlist) {
    return playlist?.id != null && !selected.contains(playlist);
  }

  void onPlaylistReorder(oldIndex, newIndex) {
    final playlist = this.selected[oldIndex];
    selected.removeAt(oldIndex);
    selected.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, playlist);
    notifyListeners();
  }

  void onPlaylistRemove(Playlist playlist) {
    selected.remove(playlist);
    notifyListeners();
  }

  Future onCreatePress() async {
    await _flowRepo.createFlow(selected);
  }

  /// Whether or not the "create flow" button should be visible.
  bool get showCreateButton => selected.length >= kFlowMinPlaylistCount;
}
