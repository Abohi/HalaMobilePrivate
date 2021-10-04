// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EducationEntryModel _$_$_EducationEntryModelFromJson(
    Map<String, dynamic> json) {
  return _$_EducationEntryModel(
    schoolName: json['schoolName'] as String?,
    areaOfStudy: json['areaOfStudy'] as String?,
    degree: json['degree'] as String?,
    dateAttended: json['dateAttended'] == null
        ? null
        : DateTime.parse(json['dateAttended'] as String),
    dateEnded: json['dateEnded'] == null
        ? null
        : DateTime.parse(json['dateEnded'] as String),
    documentId: json['documentId'] as String?,
  );
}

Map<String, dynamic> _$_$_EducationEntryModelToJson(
        _$_EducationEntryModel instance) =>
    <String, dynamic>{
      'schoolName': instance.schoolName,
      'areaOfStudy': instance.areaOfStudy,
      'degree': instance.degree,
      'dateAttended': instance.dateAttended?.toIso8601String(),
      'dateEnded': instance.dateEnded?.toIso8601String(),
      'documentId': instance.documentId,
    };
