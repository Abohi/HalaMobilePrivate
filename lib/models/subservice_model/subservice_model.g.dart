// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subservice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubServiceModel _$_$_SubServiceModelFromJson(Map<String, dynamic> json) {
  return _$_SubServiceModel(
    isActiveSubservice: json['isActiveSubservice'] as bool,
    userid: json['userid'] as String,
    subserviceId: json['subserviceId'] as String?,
  );
}

Map<String, dynamic> _$_$_SubServiceModelToJson(_$_SubServiceModel instance) =>
    <String, dynamic>{
      'isActiveSubservice': instance.isActiveSubservice,
      'userid': instance.userid,
      'subserviceId': instance.subserviceId,
    };
