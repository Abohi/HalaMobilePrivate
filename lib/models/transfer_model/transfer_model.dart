import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_model.freezed.dart';
part 'transfer_model.g.dart';

@freezed
class TransferModel with _$TransferModel{
  const factory TransferModel({required String source,required String amount,required String recipient,required String reason})=_TransferModel;
  factory TransferModel.fromJson(Map<String, dynamic> json) => _$TransferModelFromJson(json);
}



