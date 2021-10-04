import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_model.freezed.dart';
part 'portfolio_model.g.dart';

@freezed
class PortfolioModel with _$PortfolioModel{
  const factory PortfolioModel({required String? photoUrl,String? project_name,List<String>?skills,String?documentId})=_PortfolioModel;
  factory PortfolioModel.fromJson(Map<String, dynamic> json) => _$PortfolioModelFromJson(json);
}

