// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StateModel _$_$_StateModelFromJson(Map<String, dynamic> json) {
  return _$_StateModel(
    state: json['state'] as String?,
    lgas: (json['lgas'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_StateModelToJson(_$_StateModel instance) =>
    <String, dynamic>{
      'state': instance.state,
      'lgas': instance.lgas,
    };
