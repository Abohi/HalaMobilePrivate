import 'package:freezed_annotation/freezed_annotation.dart';

part 'states_model.freezed.dart';
part 'states_model.g.dart';

@freezed
class StateModel with _$StateModel{
  const factory StateModel({required String? state,required List<String>? lgas})=_StateModel;
  factory StateModel.fromJson(Map<String, dynamic> json) => _$StateModelFromJson(json);
}
