import 'package:json_annotation/json_annotation.dart';
import 'package:trickle/data/models/spotify/device.dart';
import 'package:trickle/data/models/spotify/player/playback_actions.dart';
import 'package:trickle/data/models/spotify/player/playback_item.dart';

import 'playback_context.dart';

part 'current_playback.g.dart';

@JsonSerializable()
class CurrentPlayback {
  @JsonKey(name: 'device')
  final Device? device;

  @JsonKey(name: 'shuffle_state')
  final bool? shuffleState;

  @JsonKey(name: 'repeat_state')
  final String? repeatState;

  @JsonKey(name: 'context')
  final PlaybackContext? context;

  @JsonKey(name: 'progress_ms')
  final int? progressMs;

  @JsonKey(name: 'item')
  final PlaybackItem? item;

  @JsonKey(name: 'currently_playing_type')
  final String? currentlyPlayingType;

  @JsonKey(name: 'actions')
  final PlaybackActions? actions;

  @JsonKey(name: 'is_playing')
  final bool? isPlaying;

  CurrentPlayback({
    this.device,
    this.shuffleState,
    this.repeatState,
    this.context,
    this.progressMs,
    this.item,
    this.currentlyPlayingType,
    this.actions,
    this.isPlaying,
  });

  factory CurrentPlayback.fromJson(Map<String, dynamic> json) =>
      _$CurrentPlaybackFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentPlaybackToJson(this);
}
