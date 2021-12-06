
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/pages/auth_pages/login_widget/custom_login_divider.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/repositories/auth_repository.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/utils/passwordValidationStructure.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
class LoginPage extends HookWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final passVisibilityProvider = useProvider(passwordVisibilityProvider);
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
                  backgroundColor: const Color(0xff3E3E3E),
                  content: Text(customException.state!.message!),
                ),
              );
            },
            child: ProgressHUD(
              backgroundColor:const Color(0xff0000FF),
              indicatorColor: Colors.white,
              child: Builder(
                builder: (BuildContext context){
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
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate([
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Center(child: SvgPicture.asset("assets/images/logo1.svg")),
                              SizedBox(
                                height: height * 0.08,
                              ),
                              Center(
                                child: Text(
                                  "Welcome back",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 34,
                                          color: const Color(0xff0000FF),
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Hala Work - Go Work",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14, color: const Color(0xff29283C))),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircularButton(
                                    onButtonPressed: ()async{
                                      final progress = ProgressHUD.of(context);
                                      progress!.showWithText('Creating Account...');
                                      bool? result =  await context.read(authRepositoryProvider).logInWithFacebook();
                                      if(result!){
                                        if(context.read(authControllerProvider)!=null){
                                          FirebaseMessaging _fcm = FirebaseMessaging.instance;
                                          if(context.read(userModelExtensionController)?.userModel.fcmtoken==null){
                                            String? fcmToken = await _fcm.getToken();
                                            if(fcmToken!=null){
                                              await context.read(userRepositoryProvider).saveDeviceToken(fcmToken);
                                              progress.dismiss();
                                              context.router.navigate(AppEntryRoute());
                                            }else{
                                              String? fcmToken = await _fcm.getToken();
                                              await context.read(userRepositoryProvider).saveDeviceToken(fcmToken!);
                                              progress.dismiss();
                                              context.router.navigate(AppEntryRoute());
                                            }

                                          }else{
                                            progress.dismiss();
                                            context.router.navigate(AppEntryRoute());
                                          }
                                        }else{
                                          progress.dismiss();
                                        }
                                      }else{
                                        progress.dismiss();
                                      }
                                    },
                                    iconImage:
                                    SvgPicture.asset("assets/images/fb_icon.svg"),
                                    bgColor: const Color(0xff3D5D9A),
                                  ),
                                  SizedBox(
                                    width: 46,
                                  ),
                                  CircularButton(
                                    onButtonPressed: ()async{
                                      final progress = ProgressHUD.of(context);
                                      progress!.showWithText('Login User...');
                                      UserCredential? userCredential = await context.read(authRepositoryProvider).loginGoogle();
                                      if(userCredential!=null){
                                        if(userCredential.user!=null){
                                          if(context.read(authControllerProvider)!=null){
                                            FirebaseMessaging _fcm = FirebaseMessaging.instance;
                                            String? fcmToken = await _fcm.getToken();
                                            if(fcmToken!=null){
                                              await context.read(userRepositoryProvider).saveDeviceToken(fcmToken);
                                              progress.dismiss();
                                              context.router.navigate(AppEntryRoute());
                                            }else{
                                              String? fcmToken = await _fcm.getToken();
                                              await context.read(userRepositoryProvider).saveDeviceToken(fcmToken!);
                                              progress.dismiss();
                                              context.router.navigate(AppEntryRoute());
                                            }
                                          }else{
                                            progress.dismiss();
                                          }
                                        }
                                      }
                                    },
                                    iconImage:
                                    SvgPicture.asset("assets/images/google_icon.svg"),
                                    bgColor: Colors.white,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              CustomDivider(),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  autofocus: false,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: const Color(0xff29283C), fontSize: 14)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Email/username",
                                    labelStyle: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: const Color(0xff29283C), fontSize: 14)),
                                    suffixIcon: Icon(
                                      Icons.email,
                                      size: 24,
                                      color: const Color(0xffACACAC),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color(0xff0000FF), width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color(0xffACACAC), width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.04),
                              Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  controller: _passwordController,
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: const Color(0xff29283C), fontSize: 14)),
                                  obscureText: !passVisibilityProvider.state,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Password",
                                    labelStyle: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: const Color(0xff29283C), fontSize: 14)),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        passVisibilityProvider.state
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xffACACAC),
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        passVisibilityProvider.state=!passVisibilityProvider.state;
                                      },
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color(0xff0000FF), width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color(0xffACACAC), width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.04),
                              CustomButtonSignup(
                                buttonBg: const Color(0xff0000FF),
                                buttonTitle: "LOGIN",
                                buttonFontColor: Colors.white,
                                onButtonPressed: () async {
                                  if(_emailController.text.isEmpty || _passwordController.text.isEmpty)
                                    return Fluttertoast.showToast(msg: "Fields Cannot be empty",toastLength: Toast.LENGTH_LONG);
                                  final progress = ProgressHUD.of(context);
                                  progress!.showWithText('Login User...');
                                  await context.read(authControllerProvider.notifier).loginUser({
                                    "email":_emailController.text.toString(),
                                    "password":_passwordController.text.toString()
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
                                  if(context.read(authControllerProvider)!=null){
                                    if(context.read(userModelExtensionController)?.userModel.fcmtoken==null){
                                      String? fcmToken = await _fcm.getToken();
                                      if(fcmToken!=null){
                                        await context.read(userRepositoryProvider).saveDeviceToken(fcmToken);
                                        progress.dismiss();
                                        context.router.navigate(AppEntryRoute());
                                      }else{
                                        String? fcmToken = await _fcm.getToken();
                                        await context.read(userRepositoryProvider).saveDeviceToken(fcmToken!);
                                        progress.dismiss();
                                        context.router.navigate(AppEntryRoute());
                                      }
                                    }else{
                                      progress.dismiss();
                                      context.router.navigate(AppEntryRoute());
                                    }
                                  }else{
                                    progress.dismiss();
                                  }
                                }, imageIcon: null,
                              ),
                              SizedBox(height: height * 0.04),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: <Widget>[
                                    Spacer(),
                                    Text(
                                      "FORGOT PASSWORD?",
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0000FF))),
                                    ),
                                    Spacer()
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.04)
                            ]),
                          ),
                        ),
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
}

class CircularButton extends StatelessWidget {
  final SvgPicture iconImage;
  final Color bgColor;
  final Function onButtonPressed;

  const CircularButton({required this.iconImage,required this.bgColor,required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          boxShadow: [
            BoxShadow(
                color: const Color(0xffACACAC),
                blurRadius: 6.0,
                offset: Offset(0, 3))
          ],
        ),
        child: Center(
          child: iconImage,
        ),
      ),
    );
  }
}
