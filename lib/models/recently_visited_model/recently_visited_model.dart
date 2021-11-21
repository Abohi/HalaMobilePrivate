import 'package:freezed_annotation/freezed_annotation.dart';

part 'recently_visited_model.freezed.dart';
part 'recently_visited_model.g.dart';

@freezed
class RecentlyVisitedModel with _$RecentlyVisitedModel{
  const factory RecentlyVisitedModel({required String sellerId})=_RecentlyVisitedModel;
  factory RecentlyVisitedModel.fromJson(Map<String, dynamic> json) => _$RecentlyVisitedModelFromJson(json);
}