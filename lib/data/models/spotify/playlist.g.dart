// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      collaborative: json['collaborative'] as bool?,
      externalUrls: (json['external_urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      href: json['href'] as String?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      owner: json['owner'],
      public: json['public'] as bool?,
      snapshotId: json['snapshot_id'] as String?,
      tracks: json['tracks'] == null
          ? null
          : PlaylistTracks.fromJson(json['tracks'] as Map<String, dynamic>),
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'collaborative': instance.collaborative,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'images': instance.images,
      'name': instance.name,
      'owner': instance.owner,
      'public': instance.public,
      'snapshot_id': instance.snapshotId,
      'tracks': instance.tracks,
      'type': instance.type,
      'uri': instance.uri,
    };

PlaylistTracks _$PlaylistTracksFromJson(Map<String, dynamic> json) =>
    PlaylistTracks(
      href: json['href'] as String?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PlaylistTracksToJson(PlaylistTracks instance) =>
    <String, dynamic>{
      'href': instance.href,
      'total': instance.total,
    };
