// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return _ServiceModel.fromJson(json);
}

/// @nodoc
class _$ServiceModelTearOff {
  const _$ServiceModelTearOff();

  _ServiceModel call(
      {required String? name,
      required bool? isDafault,
      required String? icon,
      required List<String>? value,
      String? serviceId}) {
    return _ServiceModel(
      name: name,
      isDafault: isDafault,
      icon: icon,
      value: value,
      serviceId: serviceId,
    );
  }

  ServiceModel fromJson(Map<String, Object> json) {
    return ServiceModel.fromJson(json);
  }
}

/// @nodoc
const $ServiceModel = _$ServiceModelTearOff();

/// @nodoc
mixin _$ServiceModel {
  String? get name => throw _privateConstructorUsedError;
  bool? get isDafault => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  List<String>? get value => throw _privateConstructorUsedError;
  String? get serviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceModelCopyWith<ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceModelCopyWith<$Res> {
  factory $ServiceModelCopyWith(
          ServiceModel value, $Res Function(ServiceModel) then) =
      _$ServiceModelCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      bool? isDafault,
      String? icon,
      List<String>? value,
      String? serviceId});
}

/// @nodoc
class _$ServiceModelCopyWithImpl<$Res> implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._value, this._then);

  final ServiceModel _value;
  // ignore: unused_field
  final $Res Function(ServiceModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? isDafault = freezed,
    Object? icon = freezed,
    Object? value = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isDafault: isDafault == freezed
          ? _value.isDafault
          : isDafault // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceModelCopyWith<$Res>
    implements $ServiceModelCopyWith<$Res> {
  factory _$ServiceModelCopyWith(
          _ServiceModel value, $Res Function(_ServiceModel) then) =
      __$ServiceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      bool? isDafault,
      String? icon,
      List<String>? value,
      String? serviceId});
}

/// @nodoc
class __$ServiceModelCopyWithImpl<$Res> extends _$ServiceModelCopyWithImpl<$Res>
    implements _$ServiceModelCopyWith<$Res> {
  __$ServiceModelCopyWithImpl(
      _ServiceModel _value, $Res Function(_ServiceModel) _then)
      : super(_value, (v) => _then(v as _ServiceModel));

  @override
  _ServiceModel get _value => super._value as _ServiceModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? isDafault = freezed,
    Object? icon = freezed,
    Object? value = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(_ServiceModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isDafault: isDafault == freezed
          ? _value.isDafault
          : isDafault // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceModel implements _ServiceModel {
  const _$_ServiceModel(
      {required this.name,
      required this.isDafault,
      required this.icon,
      required this.value,
      this.serviceId});

  factory _$_ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceModelFromJson(json);

  @override
  final String? name;
  @override
  final bool? isDafault;
  @override
  final String? icon;
  @override
  final List<String>? value;
  @override
  final String? serviceId;

  @override
  String toString() {
    return 'ServiceModel(name: $name, isDafault: $isDafault, icon: $icon, value: $value, serviceId: $serviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isDafault, isDafault) ||
                const DeepCollectionEquality()
                    .equals(other.isDafault, isDafault)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.serviceId, serviceId) ||
                const DeepCollectionEquality()
                    .equals(other.serviceId, serviceId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isDafault) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(serviceId);

  @JsonKey(ignore: true)
  @override
  _$ServiceModelCopyWith<_ServiceModel> get copyWith =>
      __$ServiceModelCopyWithImpl<_ServiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceModelToJson(this);
  }
}

abstract class _ServiceModel implements ServiceModel {
  const factory _ServiceModel(
      {required String? name,
      required bool? isDafault,
      required String? icon,
      required List<String>? value,
      String? serviceId}) = _$_ServiceModel;

  factory _ServiceModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceModel.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  bool? get isDafault => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  List<String>? get value => throw _privateConstructorUsedError;
  @override
  String? get serviceId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceModelCopyWith<_ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
