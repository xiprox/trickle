import 'package:floor/floor.dart';
import 'package:trickle/data/models/database/flow.dart';

@dao
abstract class FlowDao {
  @Query('SELECT * FROM Flow')
  Future<List<Flow>> findAllFlows();

  @Query('SELECT * FROM Flow')
  Stream<List<Flow>> findAllFlowsStream();

  @insert
  Future<int> insertFlow(Flow flow);
}
