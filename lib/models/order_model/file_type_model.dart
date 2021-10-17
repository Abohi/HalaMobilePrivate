import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_type_model.freezed.dart';
part 'file_type_model.g.dart';

@freezed
class FileTypeModel with _$FileTypeModel{
  const factory FileTypeModel({required String fileType,required String fileRef,required String fileName})=_FileTypeModel;
  factory FileTypeModel.fromJson(Map<String, dynamic> json) => _$FileTypeModelFromJson(json);
}