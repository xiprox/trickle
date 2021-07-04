import 'package:floor/floor.dart';

import 'package:trickle/data/models/spotify/playlist.dart';

@dao
abstract class PlaylistDao {
  @Query('SELECT * FROM Playlist')
  Stream<List<Playlist>> findAllPlaylists();

  @Query('SELECT * FROM Playlist WHERE id IN (:ids)')
  Future<List<Playlist>> findPlaylistsById(List<String> ids);

  @Query('SELECT * FROM Playlist')
  Stream<List<Playlist>> findAllPlaylistsStream();

  @insert
  Future<int> insertPlaylist(Playlist playlist);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertPlaylists(List<Playlist> playlists);
}
