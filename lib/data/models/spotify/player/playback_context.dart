import 'package:json_annotation/json_annotation.dart';

part 'playback_context.g.dart';

@JsonSerializable()
class PlaybackContext {
  @JsonKey(name: 'external_urls')
  final Map<String, String?>? externalUrls;

  @JsonKey(name: 'href')
  final String? href;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'uri')
  final String? uri;

  PlaybackContext({
    this.externalUrls,
    this.href,
    this.type,
    this.uri,
  });

  factory PlaybackContext.fromJson(Map<String, dynamic> json) =>
      _$PlaybackContextFromJson(json);
  Map<String, dynamic> toJson() => _$PlaybackContextToJson(this);
}
