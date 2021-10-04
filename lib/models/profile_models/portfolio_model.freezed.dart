// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'portfolio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PortfolioModel _$PortfolioModelFromJson(Map<String, dynamic> json) {
  return _PortfolioModel.fromJson(json);
}

/// @nodoc
class _$PortfolioModelTearOff {
  const _$PortfolioModelTearOff();

  _PortfolioModel call(
      {required String? photoUrl,
      String? project_name,
      List<String>? skills,
      String? documentId}) {
    return _PortfolioModel(
      photoUrl: photoUrl,
      project_name: project_name,
      skills: skills,
      documentId: documentId,
    );
  }

  PortfolioModel fromJson(Map<String, Object> json) {
    return PortfolioModel.fromJson(json);
  }
}

/// @nodoc
const $PortfolioModel = _$PortfolioModelTearOff();

/// @nodoc
mixin _$PortfolioModel {
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get project_name => throw _privateConstructorUsedError;
  List<String>? get skills => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioModelCopyWith<PortfolioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioModelCopyWith<$Res> {
  factory $PortfolioModelCopyWith(
          PortfolioModel value, $Res Function(PortfolioModel) then) =
      _$PortfolioModelCopyWithImpl<$Res>;
  $Res call(
      {String? photoUrl,
      String? project_name,
      List<String>? skills,
      String? documentId});
}

/// @nodoc
class _$PortfolioModelCopyWithImpl<$Res>
    implements $PortfolioModelCopyWith<$Res> {
  _$PortfolioModelCopyWithImpl(this._value, this._then);

  final PortfolioModel _value;
  // ignore: unused_field
  final $Res Function(PortfolioModel) _then;

  @override
  $Res call({
    Object? photoUrl = freezed,
    Object? project_name = freezed,
    Object? skills = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_value.copyWith(
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      project_name: project_name == freezed
          ? _value.project_name
          : project_name // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PortfolioModelCopyWith<$Res>
    implements $PortfolioModelCopyWith<$Res> {
  factory _$PortfolioModelCopyWith(
          _PortfolioModel value, $Res Function(_PortfolioModel) then) =
      __$PortfolioModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? photoUrl,
      String? project_name,
      List<String>? skills,
      String? documentId});
}

/// @nodoc
class __$PortfolioModelCopyWithImpl<$Res>
    extends _$PortfolioModelCopyWithImpl<$Res>
    implements _$PortfolioModelCopyWith<$Res> {
  __$PortfolioModelCopyWithImpl(
      _PortfolioModel _value, $Res Function(_PortfolioModel) _then)
      : super(_value, (v) => _then(v as _PortfolioModel));

  @override
  _PortfolioModel get _value => super._value as _PortfolioModel;

  @override
  $Res call({
    Object? photoUrl = freezed,
    Object? project_name = freezed,
    Object? skills = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_PortfolioModel(
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      project_name: project_name == freezed
          ? _value.project_name
          : project_name // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PortfolioModel implements _PortfolioModel {
  const _$_PortfolioModel(
      {required this.photoUrl,
      this.project_name,
      this.skills,
      this.documentId});

  factory _$_PortfolioModel.fromJson(Map<String, dynamic> json) =>
      _$_$_PortfolioModelFromJson(json);

  @override
  final String? photoUrl;
  @override
  final String? project_name;
  @override
  final List<String>? skills;
  @override
  final String? documentId;

  @override
  String toString() {
    return 'PortfolioModel(photoUrl: $photoUrl, project_name: $project_name, skills: $skills, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PortfolioModel &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.project_name, project_name) ||
                const DeepCollectionEquality()
                    .equals(other.project_name, project_name)) &&
            (identical(other.skills, skills) ||
                const DeepCollectionEquality().equals(other.skills, skills)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(project_name) ^
      const DeepCollectionEquality().hash(skills) ^
      const DeepCollectionEquality().hash(documentId);

  @JsonKey(ignore: true)
  @override
  _$PortfolioModelCopyWith<_PortfolioModel> get copyWith =>
      __$PortfolioModelCopyWithImpl<_PortfolioModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PortfolioModelToJson(this);
  }
}

abstract class _PortfolioModel implements PortfolioModel {
  const factory _PortfolioModel(
      {required String? photoUrl,
      String? project_name,
      List<String>? skills,
      String? documentId}) = _$_PortfolioModel;

  factory _PortfolioModel.fromJson(Map<String, dynamic> json) =
      _$_PortfolioModel.fromJson;

  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  String? get project_name => throw _privateConstructorUsedError;
  @override
  List<String>? get skills => throw _privateConstructorUsedError;
  @override
  String? get documentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PortfolioModelCopyWith<_PortfolioModel> get copyWith =>
      throw _privateConstructorUsedError;
}
