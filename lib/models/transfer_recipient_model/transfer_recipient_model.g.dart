// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_recipient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferRecipientModel _$_$_TransferRecipientModelFromJson(
    Map<String, dynamic> json) {
  return _$_TransferRecipientModel(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: TransferDataModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_TransferRecipientModelToJson(
        _$_TransferRecipientModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };
