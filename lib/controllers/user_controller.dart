import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/inbox_model/inbox_model.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/seller_setup_model/seller_setup_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userControllerProvider = StateNotifierProvider<UserController, UserModel?>(
      (ref) => UserController(ref.read),
);

class UserController extends StateNotifier<UserModel?> {
  final Reader _read;

  StreamSubscription<UserModel>? userModelChangesSubscription;

  UserController(this._read) : super(null) {
    userModelChangesSubscription?.cancel();
    userModelChangesSubscription = _read(userRepositoryProvider)
        .getUserModel(_read(authControllerProvider)!.uid)
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    userModelChangesSubscription?.cancel();
    super.dispose();
  }

}