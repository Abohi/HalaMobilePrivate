// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferDataModel _$_$_TransferDataModelFromJson(Map<String, dynamic> json) {
  return _$_TransferDataModel(
    createdAt: json['createdAt'] as String,
    recipient_code: json['recipient_code'] as String,
    details: TransferUserDetailsModel.fromJson(
        json['details'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_TransferDataModelToJson(
        _$_TransferDataModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'recipient_code': instance.recipient_code,
      'details': instance.details.toJson(),
    };
