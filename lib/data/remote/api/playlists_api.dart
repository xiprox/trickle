part of '../api.dart';

extension PlaylistsApi on Api {
  ApiCallHandler<List<Playlist>> getPlaylists() {
    final call = ApiCall<List<Playlist>>(client).get('/me/playlists')
      ..params({
        'limit': 50,
      })
      ..parseWith(
        (json) =>
            (json['items'] as List?)
                ?.map((playlist) => Playlist.fromJson(playlist))
                .toList() ??
            [],
      );
    return call.handler();
  }
}
