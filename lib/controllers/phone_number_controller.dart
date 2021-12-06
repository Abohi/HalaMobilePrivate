import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/models/phonenumber_model/phonenumber_model.dart';

import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final phoneNumberController = StateNotifierProvider<PhoneNumberController,PhoneNumberModel?>(
      (ref) => PhoneNumberController(ref.read),
);

class PhoneNumberController extends StateNotifier<PhoneNumberModel?> {
  final Reader _read;

  StreamSubscription<PhoneNumberModel>? userModelChangesSubscription;

  PhoneNumberController(this._read) : super(null) {
    userModelChangesSubscription?.cancel();
    userModelChangesSubscription = _read(userRepositoryProvider)
        .getPhoneNumberStream(_read(authControllerProvider)!.uid)
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    userModelChangesSubscription?.cancel();
    super.dispose();
  }

}