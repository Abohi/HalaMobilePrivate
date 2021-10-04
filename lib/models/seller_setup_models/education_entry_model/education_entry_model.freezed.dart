// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'education_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EducationEntryModel _$EducationEntryModelFromJson(Map<String, dynamic> json) {
  return _EducationEntryModel.fromJson(json);
}

/// @nodoc
class _$EducationEntryModelTearOff {
  const _$EducationEntryModelTearOff();

  _EducationEntryModel call(
      {required String? schoolName,
      required String? areaOfStudy,
      required String? degree,
      required DateTime? dateAttended,
      required DateTime? dateEnded,
      String? documentId}) {
    return _EducationEntryModel(
      schoolName: schoolName,
      areaOfStudy: areaOfStudy,
      degree: degree,
      dateAttended: dateAttended,
      dateEnded: dateEnded,
      documentId: documentId,
    );
  }

  EducationEntryModel fromJson(Map<String, Object> json) {
    return EducationEntryModel.fromJson(json);
  }
}

/// @nodoc
const $EducationEntryModel = _$EducationEntryModelTearOff();

/// @nodoc
mixin _$EducationEntryModel {
  String? get schoolName => throw _privateConstructorUsedError;
  String? get areaOfStudy => throw _privateConstructorUsedError;
  String? get degree => throw _privateConstructorUsedError;
  DateTime? get dateAttended => throw _privateConstructorUsedError;
  DateTime? get dateEnded => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationEntryModelCopyWith<EducationEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationEntryModelCopyWith<$Res> {
  factory $EducationEntryModelCopyWith(
          EducationEntryModel value, $Res Function(EducationEntryModel) then) =
      _$EducationEntryModelCopyWithImpl<$Res>;
  $Res call(
      {String? schoolName,
      String? areaOfStudy,
      String? degree,
      DateTime? dateAttended,
      DateTime? dateEnded,
      String? documentId});
}

/// @nodoc
class _$EducationEntryModelCopyWithImpl<$Res>
    implements $EducationEntryModelCopyWith<$Res> {
  _$EducationEntryModelCopyWithImpl(this._value, this._then);

  final EducationEntryModel _value;
  // ignore: unused_field
  final $Res Function(EducationEntryModel) _then;

  @override
  $Res call({
    Object? schoolName = freezed,
    Object? areaOfStudy = freezed,
    Object? degree = freezed,
    Object? dateAttended = freezed,
    Object? dateEnded = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_value.copyWith(
      schoolName: schoolName == freezed
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      areaOfStudy: areaOfStudy == freezed
          ? _value.areaOfStudy
          : areaOfStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      degree: degree == freezed
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      dateAttended: dateAttended == freezed
          ? _value.dateAttended
          : dateAttended // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnded: dateEnded == freezed
          ? _value.dateEnded
          : dateEnded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$EducationEntryModelCopyWith<$Res>
    implements $EducationEntryModelCopyWith<$Res> {
  factory _$EducationEntryModelCopyWith(_EducationEntryModel value,
          $Res Function(_EducationEntryModel) then) =
      __$EducationEntryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? schoolName,
      String? areaOfStudy,
      String? degree,
      DateTime? dateAttended,
      DateTime? dateEnded,
      String? documentId});
}

/// @nodoc
class __$EducationEntryModelCopyWithImpl<$Res>
    extends _$EducationEntryModelCopyWithImpl<$Res>
    implements _$EducationEntryModelCopyWith<$Res> {
  __$EducationEntryModelCopyWithImpl(
      _EducationEntryModel _value, $Res Function(_EducationEntryModel) _then)
      : super(_value, (v) => _then(v as _EducationEntryModel));

  @override
  _EducationEntryModel get _value => super._value as _EducationEntryModel;

  @override
  $Res call({
    Object? schoolName = freezed,
    Object? areaOfStudy = freezed,
    Object? degree = freezed,
    Object? dateAttended = freezed,
    Object? dateEnded = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_EducationEntryModel(
      schoolName: schoolName == freezed
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      areaOfStudy: areaOfStudy == freezed
          ? _value.areaOfStudy
          : areaOfStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      degree: degree == freezed
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      dateAttended: dateAttended == freezed
          ? _value.dateAttended
          : dateAttended // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnded: dateEnded == freezed
          ? _value.dateEnded
          : dateEnded // ignore: cast_nullable_to_non_nullable
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
class _$_EducationEntryModel implements _EducationEntryModel {
  const _$_EducationEntryModel(
      {required this.schoolName,
      required this.areaOfStudy,
      required this.degree,
      required this.dateAttended,
      required this.dateEnded,
      this.documentId});

  factory _$_EducationEntryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_EducationEntryModelFromJson(json);

  @override
  final String? schoolName;
  @override
  final String? areaOfStudy;
  @override
  final String? degree;
  @override
  final DateTime? dateAttended;
  @override
  final DateTime? dateEnded;
  @override
  final String? documentId;

  @override
  String toString() {
    return 'EducationEntryModel(schoolName: $schoolName, areaOfStudy: $areaOfStudy, degree: $degree, dateAttended: $dateAttended, dateEnded: $dateEnded, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EducationEntryModel &&
            (identical(other.schoolName, schoolName) ||
                const DeepCollectionEquality()
                    .equals(other.schoolName, schoolName)) &&
            (identical(other.areaOfStudy, areaOfStudy) ||
                const DeepCollectionEquality()
                    .equals(other.areaOfStudy, areaOfStudy)) &&
            (identical(other.degree, degree) ||
                const DeepCollectionEquality().equals(other.degree, degree)) &&
            (identical(other.dateAttended, dateAttended) ||
                const DeepCollectionEquality()
                    .equals(other.dateAttended, dateAttended)) &&
            (identical(other.dateEnded, dateEnded) ||
                const DeepCollectionEquality()
                    .equals(other.dateEnded, dateEnded)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(schoolName) ^
      const DeepCollectionEquality().hash(areaOfStudy) ^
      const DeepCollectionEquality().hash(degree) ^
      const DeepCollectionEquality().hash(dateAttended) ^
      const DeepCollectionEquality().hash(dateEnded) ^
      const DeepCollectionEquality().hash(documentId);

  @JsonKey(ignore: true)
  @override
  _$EducationEntryModelCopyWith<_EducationEntryModel> get copyWith =>
      __$EducationEntryModelCopyWithImpl<_EducationEntryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EducationEntryModelToJson(this);
  }
}

abstract class _EducationEntryModel implements EducationEntryModel {
  const factory _EducationEntryModel(
      {required String? schoolName,
      required String? areaOfStudy,
      required String? degree,
      required DateTime? dateAttended,
      required DateTime? dateEnded,
      String? documentId}) = _$_EducationEntryModel;

  factory _EducationEntryModel.fromJson(Map<String, dynamic> json) =
      _$_EducationEntryModel.fromJson;

  @override
  String? get schoolName => throw _privateConstructorUsedError;
  @override
  String? get areaOfStudy => throw _privateConstructorUsedError;
  @override
  String? get degree => throw _privateConstructorUsedError;
  @override
  DateTime? get dateAttended => throw _privateConstructorUsedError;
  @override
  DateTime? get dateEnded => throw _privateConstructorUsedError;
  @override
  String? get documentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EducationEntryModelCopyWith<_EducationEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
