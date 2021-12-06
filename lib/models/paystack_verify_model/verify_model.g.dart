// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyModel _$_$_VerifyModelFromJson(Map<String, dynamic> json) {
  return _$_VerifyModel(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: VerifyDataModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_VerifyModelToJson(_$_VerifyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };
