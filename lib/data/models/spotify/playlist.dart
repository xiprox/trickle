import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'playlist.g.dart';

@Entity()
@JsonSerializable()
class Playlist {
  @PrimaryKey()
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'collaborative')
  final bool? collaborative;

  @ignore
  @JsonKey(name: 'external_urls')
  final Map<String, String>? externalUrls;

  @JsonKey(name: 'href')
  final String? href;

  @JsonKey(name: 'images')
  final List<Image>? images;

  @JsonKey(name: 'name')
  final String? name;

  @ignore
  @JsonKey(name: 'owner')
  final dynamic owner; // TODO: Type

  @JsonKey(name: 'public')
  final bool? public;

  @JsonKey(name: 'snapshot_id')
  final String? snapshotId;

  @ignore
  @JsonKey(name: 'tracks')
  final PlaylistTracks? tracks;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'uri')
  final String? uri;

  Playlist({
    this.collaborative,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}

@JsonSerializable()
class PlaylistTracks {
  @JsonKey(name: 'href')
  final String? href;

  @JsonKey(name: 'total')
  final int? total;

  PlaylistTracks({
    this.href,
    this.total,
  });

  factory PlaylistTracks.fromJson(Map<String, dynamic> json) =>
      _$PlaylistTracksFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistTracksToJson(this);
}
