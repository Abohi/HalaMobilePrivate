// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationModel _$_$_LocationModelFromJson(Map<String, dynamic> json) {
  return _$_LocationModel(
    localGovt: json['localGovt'] as String,
    streetAddress: json['streetAddress'] as String,
    state: json['state'] as String,
    documentId: json['documentId'] as String?,
  );
}

Map<String, dynamic> _$_$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'localGovt': instance.localGovt,
      'streetAddress': instance.streetAddress,
      'state': instance.state,
      'documentId': instance.documentId,
    };
