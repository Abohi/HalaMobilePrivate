// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'work_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkEntryModel _$WorkEntryModelFromJson(Map<String, dynamic> json) {
  return _WorkEntryModel.fromJson(json);
}

/// @nodoc
class _$WorkEntryModelTearOff {
  const _$WorkEntryModelTearOff();

  _WorkEntryModel call(
      {required String? companyName,
      required String? country,
      required String? positionHeld,
      required DateTime? dateWorkedFrom,
      required DateTime? dateResigned,
      String? documentId}) {
    return _WorkEntryModel(
      companyName: companyName,
      country: country,
      positionHeld: positionHeld,
      dateWorkedFrom: dateWorkedFrom,
      dateResigned: dateResigned,
      documentId: documentId,
    );
  }

  WorkEntryModel fromJson(Map<String, Object> json) {
    return WorkEntryModel.fromJson(json);
  }
}

/// @nodoc
const $WorkEntryModel = _$WorkEntryModelTearOff();

/// @nodoc
mixin _$WorkEntryModel {
  String? get companyName => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get positionHeld => throw _privateConstructorUsedError;
  DateTime? get dateWorkedFrom => throw _privateConstructorUsedError;
  DateTime? get dateResigned => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkEntryModelCopyWith<WorkEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkEntryModelCopyWith<$Res> {
  factory $WorkEntryModelCopyWith(
          WorkEntryModel value, $Res Function(WorkEntryModel) then) =
      _$WorkEntryModelCopyWithImpl<$Res>;
  $Res call(
      {String? companyName,
      String? country,
      String? positionHeld,
      DateTime? dateWorkedFrom,
      DateTime? dateResigned,
      String? documentId});
}

/// @nodoc
class _$WorkEntryModelCopyWithImpl<$Res>
    implements $WorkEntryModelCopyWith<$Res> {
  _$WorkEntryModelCopyWithImpl(this._value, this._then);

  final WorkEntryModel _value;
  // ignore: unused_field
  final $Res Function(WorkEntryModel) _then;

  @override
  $Res call({
    Object? companyName = freezed,
    Object? country = freezed,
    Object? positionHeld = freezed,
    Object? dateWorkedFrom = freezed,
    Object? dateResigned = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_value.copyWith(
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      positionHeld: positionHeld == freezed
          ? _value.positionHeld
          : positionHeld // ignore: cast_nullable_to_non_nullable
              as String?,
      dateWorkedFrom: dateWorkedFrom == freezed
          ? _value.dateWorkedFrom
          : dateWorkedFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateResigned: dateResigned == freezed
          ? _value.dateResigned
          : dateResigned // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$WorkEntryModelCopyWith<$Res>
    implements $WorkEntryModelCopyWith<$Res> {
  factory _$WorkEntryModelCopyWith(
          _WorkEntryModel value, $Res Function(_WorkEntryModel) then) =
      __$WorkEntryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? companyName,
      String? country,
      String? positionHeld,
      DateTime? dateWorkedFrom,
      DateTime? dateResigned,
      String? documentId});
}

/// @nodoc
class __$WorkEntryModelCopyWithImpl<$Res>
    extends _$WorkEntryModelCopyWithImpl<$Res>
    implements _$WorkEntryModelCopyWith<$Res> {
  __$WorkEntryModelCopyWithImpl(
      _WorkEntryModel _value, $Res Function(_WorkEntryModel) _then)
      : super(_value, (v) => _then(v as _WorkEntryModel));

  @override
  _WorkEntryModel get _value => super._value as _WorkEntryModel;

  @override
  $Res call({
    Object? companyName = freezed,
    Object? country = freezed,
    Object? positionHeld = freezed,
    Object? dateWorkedFrom = freezed,
    Object? dateResigned = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_WorkEntryModel(
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      positionHeld: positionHeld == freezed
          ? _value.positionHeld
          : positionHeld // ignore: cast_nullable_to_non_nullable
              as String?,
      dateWorkedFrom: dateWorkedFrom == freezed
          ? _value.dateWorkedFrom
          : dateWorkedFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateResigned: dateResigned == freezed
          ? _value.dateResigned
          : dateResigned // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkEntryModel implements _WorkEntryModel {
  const _$_WorkEntryModel(
      {required this.companyName,
      required this.country,
      required this.positionHeld,
      required this.dateWorkedFrom,
      required this.dateResigned,
      this.documentId});

  factory _$_WorkEntryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_WorkEntryModelFromJson(json);

  @override
  final String? companyName;
  @override
  final String? country;
  @override
  final String? positionHeld;
  @override
  final DateTime? dateWorkedFrom;
  @override
  final DateTime? dateResigned;
  @override
  final String? documentId;

  @override
  String toString() {
    return 'WorkEntryModel(companyName: $companyName, country: $country, positionHeld: $positionHeld, dateWorkedFrom: $dateWorkedFrom, dateResigned: $dateResigned, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WorkEntryModel &&
            (identical(other.companyName, companyName) ||
                const DeepCollectionEquality()
                    .equals(other.companyName, companyName)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.positionHeld, positionHeld) ||
                const DeepCollectionEquality()
                    .equals(other.positionHeld, positionHeld)) &&
            (identical(other.dateWorkedFrom, dateWorkedFrom) ||
                const DeepCollectionEquality()
                    .equals(other.dateWorkedFrom, dateWorkedFrom)) &&
            (identical(other.dateResigned, dateResigned) ||
                const DeepCollectionEquality()
                    .equals(other.dateResigned, dateResigned)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(companyName) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(positionHeld) ^
      const DeepCollectionEquality().hash(dateWorkedFrom) ^
      const DeepCollectionEquality().hash(dateResigned) ^
      const DeepCollectionEquality().hash(documentId);

  @JsonKey(ignore: true)
  @override
  _$WorkEntryModelCopyWith<_WorkEntryModel> get copyWith =>
      __$WorkEntryModelCopyWithImpl<_WorkEntryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WorkEntryModelToJson(this);
  }
}

abstract class _WorkEntryModel implements WorkEntryModel {
  const factory _WorkEntryModel(
      {required String? companyName,
      required String? country,
      required String? positionHeld,
      required DateTime? dateWorkedFrom,
      required DateTime? dateResigned,
      String? documentId}) = _$_WorkEntryModel;

  factory _WorkEntryModel.fromJson(Map<String, dynamic> json) =
      _$_WorkEntryModel.fromJson;

  @override
  String? get companyName => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  String? get positionHeld => throw _privateConstructorUsedError;
  @override
  DateTime? get dateWorkedFrom => throw _privateConstructorUsedError;
  @override
  DateTime? get dateResigned => throw _privateConstructorUsedError;
  @override
  String? get documentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WorkEntryModelCopyWith<_WorkEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
