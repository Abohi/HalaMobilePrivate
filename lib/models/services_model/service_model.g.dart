// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceModel _$_$_ServiceModelFromJson(Map<String, dynamic> json) {
  return _$_ServiceModel(
    name: json['name'] as String?,
    isDafault: json['isDafault'] as bool?,
    icon: json['icon'] as String?,
    value: (json['value'] as List<dynamic>?)?.map((e) => e as String).toList(),
    serviceId: json['serviceId'] as String?,
  );
}

Map<String, dynamic> _$_$_ServiceModelToJson(_$_ServiceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isDafault': instance.isDafault,
      'icon': instance.icon,
      'value': instance.value,
      'serviceId': instance.serviceId,
    };
