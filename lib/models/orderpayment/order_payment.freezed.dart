// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderPaymentModel _$OrderPaymentModelFromJson(Map<String, dynamic> json) {
  return _OrderPaymentModel.fromJson(json);
}

/// @nodoc
class _$OrderPaymentModelTearOff {
  const _$OrderPaymentModelTearOff();

  _OrderPaymentModel call(
      {required String requestId,
      required String sellerId,
      required String buyerId,
      required String orderId,
      required String amountPaid,
      required String paymentReference,
      required DateTime dateOfPayment}) {
    return _OrderPaymentModel(
      requestId: requestId,
      sellerId: sellerId,
      buyerId: buyerId,
      orderId: orderId,
      amountPaid: amountPaid,
      paymentReference: paymentReference,
      dateOfPayment: dateOfPayment,
    );
  }

  OrderPaymentModel fromJson(Map<String, Object> json) {
    return OrderPaymentModel.fromJson(json);
  }
}

/// @nodoc
const $OrderPaymentModel = _$OrderPaymentModelTearOff();

/// @nodoc
mixin _$OrderPaymentModel {
  String get requestId => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;
  String get buyerId => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get amountPaid => throw _privateConstructorUsedError;
  String get paymentReference => throw _privateConstructorUsedError;
  DateTime get dateOfPayment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderPaymentModelCopyWith<OrderPaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentModelCopyWith<$Res> {
  factory $OrderPaymentModelCopyWith(
          OrderPaymentModel value, $Res Function(OrderPaymentModel) then) =
      _$OrderPaymentModelCopyWithImpl<$Res>;
  $Res call(
      {String requestId,
      String sellerId,
      String buyerId,
      String orderId,
      String amountPaid,
      String paymentReference,
      DateTime dateOfPayment});
}

/// @nodoc
class _$OrderPaymentModelCopyWithImpl<$Res>
    implements $OrderPaymentModelCopyWith<$Res> {
  _$OrderPaymentModelCopyWithImpl(this._value, this._then);

  final OrderPaymentModel _value;
  // ignore: unused_field
  final $Res Function(OrderPaymentModel) _then;

  @override
  $Res call({
    Object? requestId = freezed,
    Object? sellerId = freezed,
    Object? buyerId = freezed,
    Object? orderId = freezed,
    Object? amountPaid = freezed,
    Object? paymentReference = freezed,
    Object? dateOfPayment = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      amountPaid: amountPaid == freezed
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as String,
      paymentReference: paymentReference == freezed
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfPayment: dateOfPayment == freezed
          ? _value.dateOfPayment
          : dateOfPayment // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$OrderPaymentModelCopyWith<$Res>
    implements $OrderPaymentModelCopyWith<$Res> {
  factory _$OrderPaymentModelCopyWith(
          _OrderPaymentModel value, $Res Function(_OrderPaymentModel) then) =
      __$OrderPaymentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String requestId,
      String sellerId,
      String buyerId,
      String orderId,
      String amountPaid,
      String paymentReference,
      DateTime dateOfPayment});
}

/// @nodoc
class __$OrderPaymentModelCopyWithImpl<$Res>
    extends _$OrderPaymentModelCopyWithImpl<$Res>
    implements _$OrderPaymentModelCopyWith<$Res> {
  __$OrderPaymentModelCopyWithImpl(
      _OrderPaymentModel _value, $Res Function(_OrderPaymentModel) _then)
      : super(_value, (v) => _then(v as _OrderPaymentModel));

  @override
  _OrderPaymentModel get _value => super._value as _OrderPaymentModel;

  @override
  $Res call({
    Object? requestId = freezed,
    Object? sellerId = freezed,
    Object? buyerId = freezed,
    Object? orderId = freezed,
    Object? amountPaid = freezed,
    Object? paymentReference = freezed,
    Object? dateOfPayment = freezed,
  }) {
    return _then(_OrderPaymentModel(
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      amountPaid: amountPaid == freezed
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as String,
      paymentReference: paymentReference == freezed
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfPayment: dateOfPayment == freezed
          ? _value.dateOfPayment
          : dateOfPayment // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderPaymentModel implements _OrderPaymentModel {
  const _$_OrderPaymentModel(
      {required this.requestId,
      required this.sellerId,
      required this.buyerId,
      required this.orderId,
      required this.amountPaid,
      required this.paymentReference,
      required this.dateOfPayment});

  factory _$_OrderPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderPaymentModelFromJson(json);

  @override
  final String requestId;
  @override
  final String sellerId;
  @override
  final String buyerId;
  @override
  final String orderId;
  @override
  final String amountPaid;
  @override
  final String paymentReference;
  @override
  final DateTime dateOfPayment;

  @override
  String toString() {
    return 'OrderPaymentModel(requestId: $requestId, sellerId: $sellerId, buyerId: $buyerId, orderId: $orderId, amountPaid: $amountPaid, paymentReference: $paymentReference, dateOfPayment: $dateOfPayment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderPaymentModel &&
            (identical(other.requestId, requestId) ||
                const DeepCollectionEquality()
                    .equals(other.requestId, requestId)) &&
            (identical(other.sellerId, sellerId) ||
                const DeepCollectionEquality()
                    .equals(other.sellerId, sellerId)) &&
            (identical(other.buyerId, buyerId) ||
                const DeepCollectionEquality()
                    .equals(other.buyerId, buyerId)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.amountPaid, amountPaid) ||
                const DeepCollectionEquality()
                    .equals(other.amountPaid, amountPaid)) &&
            (identical(other.paymentReference, paymentReference) ||
                const DeepCollectionEquality()
                    .equals(other.paymentReference, paymentReference)) &&
            (identical(other.dateOfPayment, dateOfPayment) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfPayment, dateOfPayment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(requestId) ^
      const DeepCollectionEquality().hash(sellerId) ^
      const DeepCollectionEquality().hash(buyerId) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(amountPaid) ^
      const DeepCollectionEquality().hash(paymentReference) ^
      const DeepCollectionEquality().hash(dateOfPayment);

  @JsonKey(ignore: true)
  @override
  _$OrderPaymentModelCopyWith<_OrderPaymentModel> get copyWith =>
      __$OrderPaymentModelCopyWithImpl<_OrderPaymentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderPaymentModelToJson(this);
  }
}

abstract class _OrderPaymentModel implements OrderPaymentModel {
  const factory _OrderPaymentModel(
      {required String requestId,
      required String sellerId,
      required String buyerId,
      required String orderId,
      required String amountPaid,
      required String paymentReference,
      required DateTime dateOfPayment}) = _$_OrderPaymentModel;

  factory _OrderPaymentModel.fromJson(Map<String, dynamic> json) =
      _$_OrderPaymentModel.fromJson;

  @override
  String get requestId => throw _privateConstructorUsedError;
  @override
  String get sellerId => throw _privateConstructorUsedError;
  @override
  String get buyerId => throw _privateConstructorUsedError;
  @override
  String get orderId => throw _privateConstructorUsedError;
  @override
  String get amountPaid => throw _privateConstructorUsedError;
  @override
  String get paymentReference => throw _privateConstructorUsedError;
  @override
  DateTime get dateOfPayment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderPaymentModelCopyWith<_OrderPaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
