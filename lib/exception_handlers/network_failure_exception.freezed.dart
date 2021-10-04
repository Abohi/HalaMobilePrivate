// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'network_failure_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NetworkFailureTearOff {
  const _$NetworkFailureTearOff();

  _NetworkFailure call([String? message, String? prefix]) {
    return _NetworkFailure(
      message,
      prefix,
    );
  }

  FetchDataException fetchDataException(
      [String? message, String? prefix = 'Error During Communication: ']) {
    return FetchDataException(
      message,
      prefix,
    );
  }

  BadRequestException badRequestException(
      [String? message, String? prefix = 'Invalid Request: ']) {
    return BadRequestException(
      message,
      prefix,
    );
  }

  UnauthorisedException unauthorisedException(
      [String? message, String? prefix = 'Unauthorised: ']) {
    return UnauthorisedException(
      message,
      prefix,
    );
  }

  InvalidInputException invalidInputException(
      [String? message, String? prefix = 'Invalid Input: ']) {
    return InvalidInputException(
      message,
      prefix,
    );
  }

  NoNetworkException noNetworkException(
      [String? message, String? prefix = 'No Internet connection detected: ']) {
    return NoNetworkException(
      message,
      prefix,
    );
  }

  GeneralException generalException(
      [String? message, String? prefix = 'Something went wrong: ']) {
    return GeneralException(
      message,
      prefix,
    );
  }
}

/// @nodoc
const $NetworkFailure = _$NetworkFailureTearOff();

/// @nodoc
mixin _$NetworkFailure {
  String? get message => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? message, String? prefix) $default, {
    required TResult Function(String? message, String? prefix)
        fetchDataException,
    required TResult Function(String? message, String? prefix)
        badRequestException,
    required TResult Function(String? message, String? prefix)
        unauthorisedException,
    required TResult Function(String? message, String? prefix)
        invalidInputException,
    required TResult Function(String? message, String? prefix)
        noNetworkException,
    required TResult Function(String? message, String? prefix) generalException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? message, String? prefix)? $default, {
    TResult Function(String? message, String? prefix)? fetchDataException,
    TResult Function(String? message, String? prefix)? badRequestException,
    TResult Function(String? message, String? prefix)? unauthorisedException,
    TResult Function(String? message, String? prefix)? invalidInputException,
    TResult Function(String? message, String? prefix)? noNetworkException,
    TResult Function(String? message, String? prefix)? generalException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NetworkFailure value) $default, {
    required TResult Function(FetchDataException value) fetchDataException,
    required TResult Function(BadRequestException value) badRequestException,
    required TResult Function(UnauthorisedException value)
        unauthorisedException,
    required TResult Function(InvalidInputException value)
        invalidInputException,
    required TResult Function(NoNetworkException value) noNetworkException,
    required TResult Function(GeneralException value) generalException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NetworkFailure value)? $default, {
    TResult Function(FetchDataException value)? fetchDataException,
    TResult Function(BadRequestException value)? badRequestException,
    TResult Function(UnauthorisedException value)? unauthorisedException,
    TResult Function(InvalidInputException value)? invalidInputException,
    TResult Function(NoNetworkException value)? noNetworkException,
    TResult Function(GeneralException value)? generalException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkFailureCopyWith<NetworkFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(
          NetworkFailure value, $Res Function(NetworkFailure) then) =
      _$NetworkFailureCopyWithImpl<$Res>;
  $Res call({String? message, String? prefix});
}

/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._value, this._then);

  final NetworkFailure _value;
  // ignore: unused_field
  final $Res Function(NetworkFailure) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? prefix = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix: prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NetworkFailureCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory _$NetworkFailureCopyWith(
          _NetworkFailure value, $Res Function(_NetworkFailure) then) =
      __$NetworkFailureCopyWithImpl<$Res>;
  @override
  $Res call({String? message, String? prefix});
}

/// @nodoc
class __$NetworkFailureCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements _$NetworkFailureCopyWith<$Res> {
  __$NetworkFailureCopyWithImpl(
      _NetworkFailure _value, $Res Function(_NetworkFailure) _then)
      : super(_value, (v) => _then(v as _NetworkFailure));

  @override
  _NetworkFailure get _value => super._value as _NetworkFailure;

  @override
  $Res call({
    Object? message = freezed,
    Object? prefix = freezed,
  }) {
    return _then(_NetworkFailure(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NetworkFailure implements _NetworkFailure {
  _$_NetworkFailure([this.message, this.prefix]);

  @override
  final String? message;
  @override
  final String? prefix;

  @override
  String toString() {
    return 'NetworkFailure(message: $message, prefix: $prefix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NetworkFailure &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(prefix);

  @JsonKey(ignore: true)
  @override
  _$NetworkFailureCopyWith<_NetworkFailure> get copyWith =>
      __$NetworkFailureCopyWithImpl<_NetworkFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? message, String? prefix) $default, {
    required TResult Function(String? message, String? prefix)
        fetchDataException,
    required TResult Function(String? message, String? prefix)
        badRequestException,
    required TResult Function(String? message, String? prefix)
        unauthorisedException,
    required TResult Function(String? message, String? prefix)
        invalidInputException,
    required TResult Function(String? message, String? prefix)
        noNetworkException,
    required TResult Function(String? message, String? prefix) generalException,
  }) {
    return $default(message, prefix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? message, String? prefix)? $default, {
    TResult Function(String? message, String? prefix)? fetchDataException,
    TResult Function(String? message, String? prefix)? badRequestException,
    TResult Function(String? message, String? prefix)? unauthorisedException,
    TResult Function(String? message, String? prefix)? invalidInputException,
    TResult Function(String? message, String? prefix)? noNetworkException,
    TResult Function(String? message, String? prefix)? generalException,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(message, prefix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NetworkFailure value) $default, {
    required TResult Function(FetchDataException value) fetchDataException,
    required TResult Function(BadRequestException value) badRequestException,
    required TResult Function(UnauthorisedException value)
        unauthorisedException,
    required TResult Function(InvalidInputException value)
        invalidInputException,
    required TResult Function(NoNetworkException value) noNetworkException,
    required TResult Function(GeneralException value) generalException,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NetworkFailure value)? $default, {
    TResult Function(FetchDataException value)? fetchDataException,
    TResult Function(BadRequestException value)? badRequestException,
    TResult Function(UnauthorisedException value)? unauthorisedException,
    TResult Function(InvalidInputException value)? invalidInputException,
    TResult Function(NoNetworkException value)? noNetworkException,
    TResult Function(GeneralException value)? generalException,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _NetworkFailure implements NetworkFailure {
  factory _NetworkFailure([String? message, String? prefix]) =
      _$_NetworkFailure;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get prefix => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NetworkFailureCopyWith<_NetworkFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchDataExceptionCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory $FetchDataExceptionCopyWith(
          FetchDataException value, $Res Function(FetchDataException) then) =
      _$FetchDataExceptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message, String? prefix});
}

/// @nodoc
class _$FetchDataExceptionCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements $FetchDataExceptionCopyWith<$Res> {
  _$FetchDataExceptionCopyWithImpl(
      FetchDataException _value, $Res Function(FetchDataException) _then)
      : super(_value, (v) => _then(v as FetchDataException));

  @override
  FetchDataException get _value => super._value as FetchDataException;

  @override
  $Res call({
    Object? message = freezed,
    Object? prefix = freezed,
  }) {
    return _then(FetchDataException(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchDataException implements FetchDataException {
  const _$FetchDataException(
      [this.message, this.prefix = 'Error During Communication: ']);

  @override
  final String? message;
  @JsonKey(defaultValue: 'Error During Communication: ')
  @override
  final String? prefix;

  @override
  String toString() {
    return 'NetworkFailure.fetchDataException(message: $message, prefix: $prefix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchDataException &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(prefix);

  @JsonKey(ignore: true)
  @override
  $FetchDataExceptionCopyWith<FetchDataException> get copyWith =>
      _$FetchDataExceptionCopyWithImpl<FetchDataException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? message, String? prefix) $default, {
    required TResult Function(String? message, String? prefix)
        fetchDataException,
    required TResult Function(String? message, String? prefix)
        badRequestException,
    required TResult Function(String? message, String? prefix)
        unauthorisedException,
    required TResult Function(String? message, String? prefix)
        invalidInputException,
    required TResult Function(String? message, String? prefix)
        noNetworkException,
    required TResult Function(String? message, String? prefix) generalException,
  }) {
    return fetchDataException(message, prefix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? message, String? prefix)? $default, {
    TResult Function(String? message, String? prefix)? fetchDataException,
    TResult Function(String? message, String? prefix)? badRequestException,
    TResult Function(String? message, String? prefix)? unauthorisedException,
    TResult Function(String? message, String? prefix)? invalidInputException,
    TResult Function(String? message, String? prefix)? noNetworkException,
    TResult Function(String? message, String? prefix)? generalException,
    required TResult orElse(),
  }) {
    if (fetchDataException != null) {
      return fetchDataException(message, prefix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NetworkFailure value) $default, {
    required TResult Function(FetchDataException value) fetchDataException,
    required TResult Function(BadRequestException value) badRequestException,
    required TResult Function(UnauthorisedException value)
        unauthorisedException,
    required TResult Function(InvalidInputException value)
        invalidInputException,
    required TResult Function(NoNetworkException value) noNetworkException,
    required TResult Function(GeneralException value) generalException,
  }) {
    return fetchDataException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NetworkFailure value)? $default, {
    TResult Function(FetchDataException value)? fetchDataException,
    TResult Function(BadRequestException value)? badRequestException,
    TResult Function(UnauthorisedException value)? unauthorisedException,
    TResult Function(InvalidInputException value)? invalidInputException,
    TResult Function(NoNetworkException value)? noNetworkException,
    TResult Function(GeneralException value)? generalException,
    required TResult orElse(),
  }) {
    if (fetchDataException != null) {
      return fetchDataException(this);
    }
    return orElse();
  }
}

abstract class FetchDataException implements NetworkFailure {
  const factory FetchDataException([String? message, String? prefix]) =
      _$FetchDataException;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get prefix => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $FetchDataExceptionCopyWith<FetchDataException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadRequestExceptionCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory $BadRequestExceptionCopyWith(
          BadRequestException value, $Res Function(BadRequestException) then) =
      _$BadRequestExceptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message, String? prefix});
}

/// @nodoc
class _$BadRequestExceptionCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements $BadRequestExceptionCopyWith<$Res> {
  _$BadRequestExceptionCopyWithImpl(
      BadRequestException _value, $Res Function(BadRequestException) _then)
      : super(_value, (v) => _then(v as BadRequestException));

  @override
  BadRequestException get _value => super._value as BadRequestException;

  @override
  $Res call({
    Object? message = freezed,
    Object? prefix = freezed,
  }) {
    return _then(BadRequestException(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BadRequestException implements BadRequestException {
  const _$BadRequestException(
      [this.message, this.prefix = 'Invalid Request: ']);

  @override
  final String? message;
  @JsonKey(defaultValue: 'Invalid Request: ')
  @override
  final String? prefix;

  @override
  String toString() {
    return 'NetworkFailure.badRequestException(message: $message, prefix: $prefix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BadRequestException &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(prefix);

  @JsonKey(ignore: true)
  @override
  $BadRequestExceptionCopyWith<BadRequestException> get copyWith =>
      _$BadRequestExceptionCopyWithImpl<BadRequestException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? message, String? prefix) $default, {
    required TResult Function(String? message, String? prefix)
        fetchDataException,
    required TResult Function(String? message, String? prefix)
        badRequestException,
    required TResult Function(String? message, String? prefix)
        unauthorisedException,
    required TResult Function(String? message, String? prefix)
        invalidInputException,
    required TResult Function(String? message, String? prefix)
        noNetworkException,
    required TResult Function(String? message, String? prefix) generalException,
  }) {
    return badRequestException(message, prefix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? message, String? prefix)? $default, {
    TResult Function(String? message, String? prefix)? fetchDataException,
    TResult Function(String? message, String? prefix)? badRequestException,
    TResult Function(String? message, String? prefix)? unauthorisedException,
    TResult Function(String? message, String? prefix)? invalidInputException,
    TResult Function(String? message, String? prefix)? noNetworkException,
    TResult Function(String? message, String? prefix)? generalException,
    required TResult orElse(),
  }) {
    if (badRequestException != null) {
      return badRequestException(message, prefix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NetworkFailure value) $default, {
    required TResult Function(FetchDataException value) fetchDataException,
    required TResult Function(BadRequestException value) badRequestException,
    required TResult Function(UnauthorisedException value)
        unauthorisedException,
    required TResult Function(InvalidInputException value)
        invalidInputException,
    required TResult Function(NoNetworkException value) noNetworkException,
    required TResult Function(GeneralException value) generalException,
  }) {
    return badRequestException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NetworkFailure value)? $default, {
    TResult Function(FetchDataException value)? fetchDataException,
    TResult Function(BadRequestException value)? badRequestException,
    TResult Function(UnauthorisedException value)? unauthorisedException,
    TResult Function(InvalidInputException value)? invalidInputException,
    TResult Function(NoNetworkException value)? noNetworkException,
    TResult Function(GeneralException value)? generalException,
    required TResult orElse(),
  }) {
    if (badRequestException != null) {
      return badRequestException(this);
    }
    return orElse();
  }
}

abstract class BadRequestException implements NetworkFailure {
  const factory BadRequestException([String? message, String? prefix]) =
      _$BadRequestException;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get prefix => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $BadRequestExceptionCopyWith<BadRequestException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthorisedExceptionCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory $UnauthorisedExceptionCopyWith(UnauthorisedException value,
          $Res Function(UnauthorisedException) then) =
      _$UnauthorisedExceptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message, String? prefix});
}

/// @nodoc
class _$UnauthorisedExceptionCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements $UnauthorisedExceptionCopyWith<$Res> {
  _$UnauthorisedExceptionCopyWithImpl(
      UnauthorisedException _value, $Res Function(UnauthorisedException) _then)
      : super(_value, (v) => _then(v as UnauthorisedException));

  @override
  UnauthorisedException get _value => super._value as UnauthorisedException;

  @override
  $Res call({
    Object? message = freezed,
    Object? prefix = freezed,
  }) {
    return _then(UnauthorisedException(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthorisedException implements UnauthorisedException {
  const _$UnauthorisedException([this.message, this.prefix = 'Unauthorised: ']);

  @override
  final String? message;
  @JsonKey(defaultValue: 'Unauthorised: ')
  @override
  final String? prefix;

  @override
  String toString() {
    return 'NetworkFailure.unauthorisedException(message: $message, prefix: $prefix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnauthorisedException &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(prefix);

  @JsonKey(ignore: true)
  @override
  $UnauthorisedExceptionCopyWith<UnauthorisedException> get copyWith =>
      _$UnauthorisedExceptionCopyWithImpl<UnauthorisedException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? message, String? prefix) $default, {
    required TResult Function(String? message, String? prefix)
        fetchDataException,
    required TResult Function(String? message, String? prefix)
        badRequestException,
    required TResult Function(String? message, String? prefix)
        unauthorisedException,
    required TResult Function(String? message, String? prefix)
        invalidInputException,
    required TResult Function(String? message, String? prefix)
        noNetworkException,
    required TResult Function(String? message, String? prefix) generalException,
  }) {
    return unauthorisedException(message, prefix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? message, String? prefix)? $default, {
    TResult Function(String? message, String? prefix)? fetchDataException,
    TResult Function(String? message, String? prefix)? badRequestException,
    TResult Function(String? message, String? prefix)? unauthorisedException,
    TResult Function(String? message, String? prefix)? invalidInputException,
    TResult Function(String? message, String? prefix)? noNetworkException,
    TResult Function(String? message, String? prefix)? generalException,
    required TResult orElse(),
  }) {
    if (unauthorisedException != null) {
      return unauthorisedException(message, prefix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NetworkFailure value) $default, {
    required TResult Function(FetchDataException value) fetchDataException,
    required TResult Function(BadRequestException value) badRequestException,
    required TResult Function(UnauthorisedException value)
        unauthorisedException,
    required TResult Function(InvalidInputException value)
        invalidInputException,
    required TResult Function(NoNetworkException value) noNetworkException,
    required TResult Function(GeneralException value) generalException,
  }) {
    return unauthorisedException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NetworkFailure value)? $default, {
    TResult Function(FetchDataException value)? fetchDataException,
    TResult Function(BadRequestException value)? badRequestException,
    TResult Function(UnauthorisedException value)? unauthorisedException,
    TResult Function(InvalidInputException value)? invalidInputException,
    TResult Function(NoNetworkException value)? noNetworkException,
    TResult Function(GeneralException value)? generalException,
    required TResult orElse(),
  }) {
    if (unauthorisedException != null) {
      return unauthorisedException(this);
    }
    return orElse();
  }
}

abstract class UnauthorisedException implements NetworkFailure {
  const factory UnauthorisedException([String? message, String? prefix]) =
      _$UnauthorisedException;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get prefix => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $UnauthorisedExceptionCopyWith<UnauthorisedException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidInputExceptionCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory $InvalidInputExceptionCopyWith(InvalidInputException value,
          $Res Function(InvalidInputException) then) =
      _$InvalidInputExceptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message, String? prefix});
}

/// @nodoc
class _$InvalidInputExceptionCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements $InvalidInputExceptionCopyWith<$Res> {
  _$InvalidInputExceptionCopyWithImpl(
      InvalidInputException _value, $Res Function(InvalidInputException) _then)
      : super(_value, (v) => _then(v as InvalidInputException));

  @override
  InvalidInputException get _value => super._value as InvalidInputException;

  @override
  $Res call({
    Object? message = freezed,
    Object? prefix = freezed,
  }) {
    return _then(InvalidInputException(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InvalidInputException implements InvalidInputException {
  const _$InvalidInputException(
      [this.message, this.prefix = 'Invalid Input: ']);

  @override
  final String? message;
  @JsonKey(defaultValue: 'Invalid Input: ')
  @override
  final String? prefix;

  @override
  String toString() {
    return 'NetworkFailure.invalidInputException(message: $message, prefix: $prefix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidInputException &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(prefix);

  @JsonKey(ignore: true)
  @override
  $InvalidInputExceptionCopyWith<InvalidInputException> get copyWith =>
      _$InvalidInputExceptionCopyWithImpl<InvalidInputException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? message, String? prefix) $default, {
    required TResult Function(String? message, String? prefix)
        fetchDataException,
    required TResult Function(String? message, String? prefix)
        badRequestException,
    required TResult Function(String? message, String? prefix)
        unauthorisedException,
    required TResult Function(String? message, String? prefix)
        invalidInputException,
    required TResult Function(String? message, String? prefix)
        noNetworkException,
    required TResult Function(String? message, String? prefix) generalException,
  }) {
    return invalidInputException(message, prefix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? message, String? prefix)? $default, {
    TResult Function(String? message, String? prefix)? fetchDataException,
    TResult Function(String? message, String? prefix)? badRequestException,
    TResult Function(String? message, String? prefix)? unauthorisedException,
    TResult Function(String? message, String? prefix)? invalidInputException,
    TResult Function(String? message, String? prefix)? noNetworkException,
    TResult Function(String? message, String? prefix)? generalException,
    required TResult orElse(),
  }) {
    if (invalidInputException != null) {
      return invalidInputException(message, prefix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NetworkFailure value) $default, {
    required TResult Function(FetchDataException value) fetchDataException,
    required TResult Function(BadRequestException value) badRequestException,
    required TResult Function(UnauthorisedException value)
        unauthorisedException,
    required TResult Function(InvalidInputException value)
        invalidInputException,
    required TResult Function(NoNetworkException value) noNetworkException,
    required TResult Function(GeneralException value) generalException,
  }) {
    return invalidInputException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NetworkFailure value)? $default, {
    TResult Function(FetchDataException value)? fetchDataException,
    TResult Function(BadRequestException value)? badRequestException,
    TResult Function(UnauthorisedException value)? unauthorisedException,
    TResult Function(InvalidInputException value)? invalidInputException,
    TResult Function(NoNetworkException value)? noNetworkException,
    TResult Function(GeneralException value)? generalException,
    required TResult orElse(),
  }) {
    if (invalidInputException != null) {
      return invalidInputException(this);
    }
    return orElse();
  }
}

abstract class InvalidInputException implements NetworkFailure {
  const factory InvalidInputException([String? message, String? prefix]) =
      _$InvalidInputException;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get prefix => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidInputExceptionCopyWith<InvalidInputException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoNetworkExceptionCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory $NoNetworkExceptionCopyWith(
          NoNetworkException value, $Res Function(NoNetworkException) then) =
      _$NoNetworkExceptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message, String? prefix});
}

/// @nodoc
class _$NoNetworkExceptionCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements $NoNetworkExceptionCopyWith<$Res> {
  _$NoNetworkExceptionCopyWithImpl(
      NoNetworkException _value, $Res Function(NoNetworkException) _then)
      : super(_value, (v) => _then(v as NoNetworkException));

  @override
  NoNetworkException get _value => super._value as NoNetworkException;

  @override
  $Res call({
    Object? message = freezed,
    Object? prefix = freezed,
  }) {
    return _then(NoNetworkException(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NoNetworkException implements NoNetworkException {
  const _$NoNetworkException(
      [this.message, this.prefix = 'No Internet connection detected: ']);

  @override
  final String? message;
  @JsonKey(defaultValue: 'No Internet connection detected: ')
  @override
  final String? prefix;

  @override
  String toString() {
    return 'NetworkFailure.noNetworkException(message: $message, prefix: $prefix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NoNetworkException &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(prefix);

  @JsonKey(ignore: true)
  @override
  $NoNetworkExceptionCopyWith<NoNetworkException> get copyWith =>
      _$NoNetworkExceptionCopyWithImpl<NoNetworkException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? message, String? prefix) $default, {
    required TResult Function(String? message, String? prefix)
        fetchDataException,
    required TResult Function(String? message, String? prefix)
        badRequestException,
    required TResult Function(String? message, String? prefix)
        unauthorisedException,
    required TResult Function(String? message, String? prefix)
        invalidInputException,
    required TResult Function(String? message, String? prefix)
        noNetworkException,
    required TResult Function(String? message, String? prefix) generalException,
  }) {
    return noNetworkException(message, prefix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? message, String? prefix)? $default, {
    TResult Function(String? message, String? prefix)? fetchDataException,
    TResult Function(String? message, String? prefix)? badRequestException,
    TResult Function(String? message, String? prefix)? unauthorisedException,
    TResult Function(String? message, String? prefix)? invalidInputException,
    TResult Function(String? message, String? prefix)? noNetworkException,
    TResult Function(String? message, String? prefix)? generalException,
    required TResult orElse(),
  }) {
    if (noNetworkException != null) {
      return noNetworkException(message, prefix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NetworkFailure value) $default, {
    required TResult Function(FetchDataException value) fetchDataException,
    required TResult Function(BadRequestException value) badRequestException,
    required TResult Function(UnauthorisedException value)
        unauthorisedException,
    required TResult Function(InvalidInputException value)
        invalidInputException,
    required TResult Function(NoNetworkException value) noNetworkException,
    required TResult Function(GeneralException value) generalException,
  }) {
    return noNetworkException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NetworkFailure value)? $default, {
    TResult Function(FetchDataException value)? fetchDataException,
    TResult Function(BadRequestException value)? badRequestException,
    TResult Function(UnauthorisedException value)? unauthorisedException,
    TResult Function(InvalidInputException value)? invalidInputException,
    TResult Function(NoNetworkException value)? noNetworkException,
    TResult Function(GeneralException value)? generalException,
    required TResult orElse(),
  }) {
    if (noNetworkException != null) {
      return noNetworkException(this);
    }
    return orElse();
  }
}

abstract class NoNetworkException implements NetworkFailure {
  const factory NoNetworkException([String? message, String? prefix]) =
      _$NoNetworkException;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get prefix => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $NoNetworkExceptionCopyWith<NoNetworkException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralExceptionCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory $GeneralExceptionCopyWith(
          GeneralException value, $Res Function(GeneralException) then) =
      _$GeneralExceptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message, String? prefix});
}

/// @nodoc
class _$GeneralExceptionCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements $GeneralExceptionCopyWith<$Res> {
  _$GeneralExceptionCopyWithImpl(
      GeneralException _value, $Res Function(GeneralException) _then)
      : super(_value, (v) => _then(v as GeneralException));

  @override
  GeneralException get _value => super._value as GeneralException;

  @override
  $Res call({
    Object? message = freezed,
    Object? prefix = freezed,
  }) {
    return _then(GeneralException(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix == freezed
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GeneralException implements GeneralException {
  const _$GeneralException(
      [this.message, this.prefix = 'Something went wrong: ']);

  @override
  final String? message;
  @JsonKey(defaultValue: 'Something went wrong: ')
  @override
  final String? prefix;

  @override
  String toString() {
    return 'NetworkFailure.generalException(message: $message, prefix: $prefix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GeneralException &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.prefix, prefix) ||
                const DeepCollectionEquality().equals(other.prefix, prefix)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(prefix);

  @JsonKey(ignore: true)
  @override
  $GeneralExceptionCopyWith<GeneralException> get copyWith =>
      _$GeneralExceptionCopyWithImpl<GeneralException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? message, String? prefix) $default, {
    required TResult Function(String? message, String? prefix)
        fetchDataException,
    required TResult Function(String? message, String? prefix)
        badRequestException,
    required TResult Function(String? message, String? prefix)
        unauthorisedException,
    required TResult Function(String? message, String? prefix)
        invalidInputException,
    required TResult Function(String? message, String? prefix)
        noNetworkException,
    required TResult Function(String? message, String? prefix) generalException,
  }) {
    return generalException(message, prefix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? message, String? prefix)? $default, {
    TResult Function(String? message, String? prefix)? fetchDataException,
    TResult Function(String? message, String? prefix)? badRequestException,
    TResult Function(String? message, String? prefix)? unauthorisedException,
    TResult Function(String? message, String? prefix)? invalidInputException,
    TResult Function(String? message, String? prefix)? noNetworkException,
    TResult Function(String? message, String? prefix)? generalException,
    required TResult orElse(),
  }) {
    if (generalException != null) {
      return generalException(message, prefix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NetworkFailure value) $default, {
    required TResult Function(FetchDataException value) fetchDataException,
    required TResult Function(BadRequestException value) badRequestException,
    required TResult Function(UnauthorisedException value)
        unauthorisedException,
    required TResult Function(InvalidInputException value)
        invalidInputException,
    required TResult Function(NoNetworkException value) noNetworkException,
    required TResult Function(GeneralException value) generalException,
  }) {
    return generalException(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NetworkFailure value)? $default, {
    TResult Function(FetchDataException value)? fetchDataException,
    TResult Function(BadRequestException value)? badRequestException,
    TResult Function(UnauthorisedException value)? unauthorisedException,
    TResult Function(InvalidInputException value)? invalidInputException,
    TResult Function(NoNetworkException value)? noNetworkException,
    TResult Function(GeneralException value)? generalException,
    required TResult orElse(),
  }) {
    if (generalException != null) {
      return generalException(this);
    }
    return orElse();
  }
}

abstract class GeneralException implements NetworkFailure {
  const factory GeneralException([String? message, String? prefix]) =
      _$GeneralException;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get prefix => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $GeneralExceptionCopyWith<GeneralException> get copyWith =>
      throw _privateConstructorUsedError;
}
