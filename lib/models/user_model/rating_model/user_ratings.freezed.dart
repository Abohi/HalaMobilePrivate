// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_ratings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRatingModel _$UserRatingModelFromJson(Map<String, dynamic> json) {
  return _UserRatingModel.fromJson(json);
}

/// @nodoc
class _$UserRatingModelTearOff {
  const _$UserRatingModelTearOff();

  _UserRatingModel call(
      {double communicationRating = 0.0,
      double likelyRecommendRating = 0.0,
      double serviceOfWorkRatinig = 0.0}) {
    return _UserRatingModel(
      communicationRating: communicationRating,
      likelyRecommendRating: likelyRecommendRating,
      serviceOfWorkRatinig: serviceOfWorkRatinig,
    );
  }

  UserRatingModel fromJson(Map<String, Object> json) {
    return UserRatingModel.fromJson(json);
  }
}

/// @nodoc
const $UserRatingModel = _$UserRatingModelTearOff();

/// @nodoc
mixin _$UserRatingModel {
  double get communicationRating => throw _privateConstructorUsedError;
  double get likelyRecommendRating => throw _privateConstructorUsedError;
  double get serviceOfWorkRatinig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRatingModelCopyWith<UserRatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRatingModelCopyWith<$Res> {
  factory $UserRatingModelCopyWith(
          UserRatingModel value, $Res Function(UserRatingModel) then) =
      _$UserRatingModelCopyWithImpl<$Res>;
  $Res call(
      {double communicationRating,
      double likelyRecommendRating,
      double serviceOfWorkRatinig});
}

/// @nodoc
class _$UserRatingModelCopyWithImpl<$Res>
    implements $UserRatingModelCopyWith<$Res> {
  _$UserRatingModelCopyWithImpl(this._value, this._then);

  final UserRatingModel _value;
  // ignore: unused_field
  final $Res Function(UserRatingModel) _then;

  @override
  $Res call({
    Object? communicationRating = freezed,
    Object? likelyRecommendRating = freezed,
    Object? serviceOfWorkRatinig = freezed,
  }) {
    return _then(_value.copyWith(
      communicationRating: communicationRating == freezed
          ? _value.communicationRating
          : communicationRating // ignore: cast_nullable_to_non_nullable
              as double,
      likelyRecommendRating: likelyRecommendRating == freezed
          ? _value.likelyRecommendRating
          : likelyRecommendRating // ignore: cast_nullable_to_non_nullable
              as double,
      serviceOfWorkRatinig: serviceOfWorkRatinig == freezed
          ? _value.serviceOfWorkRatinig
          : serviceOfWorkRatinig // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$UserRatingModelCopyWith<$Res>
    implements $UserRatingModelCopyWith<$Res> {
  factory _$UserRatingModelCopyWith(
          _UserRatingModel value, $Res Function(_UserRatingModel) then) =
      __$UserRatingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {double communicationRating,
      double likelyRecommendRating,
      double serviceOfWorkRatinig});
}

/// @nodoc
class __$UserRatingModelCopyWithImpl<$Res>
    extends _$UserRatingModelCopyWithImpl<$Res>
    implements _$UserRatingModelCopyWith<$Res> {
  __$UserRatingModelCopyWithImpl(
      _UserRatingModel _value, $Res Function(_UserRatingModel) _then)
      : super(_value, (v) => _then(v as _UserRatingModel));

  @override
  _UserRatingModel get _value => super._value as _UserRatingModel;

  @override
  $Res call({
    Object? communicationRating = freezed,
    Object? likelyRecommendRating = freezed,
    Object? serviceOfWorkRatinig = freezed,
  }) {
    return _then(_UserRatingModel(
      communicationRating: communicationRating == freezed
          ? _value.communicationRating
          : communicationRating // ignore: cast_nullable_to_non_nullable
              as double,
      likelyRecommendRating: likelyRecommendRating == freezed
          ? _value.likelyRecommendRating
          : likelyRecommendRating // ignore: cast_nullable_to_non_nullable
              as double,
      serviceOfWorkRatinig: serviceOfWorkRatinig == freezed
          ? _value.serviceOfWorkRatinig
          : serviceOfWorkRatinig // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRatingModel implements _UserRatingModel {
  const _$_UserRatingModel(
      {this.communicationRating = 0.0,
      this.likelyRecommendRating = 0.0,
      this.serviceOfWorkRatinig = 0.0});

  factory _$_UserRatingModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserRatingModelFromJson(json);

  @JsonKey(defaultValue: 0.0)
  @override
  final double communicationRating;
  @JsonKey(defaultValue: 0.0)
  @override
  final double likelyRecommendRating;
  @JsonKey(defaultValue: 0.0)
  @override
  final double serviceOfWorkRatinig;

  @override
  String toString() {
    return 'UserRatingModel(communicationRating: $communicationRating, likelyRecommendRating: $likelyRecommendRating, serviceOfWorkRatinig: $serviceOfWorkRatinig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserRatingModel &&
            (identical(other.communicationRating, communicationRating) ||
                const DeepCollectionEquality()
                    .equals(other.communicationRating, communicationRating)) &&
            (identical(other.likelyRecommendRating, likelyRecommendRating) ||
                const DeepCollectionEquality().equals(
                    other.likelyRecommendRating, likelyRecommendRating)) &&
            (identical(other.serviceOfWorkRatinig, serviceOfWorkRatinig) ||
                const DeepCollectionEquality()
                    .equals(other.serviceOfWorkRatinig, serviceOfWorkRatinig)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(communicationRating) ^
      const DeepCollectionEquality().hash(likelyRecommendRating) ^
      const DeepCollectionEquality().hash(serviceOfWorkRatinig);

  @JsonKey(ignore: true)
  @override
  _$UserRatingModelCopyWith<_UserRatingModel> get copyWith =>
      __$UserRatingModelCopyWithImpl<_UserRatingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserRatingModelToJson(this);
  }
}

abstract class _UserRatingModel implements UserRatingModel {
  const factory _UserRatingModel(
      {double communicationRating,
      double likelyRecommendRating,
      double serviceOfWorkRatinig}) = _$_UserRatingModel;

  factory _UserRatingModel.fromJson(Map<String, dynamic> json) =
      _$_UserRatingModel.fromJson;

  @override
  double get communicationRating => throw _privateConstructorUsedError;
  @override
  double get likelyRecommendRating => throw _privateConstructorUsedError;
  @override
  double get serviceOfWorkRatinig => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserRatingModelCopyWith<_UserRatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
