
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel{
const factory WalletModel({required num? debitBalance,required num? creditBalance,required num? walletBalance})=_WalletModel;
factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
}