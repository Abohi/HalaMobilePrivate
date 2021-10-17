// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfferModel _$_$_OfferModelFromJson(Map<String, dynamic> json) {
  return _$_OfferModel(
    description: json['description'] as String,
    amount: json['amount'] as String,
    selectedDuration: json['selectedDuration'] as String,
    selectedDurationInWords: json['selectedDurationInWords'] as String,
    sellerId: json['sellerId'] as String?,
    requestId: json['requestId'] as String?,
    dateOfDelivery: DateTime.parse(json['dateOfDelivery'] as String),
  );
}

Map<String, dynamic> _$_$_OfferModelToJson(_$_OfferModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'amount': instance.amount,
      'selectedDuration': instance.selectedDuration,
      'selectedDurationInWords': instance.selectedDurationInWords,
      'sellerId': instance.sellerId,
      'requestId': instance.requestId,
      'dateOfDelivery': instance.dateOfDelivery.toIso8601String(),
    };
