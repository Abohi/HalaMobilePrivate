// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActiveServiceModel _$_$_ActiveServiceModelFromJson(
    Map<String, dynamic> json) {
  return _$_ActiveServiceModel(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => BankDataModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ActiveServiceModelToJson(
        _$_ActiveServiceModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
