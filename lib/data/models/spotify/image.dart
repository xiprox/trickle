import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  @JsonKey(name: 'height')
  final int? height;

  @JsonKey(name: 'width')
  final int? width;

  @JsonKey(name: 'url')
  final String? url;

  Image({this.height, this.width, this.url});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
