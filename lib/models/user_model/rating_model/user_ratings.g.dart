// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRatingModel _$_$_UserRatingModelFromJson(Map<String, dynamic> json) {
  return _$_UserRatingModel(
    communicationRating: json['communicationRating'] as num? ?? 0.0,
    likelyRecommendRating: json['likelyRecommendRating'] as num? ?? 0.0,
    serviceOfWorkRatinig: json['serviceOfWorkRatinig'] as num? ?? 0.0,
  );
}

Map<String, dynamic> _$_$_UserRatingModelToJson(_$_UserRatingModel instance) =>
    <String, dynamic>{
      'communicationRating': instance.communicationRating,
      'likelyRecommendRating': instance.likelyRecommendRating,
      'serviceOfWorkRatinig': instance.serviceOfWorkRatinig,
    };
