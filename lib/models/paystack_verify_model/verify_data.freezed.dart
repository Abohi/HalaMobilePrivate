// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'verify_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyDataModel _$VerifyDataModelFromJson(Map<String, dynamic> json) {
  return _VerifyDataModel.fromJson(json);
}

/// @nodoc
class _$VerifyDataModelTearOff {
  const _$VerifyDataModelTearOff();

  _VerifyDataModel call(
      {required String status,
      required String reference,
      required num amount,
      required String paid_at,
      required String channel}) {
    return _VerifyDataModel(
      status: status,
      reference: reference,
      amount: amount,
      paid_at: paid_at,
      channel: channel,
    );
  }

  VerifyDataModel fromJson(Map<String, Object> json) {
    return VerifyDataModel.fromJson(json);
  }
}

/// @nodoc
const $VerifyDataModel = _$VerifyDataModelTearOff();

/// @nodoc
mixin _$VerifyDataModel {
  String get status => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get paid_at => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyDataModelCopyWith<VerifyDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyDataModelCopyWith<$Res> {
  factory $VerifyDataModelCopyWith(
          VerifyDataModel value, $Res Function(VerifyDataModel) then) =
      _$VerifyDataModelCopyWithImpl<$Res>;
  $Res call(
      {String status,
      String reference,
      num amount,
      String paid_at,
      String channel});
}

/// @nodoc
class _$VerifyDataModelCopyWithImpl<$Res>
    implements $VerifyDataModelCopyWith<$Res> {
  _$VerifyDataModelCopyWithImpl(this._value, this._then);

  final VerifyDataModel _value;
  // ignore: unused_field
  final $Res Function(VerifyDataModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? reference = freezed,
    Object? amount = freezed,
    Object? paid_at = freezed,
    Object? channel = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      paid_at: paid_at == freezed
          ? _value.paid_at
          : paid_at // ignore: cast_nullable_to_non_nullable
              as String,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VerifyDataModelCopyWith<$Res>
    implements $VerifyDataModelCopyWith<$Res> {
  factory _$VerifyDataModelCopyWith(
          _VerifyDataModel value, $Res Function(_VerifyDataModel) then) =
      __$VerifyDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status,
      String reference,
      num amount,
      String paid_at,
      String channel});
}

/// @nodoc
class __$VerifyDataModelCopyWithImpl<$Res>
    extends _$VerifyDataModelCopyWithImpl<$Res>
    implements _$VerifyDataModelCopyWith<$Res> {
  __$VerifyDataModelCopyWithImpl(
      _VerifyDataModel _value, $Res Function(_VerifyDataModel) _then)
      : super(_value, (v) => _then(v as _VerifyDataModel));

  @override
  _VerifyDataModel get _value => super._value as _VerifyDataModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? reference = freezed,
    Object? amount = freezed,
    Object? paid_at = freezed,
    Object? channel = freezed,
  }) {
    return _then(_VerifyDataModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      paid_at: paid_at == freezed
          ? _value.paid_at
          : paid_at // ignore: cast_nullable_to_non_nullable
              as String,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyDataModel implements _VerifyDataModel {
  const _$_VerifyDataModel(
      {required this.status,
      required this.reference,
      required this.amount,
      required this.paid_at,
      required this.channel});

  factory _$_VerifyDataModel.fromJson(Map<String, dynamic> json) =>
      _$_$_VerifyDataModelFromJson(json);

  @override
  final String status;
  @override
  final String reference;
  @override
  final num amount;
  @override
  final String paid_at;
  @override
  final String channel;

  @override
  String toString() {
    return 'VerifyDataModel(status: $status, reference: $reference, amount: $amount, paid_at: $paid_at, channel: $channel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VerifyDataModel &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.reference, reference) ||
                const DeepCollectionEquality()
                    .equals(other.reference, reference)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.paid_at, paid_at) ||
                const DeepCollectionEquality()
                    .equals(other.paid_at, paid_at)) &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality().equals(other.channel, channel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(reference) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(paid_at) ^
      const DeepCollectionEquality().hash(channel);

  @JsonKey(ignore: true)
  @override
  _$VerifyDataModelCopyWith<_VerifyDataModel> get copyWith =>
      __$VerifyDataModelCopyWithImpl<_VerifyDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VerifyDataModelToJson(this);
  }
}

abstract class _VerifyDataModel implements VerifyDataModel {
  const factory _VerifyDataModel(
      {required String status,
      required String reference,
      required num amount,
      required String paid_at,
      required String channel}) = _$_VerifyDataModel;

  factory _VerifyDataModel.fromJson(Map<String, dynamic> json) =
      _$_VerifyDataModel.fromJson;

  @override
  String get status => throw _privateConstructorUsedError;
  @override
  String get reference => throw _privateConstructorUsedError;
  @override
  num get amount => throw _privateConstructorUsedError;
  @override
  String get paid_at => throw _privateConstructorUsedError;
  @override
  String get channel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VerifyDataModelCopyWith<_VerifyDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
