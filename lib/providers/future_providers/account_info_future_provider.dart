import 'package:dartz/dartz.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/account_info_model/account_info_model.dart';
import 'package:halawork/models/bank_model/bank_model.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final accountInfoFutureProvider = FutureProvider.autoDispose<Either<NetworkFailure,AccountInfoModel?>>((ref) async {
  Either<NetworkFailure,AccountInfoModel?> accountInfoData = await ref.read(userRepositoryProvider).resolveAccountInfo();
  return accountInfoData;
});