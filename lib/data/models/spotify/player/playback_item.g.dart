// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaybackItem _$PlaybackItemFromJson(Map<String, dynamic> json) => PlaybackItem(
      id: json['id'] as String?,
      name: json['name'] as String?,
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      discNumber: json['disc_number'] as int?,
      durationMs: json['duration_ms'] as int?,
      explicit: json['explicit'] as bool?,
      externalIds: (json['external_ids'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      externalUrls: (json['external_urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      href: json['href'] as String?,
      isLocal: json['is_local'] as bool?,
      isPlayable: json['is_playable'] as bool?,
      popularity: json['popularity'] as int?,
      previewUrl: json['preview_url'] as String?,
      trackNumber: json['track_number'] as int?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$PlaybackItemToJson(PlaybackItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'album': instance.album,
      'artists': instance.artists,
      'disc_number': instance.discNumber,
      'duration_ms': instance.durationMs,
      'explicit': instance.explicit,
      'external_ids': instance.externalIds,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'is_local': instance.isLocal,
      'is_playable': instance.isPlayable,
      'popularity': instance.popularity,
      'preview_url': instance.previewUrl,
      'track_number': instance.trackNumber,
      'type': instance.type,
      'uri': instance.uri,
    };
