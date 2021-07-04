import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  @JsonKey(name: 'height')
  final int? height;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'is_active')
  final bool? isActive;

  @JsonKey(name: 'is_private_session')
  final bool? isPrivateSession;

  @JsonKey(name: 'is_restricted')
  final bool? isRestricted;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'volume_percent')
  final int? volumePercent;

  Device({
    this.height,
    this.id,
    this.isActive,
    this.isPrivateSession,
    this.isRestricted,
    this.name,
    this.type,
    this.volumePercent,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
