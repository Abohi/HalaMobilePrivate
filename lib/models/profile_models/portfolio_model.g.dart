// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PortfolioModel _$_$_PortfolioModelFromJson(Map<String, dynamic> json) {
  return _$_PortfolioModel(
    photoUrl: json['photoUrl'] as String?,
    project_name: json['project_name'] as String?,
    skills:
        (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
    documentId: json['documentId'] as String?,
  );
}

Map<String, dynamic> _$_$_PortfolioModelToJson(_$_PortfolioModel instance) =>
    <String, dynamic>{
      'photoUrl': instance.photoUrl,
      'project_name': instance.project_name,
      'skills': instance.skills,
      'documentId': instance.documentId,
    };
