
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/providers/general_providers/phoneVerificationCodeProvider.dart';
import 'package:halawork/providers/general_providers/user_profile_provider.dart';
import 'package:halawork/repositories/auth_repository.dart';
import 'package:halawork/utils/pref_manager.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhoneVerificationPage extends HookWidget{
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 *1;
  late CountdownTimerController controller;
  late String? phoneNo =null;
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: const Color(0xff0000FF), width: 1),
      borderRadius: BorderRadius.circular(15),
      color: Color(0xffEBEBFF),
    );
  }


  @override
  Widget build(BuildContext context) {
    final userModelState = useProvider(userControllerProvider);

    final countDownController = useMemoized(() => CountdownTimerController(endTime: endTime, onEnd: ()async{
     PreferenceManager().savePhoneCode(0);
    }));
    phoneNo = userModelState!.userModel.phoneNumber;
    phoneNo?.replaceRange(0, 6, "*******");
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
   final _textEditingController = useTextEditingController();

    return WillPopScope(
      onWillPop: () async {
       return false;
      },
      child: Scaffold(
        body: ProviderListener(
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
              builder: (context){
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      elevation: 0,
                      title: Text(
                        "Phone Verification Page",
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                color: const Color(0xff3E3E3E),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      centerTitle: true,
                      pinned: true,
                      backgroundColor: Colors.white,
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      sliver: SliverList(delegate: SliverChildListDelegate([
                        SizedBox(
                          height: height * 0.07,
                        ),
                        Text("Please verify your mobile number?",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff29283C)))),
                        SizedBox(
                          height: 12,
                        ),
                        Text("A code has been sent to $phoneNo.",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 14, color: const Color(0xff29283C)))),
                        SizedBox(
                          height: height * 0.10,
                        ),
                        SizedBox(
                            width: width,
                            child: PinPut(
                              fieldsCount: 5,
                              controller: _textEditingController,
                              submittedFieldDecoration: _pinPutDecoration.copyWith(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              selectedFieldDecoration: _pinPutDecoration,
                              followingFieldDecoration: _pinPutDecoration.copyWith(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                Border.all(color: const Color(0xffEBEBFF), width: 1),
                              ),
                            )),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            GestureDetector(
                              onTap: ()async{
                                await context.read(authRepositoryProvider).sendPhoneValidationCode(context.read(userControllerProvider)!.userModel.phoneNumber);
                              },
                              child:  Text.rich(
                                TextSpan(
                                  text: "Didn’t get the code?",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: const Color(0xff29283C))),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "resend code",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                decoration: TextDecoration.underline,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff0000FF)))),
                                    // can add more TextSpans here...
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: CountdownTimer(
                              controller: countDownController,
                              widgetBuilder: (BuildContext context, CurrentRemainingTime? time){
                                if(time!=null){
                                  return Text("${time.min??"0"}:${time.sec??"0"}",style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff29283C)),
                                  ),);
                                }
                                return Text("0:0",style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff29283C)),
                                ));

                              },
                            )),
                        SizedBox(
                          height: height * 0.20,
                        ),
                        CustomButtonSignup(
                          buttonBg: const Color(0xff0000FF),
                          buttonTitle: "NEXT  >",
                          buttonFontColor: Colors.white,
                          onButtonPressed: () async{
                            if(_textEditingController.text.toString().isEmpty)
                              return await Fluttertoast.showToast(msg: "Field cannot be empty",toastLength: Toast.LENGTH_LONG);

                            final int? sentCode = await PreferenceManager().getPhoneCode();
                            if(int.parse(_textEditingController.text.toString())==sentCode!){
                              final progress = ProgressHUD.of(context);
                              progress!.showWithText('Verifying phone number...');
                              //verify buyer
                              await context.read(authControllerProvider.notifier).verifyAsBuyer(UserModel(phoneNumber: "",isPhoneNumberVerified: true,
                                  isBuyer: true));

                              await Fluttertoast.showToast(msg: "Send to dashboard",toastLength: Toast.LENGTH_LONG);
                              progress.dismiss();

                            }else if(sentCode==0 || sentCode==null){
                              await Fluttertoast.showToast(msg: "Verification Code Has Expired",toastLength: Toast.LENGTH_LONG);
                            }else{
                              await Fluttertoast.showToast(msg: "Verification Failed",toastLength: Toast.LENGTH_LONG);
                            }
                          }, imageIcon: null,),
                        SizedBox(
                          height: height * 0.06,
                        )
                      ]),),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}


// if(this.isOrganization){
// BlocProvider.of<HalaworkBloc>(context)
//     .add(HalaworkProfileSelectEducationIndividualEvent(this.isOrganization));
// }else{
// BlocProvider.of<HalaworkBloc>(context)

//     .add(HalaworkProfileChoiceEvent());
// }