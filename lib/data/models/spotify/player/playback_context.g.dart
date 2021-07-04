// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaybackContext _$PlaybackContextFromJson(Map<String, dynamic> json) =>
    PlaybackContext(
      externalUrls: (json['external_urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      href: json['href'] as String?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$PlaybackContextToJson(PlaybackContext instance) =>
    <String, dynamic>{
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'type': instance.type,
      'uri': instance.uri,
    };
