import 'package:hive/hive.dart';
import 'package:trickle/utils/hive_utils.dart';

@HiveType(typeId: HiveTypes.trickleLink)
class TrickleLink {
  @HiveField(0)
  final String sourceId;

  @HiveField(1)
  final String targetId;

  TrickleLink({required this.sourceId, required this.targetId});
}
