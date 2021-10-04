// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'skill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) {
  return _SkillModel.fromJson(json);
}

/// @nodoc
class _$SkillModelTearOff {
  const _$SkillModelTearOff();

  _SkillModel call({required List<String?> skills}) {
    return _SkillModel(
      skills: skills,
    );
  }

  SkillModel fromJson(Map<String, Object> json) {
    return SkillModel.fromJson(json);
  }
}

/// @nodoc
const $SkillModel = _$SkillModelTearOff();

/// @nodoc
mixin _$SkillModel {
  List<String?> get skills => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkillModelCopyWith<SkillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillModelCopyWith<$Res> {
  factory $SkillModelCopyWith(
          SkillModel value, $Res Function(SkillModel) then) =
      _$SkillModelCopyWithImpl<$Res>;
  $Res call({List<String?> skills});
}

/// @nodoc
class _$SkillModelCopyWithImpl<$Res> implements $SkillModelCopyWith<$Res> {
  _$SkillModelCopyWithImpl(this._value, this._then);

  final SkillModel _value;
  // ignore: unused_field
  final $Res Function(SkillModel) _then;

  @override
  $Res call({
    Object? skills = freezed,
  }) {
    return _then(_value.copyWith(
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc
abstract class _$SkillModelCopyWith<$Res> implements $SkillModelCopyWith<$Res> {
  factory _$SkillModelCopyWith(
          _SkillModel value, $Res Function(_SkillModel) then) =
      __$SkillModelCopyWithImpl<$Res>;
  @override
  $Res call({List<String?> skills});
}

/// @nodoc
class __$SkillModelCopyWithImpl<$Res> extends _$SkillModelCopyWithImpl<$Res>
    implements _$SkillModelCopyWith<$Res> {
  __$SkillModelCopyWithImpl(
      _SkillModel _value, $Res Function(_SkillModel) _then)
      : super(_value, (v) => _then(v as _SkillModel));

  @override
  _SkillModel get _value => super._value as _SkillModel;

  @override
  $Res call({
    Object? skills = freezed,
  }) {
    return _then(_SkillModel(
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SkillModel implements _SkillModel {
  const _$_SkillModel({required this.skills});

  factory _$_SkillModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SkillModelFromJson(json);

  @override
  final List<String?> skills;

  @override
  String toString() {
    return 'SkillModel(skills: $skills)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SkillModel &&
            (identical(other.skills, skills) ||
                const DeepCollectionEquality().equals(other.skills, skills)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(skills);

  @JsonKey(ignore: true)
  @override
  _$SkillModelCopyWith<_SkillModel> get copyWith =>
      __$SkillModelCopyWithImpl<_SkillModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SkillModelToJson(this);
  }
}

abstract class _SkillModel implements SkillModel {
  const factory _SkillModel({required List<String?> skills}) = _$_SkillModel;

  factory _SkillModel.fromJson(Map<String, dynamic> json) =
      _$_SkillModel.fromJson;

  @override
  List<String?> get skills => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SkillModelCopyWith<_SkillModel> get copyWith =>
      throw _privateConstructorUsedError;
}
