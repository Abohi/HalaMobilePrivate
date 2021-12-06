import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'modification_model.freezed.dart';
part 'modification_model.g.dart';

@freezed
class ModificationModel with _$ModificationModel{
  const factory ModificationModel({required String reason,required String buyerId,required String sellerId,
    @JsonKey(
  name: "createdDate",
  fromJson: dateTimeFromJson,
  toJson: dateTimeToJson,
  )DateTime? createdDate,
  required String requestTitle,@JsonKey(
      name: "time",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson,
    )  DateTime? time,@JsonKey(
  name: "decisionTime",
  fromJson: dateTimeFromJson,
  toJson: dateTimeToJson,
  )DateTime? decisionTime,String? modificationId})=_ModificationModel;
  factory ModificationModel.fromJson(Map<String, dynamic> json) => _$ModificationModelFromJson(json);
}

DateTime? dateTimeFromJson(Timestamp? timestamp) {
  if(timestamp==null)
    return null;
  return timestamp.toDate();
}

Timestamp dateTimeToJson(DateTime? date) => Timestamp.fromDate(date!);