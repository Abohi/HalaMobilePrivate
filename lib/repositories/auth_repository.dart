import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/providers/general_providers/phoneVerificationCodeProvider.dart';
import 'package:halawork/providers/general_providers/user_profile_provider.dart';
import 'package:halawork/utils/pref_manager.dart';
import 'package:http/http.dart' as http;
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/firebase_reference_extension/firebase_firestore_extension.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/providers/general_providers/general_providers.dart';
import 'package:halawork/utils/random_number_generator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;
  Future<void> signInUser(Map<String,dynamic> payload);
  Future<void> registerUser(Map<String,String>payload);
  Future<Either<NetworkFailure,bool>> sendPhoneValidationCode(String phoneNumber);
  User? getCurrentUser();
  Future<void>verifyAsBuyer(UserModel userModel,String userid);
  Future<UserCredential?>loginGoogle();
  Future<void> signOut();
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref));

class AuthRepository implements BaseAuthRepository {
  final ProviderReference _read;

  const AuthRepository(this._read);

  @override
  Stream<User?> get authStateChanges =>
      _read.read(firebaseAuthProvider).authStateChanges();


  @override
  User? getCurrentUser() {
    try {
      return _read.read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _read.read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signInUser(Map<String,dynamic>payload) async{
    try {
      await _read.read(firebaseAuthProvider).signInWithEmailAndPassword(email: payload["email"], password: payload["password"]);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> registerUser(Map<String,String>payload) async{
    try {
      UserCredential userCredential = await _read.read(firebaseAuthProvider).createUserWithEmailAndPassword(email: payload["email"]!, password:payload["password"]! );
      if(userCredential.user!=null){
        await userCredential.user!.sendEmailVerification();

        await _read.read(firebaseFirestoreProvider).userDocumentRef(userCredential.user!.uid).set(UserModel(phoneNumber: payload["phoneNumber"].toString(),email:payload["email"]!, isPhoneNumberVerified: false, isSeller: false, isBuyer: false,),SetOptions(
          merge: true
        ));
      }
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Either<NetworkFailure,bool>> sendPhoneValidationCode(String phoneNumber)async{
    try{
      int phoneCode = RandomDigits.getInteger(5);
      await PreferenceManager().savePhoneCode(phoneCode);
      String message = "Welcome to HalaWork. Your ID to complete your registration is ${phoneCode}. Thank you.";
      var headers = {
        'Content-Type': 'application/json'
      };

      var url ="https://netbulksms.com/index.php?option=com_spc&comm=spc_api&username=Evanson&password=pydroid@2019&sender=HomeAlone"
          "&recipient=$phoneNumber&message=$message";

      return http.get(Uri.parse(url), headers: headers).then((data) {
        if (data.statusCode == 200) {
          return right(true);
        }
        return right(false);
      });
    }on NetworkFailure catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(GeneralException(e.toString()));
    }


  }

  @override
  verifyAsBuyer(UserModel user,String userid) async{
    try {
      await _read.read(firebaseFirestoreProvider).userDocumentRef(userid).set(user,SetOptions(
        merge: true
      ));
    } on FirebaseAuthException catch (e) {
    throw CustomException(message: e.message);
    }
  }

  Future<UserCredential?>loginGoogle() async {
    try {
      final googleSignin = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? googleUser = await googleSignin.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
      );

      //Firebase Sign in
      final result = await signInWithCredential(credential);
      print('${result.user!.displayName}');
      return result;

    } catch(error){
      print("google sigin error ${error}");
      return null;
    }

  }
  Future<bool?> logInWithFacebook() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      if(facebookLoginResult.status==LoginStatus.success){
        final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
        await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
        return true;
        // await FirebaseFirestore.instance.collection('users').add({
        //   'email': userData['email'],
        //   'imageUrl': userData['picture']['data']['url'],
        //   'name': userData['name'],
        // });
      }
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'This account exists with a different sign in provider';
          break;
        case 'invalid-credential':
          content = 'Unknown error has occurred';
          break;
        case 'operation-not-allowed':
          content = 'This operation is not allowed';
          break;
        case 'user-disabled':
          content = 'The user you tried to log into is disabled';
          break;
        case 'user-not-found':
          content = 'The user you tried to log into was not found';
          break;
      }
      await Fluttertoast.showToast(msg: content,toastLength: Toast.LENGTH_LONG);
      return false;

    }
  }
  Future<UserCredential> signInWithCredential(AuthCredential credential){
    return _read.read(firebaseAuthProvider).signInWithCredential(credential);
  }

}
