// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      height: json['height'] as int?,
      id: json['id'] as String?,
      isActive: json['is_active'] as bool?,
      isPrivateSession: json['is_private_session'] as bool?,
      isRestricted: json['is_restricted'] as bool?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      volumePercent: json['volume_percent'] as int?,
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'height': instance.height,
      'id': instance.id,
      'is_active': instance.isActive,
      'is_private_session': instance.isPrivateSession,
      'is_restricted': instance.isRestricted,
      'name': instance.name,
      'type': instance.type,
      'volume_percent': instance.volumePercent,
    };
