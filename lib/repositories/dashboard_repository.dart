import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/service_type_model/service_type_model.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/models/skills_model/skill_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/providers/general_providers/general_providers.dart';
import 'package:halawork/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:halawork/firebase_reference_extension/firebase_firestore_extension.dart';
abstract class BaseDashBoardRepository {
  Future<void> saveHalaworkServices();
  Future<ServiceTypeModel> getHalaworkServiceType();
}
final dashBoardRepositoryProvider =
Provider<DashBoardRepository>((ref) => DashBoardRepository(ref.read));

class DashBoardRepository implements BaseDashBoardRepository {
  final Reader _read;

  const DashBoardRepository(this._read);

  @override
  Future<void> saveHalaworkServices() async{
    try {
      final firestoreReference =   await _read(firebaseFirestoreProvider);
      bool servicesCollectionDoesNotExists = (await firestoreReference.serviceCollectionRef().get()).docs.isEmpty;
      if(servicesCollectionDoesNotExists){
        var sevicesBatchRef = firestoreReference.batch();
        halaworkServices.forEach((element) {
          ServiceModel serviceModel = ServiceModel.fromJson(element);
          sevicesBatchRef.set<ServiceModel>( firestoreReference.serviceCollectionRef().doc(), serviceModel);
        });

        await sevicesBatchRef.commit();
      }
      bool skillExists = (await firestoreReference.skillsDocumentRef().get()).exists;
      if(!skillExists){
        SkillModel skillModel = SkillModel(skills:halaworkSkills.toSet().toList());
        await firestoreReference.skillsDocumentRef().set(skillModel);
      }
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<ServiceTypeModel> getHalaworkServiceType() async{
    try{
     List<ServiceModel>? serviceModelList = (await _read(firebaseFirestoreProvider).serviceCollectionRef().get()).docs.map((e) => e.data().copyWith(serviceId: e.id)).toList();
     SkillModel? skillModel = (await _read(firebaseFirestoreProvider).skillsDocumentRef().get()).data();
     return ServiceTypeModel(serviceModel: serviceModelList, skillModel: skillModel);
    }on FirebaseAuthException catch (e) {
    throw CustomException(message: e.message);
    }
  }

}