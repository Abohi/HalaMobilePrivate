import 'package:freezed_annotation/freezed_annotation.dart';

part 'phonenumber_model.freezed.dart';
part 'phonenumber_model.g.dart';

@freezed
class PhoneNumberModel with _$PhoneNumberModel{
  const factory PhoneNumberModel({bool? isPhoneNumberVerified})=_PhoneNumberModel;
  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) => _$PhoneNumberModelFromJson(json);
}