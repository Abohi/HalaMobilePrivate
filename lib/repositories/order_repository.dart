import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/dispute_model/dispute_model.dart';
import 'package:halawork/models/modification_model/modification_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/service_type_model/service_type_model.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/models/skills_model/skill_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/providers/general_providers/general_providers.dart';
import 'package:halawork/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:halawork/firebase_reference_extension/firebase_firestore_extension.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
abstract class BaseOrderRepository {
 Stream<List<OrderModel>>orderStream();
 Stream<List<DisputeModel>>streamDispute();
}
final orderRepositoryProvider =
Provider<OrderRepository>((ref) => OrderRepository(ref.read));

class OrderRepository implements BaseOrderRepository {
  final Reader _read;

  const OrderRepository(this._read);

  @override
  Stream<List<OrderModel>> orderStream() {
    try{
      return _read(firebaseFirestoreProvider).orderCollectionRef().snapshots().map((event) => event.docs.map((e) => e.data()).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future<void>downloadFile({required String reference,required String fileName,required String extension,required Function(double progress) onDownloadProgress})async{
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          String newPath = "";
          print(directory);
          List<String> paths = directory!.path.split("/");
          print("parts before splitting ${directory.path}");
          print("Parts after splitting ${paths}");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          print("Concantenated Path ${newPath}");
          newPath = newPath + "/HalaworkFiles";
          directory = Directory(newPath);
        } else {
          await Fluttertoast.showToast(msg: "Access to storage is not granted",toastLength: Toast.LENGTH_LONG);
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        }
      }

      if (!await directory!.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File saveFile = File(directory.path + "/$fileName");
        Dio dio = Dio();
        await dio.download(reference, saveFile.path,
            onReceiveProgress: (value1, value2) {
              onDownloadProgress(value1/value2);
            });
        await Fluttertoast.showToast(msg: "File downloaded successfully",toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      print(e);
    }

  }
  Future<void>submitOrderToFirebase(String requestId,String path,FileType fileType,String text) async{
    String fileName = path.split('/').last;
    String filePath = path;
    String  _extension = fileName.toString().split('.').last;
    UploadTask storageUploadTask;
    storageUploadTask =  _read(firebaseStorageProvider)
        .ref()
        .child(orderCollection)
        .child(requestId)
        .child(requestId+".${_extension}")
        .putFile(File(filePath),SettableMetadata(
      contentType: '$fileType/$_extension',
    ));
    String fileUrl = await (await storageUploadTask).ref.getDownloadURL();
   await _read(firebaseFirestoreProvider).orderDocumentMapRef(requestId).set({
      "isSubmitted":true,
      "orderNote":text,
      "fileTypeModel":{
        "fileRef":fileUrl,
        "fileName":fileName,
        "fileType":_extension
      }
    },SetOptions(merge: true));
  }
  Stream<List<DisputeModel>>streamDispute(){
    try{
      return _read(firebaseFirestoreProvider).disputeCollectionRef(_read(authControllerProvider)!.uid).snapshots().map((event) => event.docs.map((e) => e.data().copyWith(disputeId: e.id)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  Future<void>deleteOfferAndOrder(String sellerId,String requestId,String buyerId)async{
    await _read(firebaseFirestoreProvider).orderCollectionRef().doc(requestId).get().then((value)async{
      if(value.exists){
        if(value.data()!.orderState=="deactivated" && value.data()!.orderPaymentExpired!){
          await _read(firebaseFirestoreProvider).offerCollectionRef(buyerId, requestId).doc(sellerId).delete();
          await _read(firebaseFirestoreProvider).orderCollectionRef().doc(requestId).delete();
        }
      }
    });
  }
  Future<void>addActionToOrder(String actionType,String requestId)async{
    await _read(firebaseFirestoreProvider).orderDocumentMapRef(requestId).set({
      "actionType":actionType,
      "orderState":"deactivated",
    },SetOptions(merge: true));
  }
  Future<void>createAModificationRequest(String requestId,Map<String,dynamic>modificationPayload)async{
    await _read(firebaseFirestoreProvider).modificationMapDocumentRef(requestId).set({
    "time":modificationPayload["time"],
    "reason":modificationPayload["reason"],
    "amount":modificationPayload["amount"]??"",
      "buyerId":modificationPayload["buyerId"],
      "sellerId":modificationPayload["sellerId"],
      "requestTitle":modificationPayload["requestTitle"],
      "decisionTime":modificationPayload["decisionTime"],
      "amountString":modificationPayload["amountString"],
      "createdDate":modificationPayload["createdDate"]
    },SetOptions(merge: true));
  }
  Stream<List<ModificationModel>>getModifications(){
    return _read(firebaseFirestoreProvider).modificationCollectionRef().snapshots().map((event) => event.docs.map((e) => e.data()).toList());
  }
}
