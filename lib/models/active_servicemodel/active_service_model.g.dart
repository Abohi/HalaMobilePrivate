// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActiveServiceModel _$_$_ActiveServiceModelFromJson(
    Map<String, dynamic> json) {
  return _$_ActiveServiceModel(
    service: json['service'] as String?,
    isDefault: json['isDefault'] as bool?,
    icon: json['icon'] as String?,
    subservices: (json['subservices'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    serviceId: json['serviceId'] as String?,
  );
}

Map<String, dynamic> _$_$_ActiveServiceModelToJson(
        _$_ActiveServiceModel instance) =>
    <String, dynamic>{
      'service': instance.service,
      'isDefault': instance.isDefault,
      'icon': instance.icon,
      'subservices': instance.subservices,
      'serviceId': instance.serviceId,
    };
