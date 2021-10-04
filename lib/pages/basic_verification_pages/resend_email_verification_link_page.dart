import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class ResendEmailVerificationLinkPage extends HookWidget {
  const ResendEmailVerificationLinkPage();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async{
       return false;
      },
      child: Scaffold(
        body: ProviderListener(
          provider: exceptionMessageProvider,
          onChange: (BuildContext context, StateController<CustomException?> customException,) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(customException.state!.message!),
              ),
            );
          },
          child: ProgressHUD(
            backgroundColor:const Color(0xff0000FF),
            indicatorColor: Colors.white,
            child:Builder(
              builder: (context){
                return SafeArea(
                  child: Container(
                    height: height,
                    width: width,
                    color: const Color(0xff0000FF),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:17.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: height*0.15,),
                            Center(child: Text("Email Verification",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 34,fontWeight: FontWeight.w500,color: Colors.white)),),),
                            Center(child: Text("Please click the button to verify your email account",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),),),
                            SizedBox(height: height*0.2,),
                            CustomButtonSignup(buttonBg: Colors.white, buttonTitle: "Resend Email Verification", buttonFontColor: const Color(0xff0000FF), onButtonPressed: ()async{
                              final progress = ProgressHUD.of(context);
                              progress!.showWithText('Sending Email Verification...');
                              await context.read(authControllerProvider.notifier).sendEmailVerificationLink();
                              progress.dismiss();
                              //AppEntry route/main route
                            }, imageIcon: null,),
                            SizedBox(height: 20,),
                            CustomButtonSignup(buttonBg: Colors.white, buttonTitle: "Already Verified", buttonFontColor: const Color(0xff0000FF), onButtonPressed: (){
                              //AppEntry route/main route
                              context.router.navigate(AppEntryMainRoute());
                            }, imageIcon: null,),
                            SizedBox(height: height*0.10,)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
