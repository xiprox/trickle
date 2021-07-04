// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_playback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentPlayback _$CurrentPlaybackFromJson(Map<String, dynamic> json) =>
    CurrentPlayback(
      device: json['device'] == null
          ? null
          : Device.fromJson(json['device'] as Map<String, dynamic>),
      shuffleState: json['shuffle_state'] as bool?,
      repeatState: json['repeat_state'] as String?,
      context: json['context'] == null
          ? null
          : PlaybackContext.fromJson(json['context'] as Map<String, dynamic>),
      progressMs: json['progress_ms'] as int?,
      item: json['item'] == null
          ? null
          : PlaybackItem.fromJson(json['item'] as Map<String, dynamic>),
      currentlyPlayingType: json['currently_playing_type'] as String?,
      actions: json['actions'] == null
          ? null
          : PlaybackActions.fromJson(json['actions'] as Map<String, dynamic>),
      isPlaying: json['is_playing'] as bool?,
    );

Map<String, dynamic> _$CurrentPlaybackToJson(CurrentPlayback instance) =>
    <String, dynamic>{
      'device': instance.device,
      'shuffle_state': instance.shuffleState,
      'repeat_state': instance.repeatState,
      'context': instance.context,
      'progress_ms': instance.progressMs,
      'item': instance.item,
      'currently_playing_type': instance.currentlyPlayingType,
      'actions': instance.actions,
      'is_playing': instance.isPlaying,
    };
