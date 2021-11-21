// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) {
  return _RatingModel.fromJson(json);
}

/// @nodoc
class _$RatingModelTearOff {
  const _$RatingModelTearOff();

  _RatingModel call(
      {required String buyersTestimony,
      required double sellersCommunication,
      required double serviceWork,
      required double likelyRecommend,
      required String sellerId,
      String? ratingId}) {
    return _RatingModel(
      buyersTestimony: buyersTestimony,
      sellersCommunication: sellersCommunication,
      serviceWork: serviceWork,
      likelyRecommend: likelyRecommend,
      sellerId: sellerId,
      ratingId: ratingId,
    );
  }

  RatingModel fromJson(Map<String, Object> json) {
    return RatingModel.fromJson(json);
  }
}

/// @nodoc
const $RatingModel = _$RatingModelTearOff();

/// @nodoc
mixin _$RatingModel {
  String get buyersTestimony => throw _privateConstructorUsedError;
  double get sellersCommunication => throw _privateConstructorUsedError;
  double get serviceWork => throw _privateConstructorUsedError;
  double get likelyRecommend => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;
  String? get ratingId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingModelCopyWith<RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingModelCopyWith<$Res> {
  factory $RatingModelCopyWith(
          RatingModel value, $Res Function(RatingModel) then) =
      _$RatingModelCopyWithImpl<$Res>;
  $Res call(
      {String buyersTestimony,
      double sellersCommunication,
      double serviceWork,
      double likelyRecommend,
      String sellerId,
      String? ratingId});
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res> implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  final RatingModel _value;
  // ignore: unused_field
  final $Res Function(RatingModel) _then;

  @override
  $Res call({
    Object? buyersTestimony = freezed,
    Object? sellersCommunication = freezed,
    Object? serviceWork = freezed,
    Object? likelyRecommend = freezed,
    Object? sellerId = freezed,
    Object? ratingId = freezed,
  }) {
    return _then(_value.copyWith(
      buyersTestimony: buyersTestimony == freezed
          ? _value.buyersTestimony
          : buyersTestimony // ignore: cast_nullable_to_non_nullable
              as String,
      sellersCommunication: sellersCommunication == freezed
          ? _value.sellersCommunication
          : sellersCommunication // ignore: cast_nullable_to_non_nullable
              as double,
      serviceWork: serviceWork == freezed
          ? _value.serviceWork
          : serviceWork // ignore: cast_nullable_to_non_nullable
              as double,
      likelyRecommend: likelyRecommend == freezed
          ? _value.likelyRecommend
          : likelyRecommend // ignore: cast_nullable_to_non_nullable
              as double,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      ratingId: ratingId == freezed
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RatingModelCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$RatingModelCopyWith(
          _RatingModel value, $Res Function(_RatingModel) then) =
      __$RatingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String buyersTestimony,
      double sellersCommunication,
      double serviceWork,
      double likelyRecommend,
      String sellerId,
      String? ratingId});
}

/// @nodoc
class __$RatingModelCopyWithImpl<$Res> extends _$RatingModelCopyWithImpl<$Res>
    implements _$RatingModelCopyWith<$Res> {
  __$RatingModelCopyWithImpl(
      _RatingModel _value, $Res Function(_RatingModel) _then)
      : super(_value, (v) => _then(v as _RatingModel));

  @override
  _RatingModel get _value => super._value as _RatingModel;

  @override
  $Res call({
    Object? buyersTestimony = freezed,
    Object? sellersCommunication = freezed,
    Object? serviceWork = freezed,
    Object? likelyRecommend = freezed,
    Object? sellerId = freezed,
    Object? ratingId = freezed,
  }) {
    return _then(_RatingModel(
      buyersTestimony: buyersTestimony == freezed
          ? _value.buyersTestimony
          : buyersTestimony // ignore: cast_nullable_to_non_nullable
              as String,
      sellersCommunication: sellersCommunication == freezed
          ? _value.sellersCommunication
          : sellersCommunication // ignore: cast_nullable_to_non_nullable
              as double,
      serviceWork: serviceWork == freezed
          ? _value.serviceWork
          : serviceWork // ignore: cast_nullable_to_non_nullable
              as double,
      likelyRecommend: likelyRecommend == freezed
          ? _value.likelyRecommend
          : likelyRecommend // ignore: cast_nullable_to_non_nullable
              as double,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      ratingId: ratingId == freezed
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatingModel implements _RatingModel {
  const _$_RatingModel(
      {required this.buyersTestimony,
      required this.sellersCommunication,
      required this.serviceWork,
      required this.likelyRecommend,
      required this.sellerId,
      this.ratingId});

  factory _$_RatingModel.fromJson(Map<String, dynamic> json) =>
      _$_$_RatingModelFromJson(json);

  @override
  final String buyersTestimony;
  @override
  final double sellersCommunication;
  @override
  final double serviceWork;
  @override
  final double likelyRecommend;
  @override
  final String sellerId;
  @override
  final String? ratingId;

  @override
  String toString() {
    return 'RatingModel(buyersTestimony: $buyersTestimony, sellersCommunication: $sellersCommunication, serviceWork: $serviceWork, likelyRecommend: $likelyRecommend, sellerId: $sellerId, ratingId: $ratingId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RatingModel &&
            (identical(other.buyersTestimony, buyersTestimony) ||
                const DeepCollectionEquality()
                    .equals(other.buyersTestimony, buyersTestimony)) &&
            (identical(other.sellersCommunication, sellersCommunication) ||
                const DeepCollectionEquality().equals(
                    other.sellersCommunication, sellersCommunication)) &&
            (identical(other.serviceWork, serviceWork) ||
                const DeepCollectionEquality()
                    .equals(other.serviceWork, serviceWork)) &&
            (identical(other.likelyRecommend, likelyRecommend) ||
                const DeepCollectionEquality()
                    .equals(other.likelyRecommend, likelyRecommend)) &&
            (identical(other.sellerId, sellerId) ||
                const DeepCollectionEquality()
                    .equals(other.sellerId, sellerId)) &&
            (identical(other.ratingId, ratingId) ||
                const DeepCollectionEquality()
                    .equals(other.ratingId, ratingId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(buyersTestimony) ^
      const DeepCollectionEquality().hash(sellersCommunication) ^
      const DeepCollectionEquality().hash(serviceWork) ^
      const DeepCollectionEquality().hash(likelyRecommend) ^
      const DeepCollectionEquality().hash(sellerId) ^
      const DeepCollectionEquality().hash(ratingId);

  @JsonKey(ignore: true)
  @override
  _$RatingModelCopyWith<_RatingModel> get copyWith =>
      __$RatingModelCopyWithImpl<_RatingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RatingModelToJson(this);
  }
}

abstract class _RatingModel implements RatingModel {
  const factory _RatingModel(
      {required String buyersTestimony,
      required double sellersCommunication,
      required double serviceWork,
      required double likelyRecommend,
      required String sellerId,
      String? ratingId}) = _$_RatingModel;

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$_RatingModel.fromJson;

  @override
  String get buyersTestimony => throw _privateConstructorUsedError;
  @override
  double get sellersCommunication => throw _privateConstructorUsedError;
  @override
  double get serviceWork => throw _privateConstructorUsedError;
  @override
  double get likelyRecommend => throw _privateConstructorUsedError;
  @override
  String get sellerId => throw _privateConstructorUsedError;
  @override
  String? get ratingId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RatingModelCopyWith<_RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
