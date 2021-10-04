// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'active_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActiveServiceModel _$ActiveServiceModelFromJson(Map<String, dynamic> json) {
  return _ActiveServiceModel.fromJson(json);
}

/// @nodoc
class _$ActiveServiceModelTearOff {
  const _$ActiveServiceModelTearOff();

  _ActiveServiceModel call(
      {required String? service,
      required bool? isDefault,
      required String? icon,
      required List<String>? subservices,
      String? serviceId}) {
    return _ActiveServiceModel(
      service: service,
      isDefault: isDefault,
      icon: icon,
      subservices: subservices,
      serviceId: serviceId,
    );
  }

  ActiveServiceModel fromJson(Map<String, Object> json) {
    return ActiveServiceModel.fromJson(json);
  }
}

/// @nodoc
const $ActiveServiceModel = _$ActiveServiceModelTearOff();

/// @nodoc
mixin _$ActiveServiceModel {
  String? get service => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  List<String>? get subservices => throw _privateConstructorUsedError;
  String? get serviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveServiceModelCopyWith<ActiveServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveServiceModelCopyWith<$Res> {
  factory $ActiveServiceModelCopyWith(
          ActiveServiceModel value, $Res Function(ActiveServiceModel) then) =
      _$ActiveServiceModelCopyWithImpl<$Res>;
  $Res call(
      {String? service,
      bool? isDefault,
      String? icon,
      List<String>? subservices,
      String? serviceId});
}

/// @nodoc
class _$ActiveServiceModelCopyWithImpl<$Res>
    implements $ActiveServiceModelCopyWith<$Res> {
  _$ActiveServiceModelCopyWithImpl(this._value, this._then);

  final ActiveServiceModel _value;
  // ignore: unused_field
  final $Res Function(ActiveServiceModel) _then;

  @override
  $Res call({
    Object? service = freezed,
    Object? isDefault = freezed,
    Object? icon = freezed,
    Object? subservices = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(_value.copyWith(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      subservices: subservices == freezed
          ? _value.subservices
          : subservices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ActiveServiceModelCopyWith<$Res>
    implements $ActiveServiceModelCopyWith<$Res> {
  factory _$ActiveServiceModelCopyWith(
          _ActiveServiceModel value, $Res Function(_ActiveServiceModel) then) =
      __$ActiveServiceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? service,
      bool? isDefault,
      String? icon,
      List<String>? subservices,
      String? serviceId});
}

/// @nodoc
class __$ActiveServiceModelCopyWithImpl<$Res>
    extends _$ActiveServiceModelCopyWithImpl<$Res>
    implements _$ActiveServiceModelCopyWith<$Res> {
  __$ActiveServiceModelCopyWithImpl(
      _ActiveServiceModel _value, $Res Function(_ActiveServiceModel) _then)
      : super(_value, (v) => _then(v as _ActiveServiceModel));

  @override
  _ActiveServiceModel get _value => super._value as _ActiveServiceModel;

  @override
  $Res call({
    Object? service = freezed,
    Object? isDefault = freezed,
    Object? icon = freezed,
    Object? subservices = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(_ActiveServiceModel(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      subservices: subservices == freezed
          ? _value.subservices
          : subservices // ignore: cast_nullable_to_non_nullable
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
class _$_ActiveServiceModel implements _ActiveServiceModel {
  const _$_ActiveServiceModel(
      {required this.service,
      required this.isDefault,
      required this.icon,
      required this.subservices,
      this.serviceId});

  factory _$_ActiveServiceModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ActiveServiceModelFromJson(json);

  @override
  final String? service;
  @override
  final bool? isDefault;
  @override
  final String? icon;
  @override
  final List<String>? subservices;
  @override
  final String? serviceId;

  @override
  String toString() {
    return 'ActiveServiceModel(service: $service, isDefault: $isDefault, icon: $icon, subservices: $subservices, serviceId: $serviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ActiveServiceModel &&
            (identical(other.service, service) ||
                const DeepCollectionEquality()
                    .equals(other.service, service)) &&
            (identical(other.isDefault, isDefault) ||
                const DeepCollectionEquality()
                    .equals(other.isDefault, isDefault)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.subservices, subservices) ||
                const DeepCollectionEquality()
                    .equals(other.subservices, subservices)) &&
            (identical(other.serviceId, serviceId) ||
                const DeepCollectionEquality()
                    .equals(other.serviceId, serviceId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(service) ^
      const DeepCollectionEquality().hash(isDefault) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(subservices) ^
      const DeepCollectionEquality().hash(serviceId);

  @JsonKey(ignore: true)
  @override
  _$ActiveServiceModelCopyWith<_ActiveServiceModel> get copyWith =>
      __$ActiveServiceModelCopyWithImpl<_ActiveServiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ActiveServiceModelToJson(this);
  }
}

abstract class _ActiveServiceModel implements ActiveServiceModel {
  const factory _ActiveServiceModel(
      {required String? service,
      required bool? isDefault,
      required String? icon,
      required List<String>? subservices,
      String? serviceId}) = _$_ActiveServiceModel;

  factory _ActiveServiceModel.fromJson(Map<String, dynamic> json) =
      _$_ActiveServiceModel.fromJson;

  @override
  String? get service => throw _privateConstructorUsedError;
  @override
  bool? get isDefault => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  List<String>? get subservices => throw _privateConstructorUsedError;
  @override
  String? get serviceId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ActiveServiceModelCopyWith<_ActiveServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
