import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ratings.freezed.dart';
part 'user_ratings.g.dart';

@freezed
class UserRatingModel with _$UserRatingModel{
  const factory UserRatingModel({@Default(0.0) double communicationRating,@Default(0.0) double likelyRecommendRating,@Default(0.0) double serviceOfWorkRatinig,})=_UserRatingModel;
  factory UserRatingModel.fromJson(Map<String, dynamic> json) => _$UserRatingModelFromJson(json);
}