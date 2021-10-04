// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceTypeModel _$_$_ServiceTypeModelFromJson(Map<String, dynamic> json) {
  return _$_ServiceTypeModel(
    serviceModel: (json['serviceModel'] as List<dynamic>?)
        ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    skillModel: json['skillModel'] == null
        ? null
        : SkillModel.fromJson(json['skillModel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ServiceTypeModelToJson(
        _$_ServiceTypeModel instance) =>
    <String, dynamic>{
      'serviceModel': instance.serviceModel,
      'skillModel': instance.skillModel,
    };
