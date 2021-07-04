import 'package:trickle/data/local/db/db.dart';
import 'package:trickle/data/models/database/flow.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:trickle/services/services.dart';

abstract class FlowRepo {
  Stream<List<Flow>> getAllFlows();
  Stream<List<Flow>> getAllFlowsWithPlaylistStream(String playlistId);
  Stream<int> flowsCountStream();
  Future<int> createFlow(List<Playlist> playlists);
}

class FlowRepoImpl extends FlowRepo {
  final _db = get<Db>();

  @override
  Stream<List<Flow>> getAllFlows() {
    return _db.flows.findAllFlowsStream();
  }

  @override
  Stream<List<Flow>> getAllFlowsWithPlaylistStream(String playlistId) {
    final stream = _db.flows.findAllFlowsStream();
    return stream.map((flows) {
      return flows
          .where((flow) => flow.playlists.contains(playlistId))
          .toList();
    });
  }

  @override
  Stream<int> flowsCountStream() {
    return _db.flows.findAllFlowsStream().map((flows) => flows.length);
  }

  @override
  Future<int> createFlow(List<Playlist> playlists) {
    final flow = Flow(null, playlists.map((it) => it.id!).toList());
    return _db.flows.insertFlow(flow);
  }
}
