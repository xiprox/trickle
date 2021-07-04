// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: json['id'] as String?,
      name: json['name'] as String?,
      albumType: json['album_type'] as String?,
      externalUrls: (json['external_urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      href: json['href'] as String?,
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      releaseDatePrecision: json['release_date_precision'] as String?,
      totalTracks: json['total_tracks'] as int?,
      album: json['type'] as String?,
      uri: json['uri'] as String?,
    )
      ..artists = (json['artists'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
          .toList()
      ..images = (json['images'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Image.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'album_type': instance.albumType,
      'artists': instance.artists,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'images': instance.images,
      'release_date': instance.releaseDate?.toIso8601String(),
      'release_date_precision': instance.releaseDatePrecision,
      'total_tracks': instance.totalTracks,
      'type': instance.album,
      'uri': instance.uri,
    };
