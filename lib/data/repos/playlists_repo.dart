import 'package:api_call/resource.dart';
import 'package:trickle/data/local/db/db.dart';
import 'package:trickle/data/local/db/db_query.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/services/services.dart';

abstract class PlaylistsRepo {
  Future<Resource<List<Playlist>>> getPlaylists();
  Future<List<Playlist>> getPlaylistsById(List<String> ids);
  Stream<List<Playlist>> getPlaylistsStream();
  Future savePlaylistsToDb(List<Playlist> playlists);
  Future<Resource> syncPlaylists();
}

class PlaylistsRepoImpl extends PlaylistsRepo {
  final _api = get<Api>();
  final _db = get<Db>();

  @override
  Future<Resource<List<Playlist>>> getPlaylists() {
    return _api.getPlaylists().future();
  }

  @override
  Future<List<Playlist>> getPlaylistsById(List<String> ids) {
    return _db.playlists.findPlaylistsById(ids);
  }

  @override
  Stream<List<Playlist>> getPlaylistsStream() {
    return _db.playlists.findAllPlaylistsStream();
  }

  @override
  Future savePlaylistsToDb(List<Playlist> playlists) {
    return _db.playlists.insertPlaylists(playlists);
  }

  @override
  Future<Resource> syncPlaylists() async {
    final playlists = await _api.getPlaylists().future();
    if (playlists.isSuccess()) {
      final result = await Query.future(
        () => savePlaylistsToDb(playlists.data!),
      );
      return result;
    } else {
      return playlists;
    }
  }
}
