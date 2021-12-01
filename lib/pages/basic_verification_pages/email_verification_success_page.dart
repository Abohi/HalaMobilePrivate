import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/providers/general_providers/phoneVerificationCodeProvider.dart';
import 'package:halawork/repositories/auth_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class EmailVerificationSuccessPage extends HookWidget {
late NetworkFailure networkFailure;
  @override
  Widget build(BuildContext context) {
    var isNetworkError=useState(false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final userModelState = useProvider(userControllerProvider);
    return WillPopScope(
      onWillPop: () async{
       return false;
      },
      child: Scaffold(
        body: ProgressHUD(
          backgroundColor:const Color(0xff0000FF),
          indicatorColor: Colors.white,
          child: Builder(
            builder: (context){
              return Container(
                height: height,
                width: width,
                color: const Color(0xff0000FF),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:17.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: height*0.15,),
                      Center(child: Text("Email Verified",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 34,fontWeight: FontWeight.w500,color: Colors.white)),),),
                      Center(child: Text("Successfully",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 34,fontWeight: FontWeight.w500,color: Colors.white)),),),
                      SizedBox(height: height*0.08,),
                      Center(
                        child: SvgPicture.asset("assets/images/verify_mark.svg"),
                      ),
                      Visibility(
                        visible: !isNetworkError.value,
                        child: Expanded(
                          child: Text(""),
                        ),
                      ),
                      isNetworkError.value?ErrorWidgetControl(
                        networkFailure: networkFailure,
                        retryHandler: ()async{
                          await context.read(authRepositoryProvider).sendPhoneValidationCode(context.read(userControllerProvider)!.userModel.phoneNumber);
                        },
                      ):CustomButtonSignup(buttonBg: Colors.white, buttonTitle: "Continue", buttonFontColor: const Color(0xff0000FF), onButtonPressed: ()async{
                          if(userModelState==null){
                            context.router.navigate(EnterPhoneNumberRoute());
                          }else{
                            context.router.navigate(PhoneVerificationRoute());
                            // final progress = ProgressHUD.of(context);
                            // progress!.showWithText('Sending phone verification code...');
                            // Either<NetworkFailure,bool> response =  await context.read(authRepositoryProvider).sendPhoneValidationCode(context.read(userControllerProvider)!.userModel.phoneNumber);
                            // response.fold((l){
                            //   progress.dismiss();
                            //   isNetworkError.value = true;
                            // }, (r){
                            //   if(r){
                            //     isNetworkError.value = false;
                            //     progress.dismiss();
                            //     return context.router.navigate(PhoneVerificationRoute());
                            //   }
                            // });
                          }
                      }, imageIcon: null,),
                      SizedBox(height: height*0.10,)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
