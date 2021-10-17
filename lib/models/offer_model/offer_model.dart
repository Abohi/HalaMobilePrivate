import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel{
  const factory OfferModel({required String description,required String amount,required String selectedDuration,required String selectedDurationInWords,String? sellerId,String? requestId,required DateTime dateOfDelivery})=_OfferModel;
  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);
}
