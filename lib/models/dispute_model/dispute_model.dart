import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispute_model.freezed.dart';
part 'dispute_model.g.dart';

@freezed
class DisputeModel with _$DisputeModel{
  const factory DisputeModel({required String ticketType,required String reason,required DateTime disputeCreatedTime,required String buyerId,required String sellerId,required bool disputeStatus,String? disputeId})=_DisputeModel;
  factory DisputeModel.fromJson(Map<String, dynamic> json) => _$DisputeModelFromJson(json);
}