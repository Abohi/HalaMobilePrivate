// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orgdetail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrgDetailModel _$_$_OrgDetailModelFromJson(Map<String, dynamic> json) {
  return _$_OrgDetailModel(
    companiesName: json['companiesName'] as String,
    companiesDescription: json['companiesDescription'] as String,
    companiesNumber: json['companiesNumber'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    dateFounded: DateTime.parse(json['dateFounded'] as String),
  );
}

Map<String, dynamic> _$_$_OrgDetailModelToJson(_$_OrgDetailModel instance) =>
    <String, dynamic>{
      'companiesName': instance.companiesName,
      'companiesDescription': instance.companiesDescription,
      'companiesNumber': instance.companiesNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateFounded': instance.dateFounded.toIso8601String(),
    };
