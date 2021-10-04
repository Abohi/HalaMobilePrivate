// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_description_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileDescEntryModel _$_$_ProfileDescEntryModelFromJson(
    Map<String, dynamic> json) {
  return _$_ProfileDescEntryModel(
    title: json['title'] as String?,
    description: json['description'] as String?,
    isOrganization: json['isOrganization'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_ProfileDescEntryModelToJson(
        _$_ProfileDescEntryModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isOrganization': instance.isOrganization,
    };
