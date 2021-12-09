// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountInfoModel _$_$_AccountInfoModelFromJson(Map<String, dynamic> json) {
  return _$_AccountInfoModel(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: AccountInfoDataModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AccountInfoModelToJson(
        _$_AccountInfoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };
