import 'package:json_annotation/json_annotation.dart';

part 'playback_actions.g.dart';

@JsonSerializable()
class PlaybackActions {
  @JsonKey(name: 'disallows')
  final Map<String, bool?>? disallows;

  PlaybackActions({
    this.disallows,
  });

  factory PlaybackActions.fromJson(Map<String, dynamic> json) =>
      _$PlaybackActionsFromJson(json);
  Map<String, dynamic> toJson() => _$PlaybackActionsToJson(this);
}
