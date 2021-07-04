import 'package:json_annotation/json_annotation.dart';
import 'package:trickle/data/models/spotify/album.dart';
import 'package:trickle/data/models/spotify/artist.dart';

part 'playback_item.g.dart';

@JsonSerializable()
class PlaybackItem {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'album')
  final Album? album;

  @JsonKey(name: 'artists')
  final List<Artist?>? artists;

  @JsonKey(name: 'disc_number')
  final int? discNumber;

  @JsonKey(name: 'duration_ms')
  final int? durationMs;

  @JsonKey(name: 'explicit')
  final bool? explicit;

  @JsonKey(name: 'external_ids')
  final Map<String, String?>? externalIds;

  @JsonKey(name: 'external_urls')
  final Map<String, String?>? externalUrls;

  @JsonKey(name: 'href')
  final String? href;

  @JsonKey(name: 'is_local')
  final bool? isLocal;

  @JsonKey(name: 'is_playable')
  final bool? isPlayable;

  @JsonKey(name: 'popularity')
  final int? popularity;

  @JsonKey(name: 'preview_url')
  final String? previewUrl;

  @JsonKey(name: 'track_number')
  final int? trackNumber;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'uri')
  final String? uri;

  PlaybackItem({
    this.id,
    this.name,
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.isLocal,
    this.isPlayable,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory PlaybackItem.fromJson(Map<String, dynamic> json) =>
      _$PlaybackItemFromJson(json);
  Map<String, dynamic> toJson() => _$PlaybackItemToJson(this);
}
