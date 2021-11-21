// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RatingModel _$_$_RatingModelFromJson(Map<String, dynamic> json) {
  return _$_RatingModel(
    buyersTestimony: json['buyersTestimony'] as String,
    sellersCommunication: (json['sellersCommunication'] as num).toDouble(),
    serviceWork: (json['serviceWork'] as num).toDouble(),
    likelyRecommend: (json['likelyRecommend'] as num).toDouble(),
    sellerId: json['sellerId'] as String,
    ratingId: json['ratingId'] as String?,
  );
}

Map<String, dynamic> _$_$_RatingModelToJson(_$_RatingModel instance) =>
    <String, dynamic>{
      'buyersTestimony': instance.buyersTestimony,
      'sellersCommunication': instance.sellersCommunication,
      'serviceWork': instance.serviceWork,
      'likelyRecommend': instance.likelyRecommend,
      'sellerId': instance.sellerId,
      'ratingId': instance.ratingId,
    };
