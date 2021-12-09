// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return _ActiveServiceModel.fromJson(json);
}

/// @nodoc
class _$BankModelTearOff {
  const _$BankModelTearOff();

  _ActiveServiceModel call(
      {required bool status,
      required String message,
      required List<BankDataModel> data}) {
    return _ActiveServiceModel(
      status: status,
      message: message,
      data: data,
    );
  }

  BankModel fromJson(Map<String, Object> json) {
    return BankModel.fromJson(json);
  }
}

/// @nodoc
const $BankModel = _$BankModelTearOff();

/// @nodoc
mixin _$BankModel {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<BankDataModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankModelCopyWith<BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankModelCopyWith<$Res> {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) then) =
      _$BankModelCopyWithImpl<$Res>;
  $Res call({bool status, String message, List<BankDataModel> data});
}

/// @nodoc
class _$BankModelCopyWithImpl<$Res> implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._value, this._then);

  final BankModel _value;
  // ignore: unused_field
  final $Res Function(BankModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BankDataModel>,
    ));
  }
}

/// @nodoc
abstract class _$ActiveServiceModelCopyWith<$Res>
    implements $BankModelCopyWith<$Res> {
  factory _$ActiveServiceModelCopyWith(
          _ActiveServiceModel value, $Res Function(_ActiveServiceModel) then) =
      __$ActiveServiceModelCopyWithImpl<$Res>;
  @override
  $Res call({bool status, String message, List<BankDataModel> data});
}

/// @nodoc
class __$ActiveServiceModelCopyWithImpl<$Res>
    extends _$BankModelCopyWithImpl<$Res>
    implements _$ActiveServiceModelCopyWith<$Res> {
  __$ActiveServiceModelCopyWithImpl(
      _ActiveServiceModel _value, $Res Function(_ActiveServiceModel) _then)
      : super(_value, (v) => _then(v as _ActiveServiceModel));

  @override
  _ActiveServiceModel get _value => super._value as _ActiveServiceModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_ActiveServiceModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BankDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActiveServiceModel implements _ActiveServiceModel {
  const _$_ActiveServiceModel(
      {required this.status, required this.message, required this.data});

  factory _$_ActiveServiceModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ActiveServiceModelFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final List<BankDataModel> data;

  @override
  String toString() {
    return 'BankModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ActiveServiceModel &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$ActiveServiceModelCopyWith<_ActiveServiceModel> get copyWith =>
      __$ActiveServiceModelCopyWithImpl<_ActiveServiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ActiveServiceModelToJson(this);
  }
}

abstract class _ActiveServiceModel implements BankModel {
  const factory _ActiveServiceModel(
      {required bool status,
      required String message,
      required List<BankDataModel> data}) = _$_ActiveServiceModel;

  factory _ActiveServiceModel.fromJson(Map<String, dynamic> json) =
      _$_ActiveServiceModel.fromJson;

  @override
  bool get status => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  List<BankDataModel> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ActiveServiceModelCopyWith<_ActiveServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
