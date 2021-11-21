import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
class RatingModel with _$RatingModel{
  const factory RatingModel({required String buyersTestimony,required double sellersCommunication,
  required double serviceWork,required double likelyRecommend,required String sellerId,String?ratingId})=_RatingModel;
  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);
}

