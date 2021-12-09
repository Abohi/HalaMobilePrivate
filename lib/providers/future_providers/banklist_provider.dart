import 'package:dartz/dartz.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/bank_model/bank_model.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bankListProvider = FutureProvider.autoDispose<Either<NetworkFailure,BankModel>>((ref) async {
  Either<NetworkFailure,BankModel> listOfBanks = await ref.read(userRepositoryProvider).getBanks();
  return listOfBanks;
});