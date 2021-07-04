import 'package:veee/veee.dart';
import 'package:trickle/services/services.dart';

class HomeViewModel extends ViewModel {
  final _flowRepo = get<FlowRepo>();

  late Stream<bool> noFlowsCreated =
      _flowRepo.flowsCountStream().map((count) => count == 0);
}
