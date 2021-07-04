import 'package:veee/veee.dart';
import 'package:trickle/data/models/database/flow.dart';
import 'package:trickle/services/services.dart';

class FlowsViewModel extends ViewModel {
  final _flowRepo = get<FlowRepo>();

  late Stream<List<Flow>> flows = _flowRepo.getAllFlows();
}
