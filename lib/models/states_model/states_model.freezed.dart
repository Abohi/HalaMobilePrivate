// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'states_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return _StateModel.fromJson(json);
}

/// @nodoc
class _$StateModelTearOff {
  const _$StateModelTearOff();

  _StateModel call({required String? state, required List<String>? lgas}) {
    return _StateModel(
      state: state,
      lgas: lgas,
    );
  }

  StateModel fromJson(Map<String, Object> json) {
    return StateModel.fromJson(json);
  }
}

/// @nodoc
const $StateModel = _$StateModelTearOff();

/// @nodoc
mixin _$StateModel {
  String? get state => throw _privateConstructorUsedError;
  List<String>? get lgas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateModelCopyWith<StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateModelCopyWith<$Res> {
  factory $StateModelCopyWith(
          StateModel value, $Res Function(StateModel) then) =
      _$StateModelCopyWithImpl<$Res>;
  $Res call({String? state, List<String>? lgas});
}

/// @nodoc
class _$StateModelCopyWithImpl<$Res> implements $StateModelCopyWith<$Res> {
  _$StateModelCopyWithImpl(this._value, this._then);

  final StateModel _value;
  // ignore: unused_field
  final $Res Function(StateModel) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? lgas = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      lgas: lgas == freezed
          ? _value.lgas
          : lgas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$StateModelCopyWith<$Res> implements $StateModelCopyWith<$Res> {
  factory _$StateModelCopyWith(
          _StateModel value, $Res Function(_StateModel) then) =
      __$StateModelCopyWithImpl<$Res>;
  @override
  $Res call({String? state, List<String>? lgas});
}

/// @nodoc
class __$StateModelCopyWithImpl<$Res> extends _$StateModelCopyWithImpl<$Res>
    implements _$StateModelCopyWith<$Res> {
  __$StateModelCopyWithImpl(
      _StateModel _value, $Res Function(_StateModel) _then)
      : super(_value, (v) => _then(v as _StateModel));

  @override
  _StateModel get _value => super._value as _StateModel;

  @override
  $Res call({
    Object? state = freezed,
    Object? lgas = freezed,
  }) {
    return _then(_StateModel(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      lgas: lgas == freezed
          ? _value.lgas
          : lgas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StateModel implements _StateModel {
  const _$_StateModel({required this.state, required this.lgas});

  factory _$_StateModel.fromJson(Map<String, dynamic> json) =>
      _$_$_StateModelFromJson(json);

  @override
  final String? state;
  @override
  final List<String>? lgas;

  @override
  String toString() {
    return 'StateModel(state: $state, lgas: $lgas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StateModel &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.lgas, lgas) ||
                const DeepCollectionEquality().equals(other.lgas, lgas)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(lgas);

  @JsonKey(ignore: true)
  @override
  _$StateModelCopyWith<_StateModel> get copyWith =>
      __$StateModelCopyWithImpl<_StateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StateModelToJson(this);
  }
}

abstract class _StateModel implements StateModel {
  const factory _StateModel(
      {required String? state, required List<String>? lgas}) = _$_StateModel;

  factory _StateModel.fromJson(Map<String, dynamic> json) =
      _$_StateModel.fromJson;

  @override
  String? get state => throw _privateConstructorUsedError;
  @override
  List<String>? get lgas => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StateModelCopyWith<_StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
