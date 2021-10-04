import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_failure_exception.freezed.dart';

@freezed
class NetworkFailure  with _$NetworkFailure implements Exception{

  factory NetworkFailure([String? message, String? prefix ]) = _NetworkFailure;

  const factory  NetworkFailure.fetchDataException([ String? message, @Default('Error During Communication: ') String? prefix]) = FetchDataException;

  const factory  NetworkFailure.badRequestException([String? message, @Default('Invalid Request: ') String? prefix]) = BadRequestException;

  const factory  NetworkFailure.unauthorisedException([ String? message, @Default('Unauthorised: ') String? prefix]) = UnauthorisedException;

  const factory  NetworkFailure.invalidInputException([String? message, @Default('Invalid Input: ') String? prefix]) = InvalidInputException;

  const factory  NetworkFailure.noNetworkException([String? message, @Default('No Internet connection detected: ') String? prefix]) = NoNetworkException;
  const factory  NetworkFailure.generalException([String? message, @Default('Something went wrong: ') String? prefix]) = GeneralException;
}