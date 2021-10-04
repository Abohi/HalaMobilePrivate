// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'service_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceTypeModel _$ServiceTypeModelFromJson(Map<String, dynamic> json) {
  return _ServiceTypeModel.fromJson(json);
}

/// @nodoc
class _$ServiceTypeModelTearOff {
  const _$ServiceTypeModelTearOff();

  _ServiceTypeModel call(
      {required List<ServiceModel>? serviceModel,
      required SkillModel? skillModel}) {
    return _ServiceTypeModel(
      serviceModel: serviceModel,
      skillModel: skillModel,
    );
  }

  ServiceTypeModel fromJson(Map<String, Object> json) {
    return ServiceTypeModel.fromJson(json);
  }
}

/// @nodoc
const $ServiceTypeModel = _$ServiceTypeModelTearOff();

/// @nodoc
mixin _$ServiceTypeModel {
  List<ServiceModel>? get serviceModel => throw _privateConstructorUsedError;
  SkillModel? get skillModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceTypeModelCopyWith<ServiceTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceTypeModelCopyWith<$Res> {
  factory $ServiceTypeModelCopyWith(
          ServiceTypeModel value, $Res Function(ServiceTypeModel) then) =
      _$ServiceTypeModelCopyWithImpl<$Res>;
  $Res call({List<ServiceModel>? serviceModel, SkillModel? skillModel});

  $SkillModelCopyWith<$Res>? get skillModel;
}

/// @nodoc
class _$ServiceTypeModelCopyWithImpl<$Res>
    implements $ServiceTypeModelCopyWith<$Res> {
  _$ServiceTypeModelCopyWithImpl(this._value, this._then);

  final ServiceTypeModel _value;
  // ignore: unused_field
  final $Res Function(ServiceTypeModel) _then;

  @override
  $Res call({
    Object? serviceModel = freezed,
    Object? skillModel = freezed,
  }) {
    return _then(_value.copyWith(
      serviceModel: serviceModel == freezed
          ? _value.serviceModel
          : serviceModel // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>?,
      skillModel: skillModel == freezed
          ? _value.skillModel
          : skillModel // ignore: cast_nullable_to_non_nullable
              as SkillModel?,
    ));
  }

  @override
  $SkillModelCopyWith<$Res>? get skillModel {
    if (_value.skillModel == null) {
      return null;
    }

    return $SkillModelCopyWith<$Res>(_value.skillModel!, (value) {
      return _then(_value.copyWith(skillModel: value));
    });
  }
}

/// @nodoc
abstract class _$ServiceTypeModelCopyWith<$Res>
    implements $ServiceTypeModelCopyWith<$Res> {
  factory _$ServiceTypeModelCopyWith(
          _ServiceTypeModel value, $Res Function(_ServiceTypeModel) then) =
      __$ServiceTypeModelCopyWithImpl<$Res>;
  @override
  $Res call({List<ServiceModel>? serviceModel, SkillModel? skillModel});

  @override
  $SkillModelCopyWith<$Res>? get skillModel;
}

/// @nodoc
class __$ServiceTypeModelCopyWithImpl<$Res>
    extends _$ServiceTypeModelCopyWithImpl<$Res>
    implements _$ServiceTypeModelCopyWith<$Res> {
  __$ServiceTypeModelCopyWithImpl(
      _ServiceTypeModel _value, $Res Function(_ServiceTypeModel) _then)
      : super(_value, (v) => _then(v as _ServiceTypeModel));

  @override
  _ServiceTypeModel get _value => super._value as _ServiceTypeModel;

  @override
  $Res call({
    Object? serviceModel = freezed,
    Object? skillModel = freezed,
  }) {
    return _then(_ServiceTypeModel(
      serviceModel: serviceModel == freezed
          ? _value.serviceModel
          : serviceModel // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>?,
      skillModel: skillModel == freezed
          ? _value.skillModel
          : skillModel // ignore: cast_nullable_to_non_nullable
              as SkillModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceTypeModel implements _ServiceTypeModel {
  const _$_ServiceTypeModel(
      {required this.serviceModel, required this.skillModel});

  factory _$_ServiceTypeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceTypeModelFromJson(json);

  @override
  final List<ServiceModel>? serviceModel;
  @override
  final SkillModel? skillModel;

  @override
  String toString() {
    return 'ServiceTypeModel(serviceModel: $serviceModel, skillModel: $skillModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceTypeModel &&
            (identical(other.serviceModel, serviceModel) ||
                const DeepCollectionEquality()
                    .equals(other.serviceModel, serviceModel)) &&
            (identical(other.skillModel, skillModel) ||
                const DeepCollectionEquality()
                    .equals(other.skillModel, skillModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(serviceModel) ^
      const DeepCollectionEquality().hash(skillModel);

  @JsonKey(ignore: true)
  @override
  _$ServiceTypeModelCopyWith<_ServiceTypeModel> get copyWith =>
      __$ServiceTypeModelCopyWithImpl<_ServiceTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceTypeModelToJson(this);
  }
}

abstract class _ServiceTypeModel implements ServiceTypeModel {
  const factory _ServiceTypeModel(
      {required List<ServiceModel>? serviceModel,
      required SkillModel? skillModel}) = _$_ServiceTypeModel;

  factory _ServiceTypeModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceTypeModel.fromJson;

  @override
  List<ServiceModel>? get serviceModel => throw _privateConstructorUsedError;
  @override
  SkillModel? get skillModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceTypeModelCopyWith<_ServiceTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
