import 'package:json_annotation/json_annotation.dart';

import 'artist.dart';
import 'image.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'album_type')
  final String? albumType;

  @JsonKey(name: 'artists')
  List<Artist?>? artists;

  @JsonKey(name: 'external_urls')
  final Map<String, String>? externalUrls;

  @JsonKey(name: 'href')
  final String? href;

  @JsonKey(name: 'images')
  List<Image?>? images;

  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;

  @JsonKey(name: 'release_date_precision')
  final String? releaseDatePrecision;

  @JsonKey(name: 'total_tracks')
  final int? totalTracks;

  @JsonKey(name: 'type')
  final String? album;

  @JsonKey(name: 'uri')
  final String? uri;

  Album({
    this.id,
    this.name,
    this.albumType,
    this.externalUrls,
    this.href,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.album,
    this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
