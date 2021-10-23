import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'modification_model.freezed.dart';
part 'modification_model.g.dart';

@freezed
class ModificationModel with _$ModificationModel{
  const factory ModificationModel({required String reason,num? amount,String? amountString,required String buyerId,required String sellerId,
    required DateTime createdDate,
  required String requestTitle,@JsonKey(
      name: "time",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson,
    )  DateTime? time,required DateTime decisionTime})=_ModificationModel;
  factory ModificationModel.fromJson(Map<String, dynamic> json) => _$ModificationModelFromJson(json);
}

DateTime dateTimeFromJson(Timestamp timestamp) {
  return timestamp.toDate();
}

Timestamp dateTimeToJson(DateTime? date) => Timestamp.fromDate(date!);