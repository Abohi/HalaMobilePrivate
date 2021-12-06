import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/utils/passwordValidationStructure.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
final confirmpasswordVisibilityProvider = StateProvider<bool>((ref) => false);
class EmailSignupPage extends HookWidget {
const EmailSignupPage();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final email = useState<String?>("");
    final password = useState<String?>("");
    final confirmpassword = useState<String?>("");
    final phoneNumber = useState<String?>("");
    final passwordVisibilityState = useProvider(passwordVisibilityProvider);
    final confirmpasswordVisibilityState = useProvider(confirmpasswordVisibilityProvider);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ProviderListener(
            provider: exceptionMessageProvider,
            onChange: (BuildContext context, StateController<CustomException?> customException,) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color(0xff29283C),
                  content: Text(customException.state!.message!),
                ),
              );
            },
            child: ProgressHUD(
              backgroundColor: const Color(0xff0000FF),
              indicatorColor:Colors.white,
              child: Builder(
                builder: (context){
                  return Container(
                    width: width,
                    height: height,
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          elevation: 0,
                          title: Text(
                            "",
                            style: GoogleFonts.josefinSans(
                                textStyle: TextStyle(
                                    color: const Color(0xff3E3E3E),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          centerTitle: true,
                          pinned: true,
                          backgroundColor: Colors.white,
                          leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: const Color(0xff0000FF),
                              size: 24,
                            ),
                            onPressed: () {
                              context.popRoute();
                            },
                          ),
                        ),

                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal:17.0),
                          sliver: SliverList(delegate: SliverChildListDelegate([
                            SizedBox(height: height*0.05,),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Theme(
                                        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                        child: TextFormField(
                                          autofocus: false,
                                          keyboardType:
                                          TextInputType.emailAddress,
                                          validator: (val){
                                            if(val==null) return "Field must not be empty";
                                            else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)) return "Email is not valid";
                                            else
                                              return null;
                                          },
                                          onSaved: (value)=>email.value=value,
                                          style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelText: "Email",
                                            labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                            suffixIcon:Icon(Icons.email,size:24,color: const Color(0xffACACAC)),
                                            contentPadding:
                                            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 22,),
                                          Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 22,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Theme(
                                        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                        child: TextFormField(
                                          autofocus: false,
                                          keyboardType:
                                          TextInputType.phone,
                                          validator: (val){
                                            if(val==null) return "Field must not be empty";

                                            else if(val.length>11) return "Must be 11 digit";
                                            else
                                              return null;
                                          },
                                          onSaved: (value)=>phoneNumber.value=value,
                                          style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              labelText: "Mobile No",
                                              labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                              suffixIcon: Icon(Icons.phone_android,size:24,color: const Color(0xffACACAC),),
                                              contentPadding:
                                              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              enabledBorder:OutlineInputBorder(
                                                borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                                borderRadius: BorderRadius.circular(5),
                                              )
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 22,),
                                          Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14))),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 22,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Theme(
                                        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                        child: TextFormField(
                                          autofocus: false,
                                          keyboardType:
                                          TextInputType.text,
                                          style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          obscureText: !passwordVisibilityState.state,
                                          validator: (val){
                                            if(val==null) return "Field must not be empty";

                                            else if(!validatePasswordStructure(val)) return "UpperCase,Number,Special Symbol and Length must be at least 8 Charater Long";

                                            else
                                              return null;
                                          },
                                          onSaved: (value)=>password.value=value,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelText: "Password",
                                            labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                passwordVisibilityState.state
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: const Color(0xffACACAC),
                                                size: 24,
                                              ),
                                              onPressed: () {
                                                passwordVisibilityState.state = !passwordVisibilityState.state;
                                              },
                                            ),
                                            contentPadding:
                                            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 22,),
                                          Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                                        ],
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 22,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Theme(
                                        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                        child: TextFormField(
                                          autofocus: false,
                                          keyboardType:
                                          TextInputType.text,
                                          style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          obscureText: !confirmpasswordVisibilityState.state,
                                          validator: (val){
                                            if(val==null) return "Field must not be empty";

                                            else if(!validatePasswordStructure(val)) return "UpperCase,LowerCase,Number,Special Symbol and Length must be at least 6 Charater Long";

                                            else
                                              return null;
                                          },
                                          onSaved: (value)=>confirmpassword.value=value,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelText: "Confirm Password",
                                            labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                confirmpasswordVisibilityState.state
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: const Color(0xffACACAC),
                                                size: 24,
                                              ),
                                              onPressed: () {
                                                confirmpasswordVisibilityState.state = !confirmpasswordVisibilityState.state;
                                              },
                                            ),
                                            contentPadding:
                                            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 22,),
                                          Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height*0.10,),
                            CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "CONTINUE", buttonFontColor: Colors.white, onButtonPressed: () async{
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                if(password.value!=confirmpassword.value){
                                  return await Fluttertoast.showToast(msg: "Password do not match",toastLength: Toast.LENGTH_LONG);
                                }
                                final progress = ProgressHUD.of(context);
                                progress!.showWithText('Registering User...');
                              await  context.read(authControllerProvider.notifier).registerUser({
                                  "email":email.value!,
                                  "password":password.value!,
                                  "phoneNumber":phoneNumber.value!
                                });
                                await context.read(serviceTypeControllerProvider.notifier).saveServicesToCollectionRef();
                                FirebaseMessaging _fcm = FirebaseMessaging.instance;
                                String? fcmToken = await _fcm.getToken();
                                if(fcmToken!=null){
                                  await context.read(userRepositoryProvider).saveDeviceToken(fcmToken);
                                }
                                if(context.read(exceptionMessageProvider).state!=null){
                                  progress.dismiss();
                                  context.read(exceptionMessageProvider).state=null;
                                }
                              progress.dismiss();
                              User? user=  context.read(authControllerProvider);
                                if(user!=null){
                                  if(context.read(userModelExtensionController)?.userModel.fcmtoken==null){
                                    String? fcmToken = await _fcm.getToken();
                                    if(fcmToken!=null){
                                      await context.read(userRepositoryProvider).saveDeviceToken(fcmToken);
                                    }
                                    progress.dismiss();
                                    await Fluttertoast.showToast(msg: "Verification Email Sent Successfully",toastLength: Toast.LENGTH_LONG);
                                    context.read(authControllerProvider.notifier).signOut();
                                    context.router.navigate(AppEntryRoute());
                                  }else{
                                    progress.dismiss();
                                    await Fluttertoast.showToast(msg: "Verification Email Sent Successfully",toastLength: Toast.LENGTH_LONG);
                                    context.read(authControllerProvider.notifier).signOut();
                                    context.router.navigate(AppEntryRoute());
                                  }
                                  //Send user to the entry page
                                }
                              }
                            }, imageIcon: null,),
                            SizedBox(height: height*0.07,),
                            Text.rich(
                              TextSpan(
                                text: "By joining you agree to Halawork’s",
                                style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff29283C))),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Terms Of Service",
                                      style:GoogleFonts.roboto(textStyle: TextStyle(decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff0000FF)))),
                                  // can add more TextSpans here...
                                ],
                              ),
                            ),
                            SizedBox(height: height*0.10,),
                            GestureDetector(
                              onTap: (){
                                context.router.navigate(LoginRoute());
                              },

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text("Already have an account?",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff29283C)))),
                                  Text("Login",style: GoogleFonts.roboto(textStyle: TextStyle(decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff0000FF)))),

                                ],),
                            )
                          ]),),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Function OpenMail
  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
