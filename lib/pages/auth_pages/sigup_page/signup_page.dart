
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/pages/auth_pages/login_widget/custom_login_divider.dart';
import 'package:halawork/repositories/auth_repository.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class SignupPage extends HookWidget {
  const SignupPage();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width =size.width;
    var height = size.height;
    return WillPopScope(
      onWillPop: () async {

        return true;
      },
      child: ProgressHUD(
      backgroundColor:const Color(0xff0000FF),
      indicatorColor: Colors.white,
        child: Builder(
          builder: (context){
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Container(
                  width:width ,
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

                          },
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal:17.0),
                        sliver: SliverList(delegate: SliverChildListDelegate([
                          SizedBox(height: height*0.05,),
                          Center(child: SvgPicture.asset("assets/images/logo1.svg")),
                          SizedBox(height: height*0.10,),
                          Center(
                              child: Text("Sign Up",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 34,fontWeight: FontWeight.w500,color: const Color(0xff0000FF)),),
                              )),
                          SizedBox(height: height*0.03,),
                          Center(
                              child: Text("Join the most industrious marketplace",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff29283C)),),
                              )),
                          SizedBox(height: height*0.10,),
                          CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "SIGNUP WITH EMAIL", buttonFontColor: Colors.white, onButtonPressed: (){
                            context.router.navigate(EmailSignupRoute());
                          }, imageIcon: null,),
                          SizedBox(height: height*0.03,),
                          CustomDivider(),
                          SizedBox(height: height*0.03,),
                          CustomButtonSignup(buttonBg: const Color(0xff3D5D9A), buttonTitle: "SIGNUP WITH FACEBOOK", buttonFontColor: Colors.white, onButtonPressed: ()async{

                          },isIconLeft: true,imageIcon: SvgPicture.asset("assets/images/fb_icon.svg"),),
                          SizedBox(height: 16,),
                          CustomButtonSignup(buttonBg:Colors.white, buttonTitle: "SIGNUP WITH GOOGLE", buttonFontColor: const Color(0xff29283C), onButtonPressed: ()async{
                            final progress = ProgressHUD.of(context);
                            progress!.showWithText('Login User...');
                            UserCredential? userCredential = await context.read(authRepositoryProvider).loginGoogle();
                            if(userCredential!=null){
                              if(userCredential.user!=null){
                                if(context.read(authControllerProvider)!=null){
                                  FirebaseMessaging _fcm = FirebaseMessaging.instance;
                                  if(context.read(userControllerProvider)?.userModel.fcmtoken==null){
                                    String? fcmToken = await _fcm.getToken();
                                    if(fcmToken!=null){
                                      await context.read(userRepositoryProvider).saveDeviceToken(fcmToken);
                                      progress.dismiss();
                                      context.router.navigate(EnterPhoneNumberRoute());
                                    }else{
                                      String? fcmToken = await _fcm.getToken();
                                      await context.read(userRepositoryProvider).saveDeviceToken(fcmToken!);
                                      progress.dismiss();
                                      context.router.navigate(EnterPhoneNumberRoute());
                                    }

                                  }else{
                                    progress.dismiss();
                                    context.router.navigate(EnterPhoneNumberRoute());
                                  }
                                }else{
                                  progress.dismiss();
                                }
                              }
                            }
                          },isIconLeft: true,imageIcon:SvgPicture.asset("assets/images/google_icon.svg"),),
                          SizedBox(height: height*0.06,),
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
                          )
                        ]),),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ));
  }
}

