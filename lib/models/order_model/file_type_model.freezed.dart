// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'file_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileTypeModel _$FileTypeModelFromJson(Map<String, dynamic> json) {
  return _FileTypeModel.fromJson(json);
}

/// @nodoc
class _$FileTypeModelTearOff {
  const _$FileTypeModelTearOff();

  _FileTypeModel call(
      {required String fileType,
      required String fileRef,
      required String fileName}) {
    return _FileTypeModel(
      fileType: fileType,
      fileRef: fileRef,
      fileName: fileName,
    );
  }

  FileTypeModel fromJson(Map<String, Object> json) {
    return FileTypeModel.fromJson(json);
  }
}

/// @nodoc
const $FileTypeModel = _$FileTypeModelTearOff();

/// @nodoc
mixin _$FileTypeModel {
  String get fileType => throw _privateConstructorUsedError;
  String get fileRef => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileTypeModelCopyWith<FileTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileTypeModelCopyWith<$Res> {
  factory $FileTypeModelCopyWith(
          FileTypeModel value, $Res Function(FileTypeModel) then) =
      _$FileTypeModelCopyWithImpl<$Res>;
  $Res call({String fileType, String fileRef, String fileName});
}

/// @nodoc
class _$FileTypeModelCopyWithImpl<$Res>
    implements $FileTypeModelCopyWith<$Res> {
  _$FileTypeModelCopyWithImpl(this._value, this._then);

  final FileTypeModel _value;
  // ignore: unused_field
  final $Res Function(FileTypeModel) _then;

  @override
  $Res call({
    Object? fileType = freezed,
    Object? fileRef = freezed,
    Object? fileName = freezed,
  }) {
    return _then(_value.copyWith(
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileRef: fileRef == freezed
          ? _value.fileRef
          : fileRef // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FileTypeModelCopyWith<$Res>
    implements $FileTypeModelCopyWith<$Res> {
  factory _$FileTypeModelCopyWith(
          _FileTypeModel value, $Res Function(_FileTypeModel) then) =
      __$FileTypeModelCopyWithImpl<$Res>;
  @override
  $Res call({String fileType, String fileRef, String fileName});
}

/// @nodoc
class __$FileTypeModelCopyWithImpl<$Res>
    extends _$FileTypeModelCopyWithImpl<$Res>
    implements _$FileTypeModelCopyWith<$Res> {
  __$FileTypeModelCopyWithImpl(
      _FileTypeModel _value, $Res Function(_FileTypeModel) _then)
      : super(_value, (v) => _then(v as _FileTypeModel));

  @override
  _FileTypeModel get _value => super._value as _FileTypeModel;

  @override
  $Res call({
    Object? fileType = freezed,
    Object? fileRef = freezed,
    Object? fileName = freezed,
  }) {
    return _then(_FileTypeModel(
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileRef: fileRef == freezed
          ? _value.fileRef
          : fileRef // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileTypeModel implements _FileTypeModel {
  const _$_FileTypeModel(
      {required this.fileType, required this.fileRef, required this.fileName});

  factory _$_FileTypeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_FileTypeModelFromJson(json);

  @override
  final String fileType;
  @override
  final String fileRef;
  @override
  final String fileName;

  @override
  String toString() {
    return 'FileTypeModel(fileType: $fileType, fileRef: $fileRef, fileName: $fileName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileTypeModel &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)) &&
            (identical(other.fileRef, fileRef) ||
                const DeepCollectionEquality()
                    .equals(other.fileRef, fileRef)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fileType) ^
      const DeepCollectionEquality().hash(fileRef) ^
      const DeepCollectionEquality().hash(fileName);

  @JsonKey(ignore: true)
  @override
  _$FileTypeModelCopyWith<_FileTypeModel> get copyWith =>
      __$FileTypeModelCopyWithImpl<_FileTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FileTypeModelToJson(this);
  }
}

abstract class _FileTypeModel implements FileTypeModel {
  const factory _FileTypeModel(
      {required String fileType,
      required String fileRef,
      required String fileName}) = _$_FileTypeModel;

  factory _FileTypeModel.fromJson(Map<String, dynamic> json) =
      _$_FileTypeModel.fromJson;

  @override
  String get fileType => throw _privateConstructorUsedError;
  @override
  String get fileRef => throw _privateConstructorUsedError;
  @override
  String get fileName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FileTypeModelCopyWith<_FileTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
