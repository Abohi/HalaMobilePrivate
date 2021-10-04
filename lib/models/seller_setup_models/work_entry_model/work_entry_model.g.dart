// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkEntryModel _$_$_WorkEntryModelFromJson(Map<String, dynamic> json) {
  return _$_WorkEntryModel(
    companyName: json['companyName'] as String?,
    country: json['country'] as String?,
    positionHeld: json['positionHeld'] as String?,
    dateWorkedFrom: json['dateWorkedFrom'] == null
        ? null
        : DateTime.parse(json['dateWorkedFrom'] as String),
    dateResigned: json['dateResigned'] == null
        ? null
        : DateTime.parse(json['dateResigned'] as String),
    documentId: json['documentId'] as String?,
  );
}

Map<String, dynamic> _$_$_WorkEntryModelToJson(_$_WorkEntryModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'country': instance.country,
      'positionHeld': instance.positionHeld,
      'dateWorkedFrom': instance.dateWorkedFrom?.toIso8601String(),
      'dateResigned': instance.dateResigned?.toIso8601String(),
      'documentId': instance.documentId,
    };
