// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferResponseModel _$_$_TransferResponseModelFromJson(
    Map<String, dynamic> json) {
  return _$_TransferResponseModel(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: TransferResponseDataModel.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_TransferResponseModelToJson(
        _$_TransferResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };
