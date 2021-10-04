import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/service_type_model/service_type_model.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/repositories/dashboard_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
final serviceTypeControllerProvider =
StateNotifierProvider<ServiceTypeController, AsyncValue<ServiceTypeModel>>(
      (ref)=>ServiceTypeController(ref.read));

class ServiceTypeController extends StateNotifier<AsyncValue<ServiceTypeModel>> {
  final Reader _read;


  ServiceTypeController(this._read) : super(AsyncValue.loading()) {
    retrieveServiceType();
  }

  Future<void> retrieveServiceType({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      ServiceTypeModel serviceTypeModel = await _read(dashBoardRepositoryProvider).getHalaworkServiceType();
      if (mounted) {
        state = AsyncValue.data(serviceTypeModel);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  Future<void>saveServicesToCollectionRef()async{
    try {
      await _read(dashBoardRepositoryProvider).saveHalaworkServices();
    } on CustomException catch (e) {
      _read(exceptionMessageProvider).state = e;
    }
  }
}