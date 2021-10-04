// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:halawork/controllers/auth_controller.dart';
// import 'package:halawork/exception_handlers/custom_exception.dart';
// import 'package:halawork/models/service_type_model/service_type_model.dart';
// import 'package:halawork/models/services_model/service_model.dart';
// import 'package:halawork/models/skills_model/skill_model.dart';
// import 'package:halawork/models/user_model/user_model.dart';
// import 'package:halawork/providers/exception_provider/exception_provider.dart';
// import 'package:halawork/repositories/dashboard_repository.dart';
// import 'package:halawork/repositories/user_repository.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// final dashboardControllerProvider = StateNotifierProvider<DashBoardController, List<ServiceModel>?>(
//       (ref) => DashBoardController(ref.read),
// );
//
// class DashBoardController extends StateNotifier<List<ServiceModel>?> {
//   final Reader _read;
//
//   StreamSubscription<QuerySnapshot<ServiceModel>?>? _activeServiceCollectionSubscription;
//   DashBoardController(this._read) : super(null) {
//     _activeServiceCollectionSubscription?.cancel();
//     _activeServiceCollectionSubscription = _read(dashBoardRepositoryProvider)
//         .getActiveServices()
//         .listen((activeServiceModelSnapShot) => state = activeServiceModelSnapShot.docs.map((e) => e.data()).toList());
//   }
//
//
//   @override
//   void dispose() {
//     _activeServiceCollectionSubscription?.cancel();
//     super.dispose();
//   }
//
// }
//
