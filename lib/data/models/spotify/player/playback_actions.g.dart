// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaybackActions _$PlaybackActionsFromJson(Map<String, dynamic> json) =>
    PlaybackActions(
      disallows: (json['disallows'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool?),
      ),
    );

Map<String, dynamic> _$PlaybackActionsToJson(PlaybackActions instance) =>
    <String, dynamic>{
      'disallows': instance.disallows,
    };
