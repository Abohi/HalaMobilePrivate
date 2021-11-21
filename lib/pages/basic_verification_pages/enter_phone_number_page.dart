import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';


class EnterPhoneNumberPage extends HookWidget {
  const EnterPhoneNumberPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _textEditingController = useTextEditingController();
    return ProgressHUD(
      backgroundColor:const Color(0xff0000FF),
      indicatorColor: Colors.white,
      child: Builder(
        builder: (context){
          return SafeArea(
            child: Scaffold(
              body: Container(
                width: size.width,
                height: size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Please provide your phone number for verification",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black)),),
                      SizedBox(height: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                            child: TextField(
                              autofocus: false,
                              keyboardType:
                              TextInputType.phone,
                              controller: _textEditingController,
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
                      SizedBox(height: 20,),
                      CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "CONTINUE", buttonFontColor: Colors.white, onButtonPressed: () async{
                        if(_textEditingController.text.isEmpty){
                          return Fluttertoast.showToast(msg: "Field cannot be empty",toastLength: Toast.LENGTH_LONG);
                        }
                        if(_textEditingController.text.length<11 || _textEditingController.text.length>11){
                          return Fluttertoast.showToast(msg: "Phone number must be 11 digit",toastLength: Toast.LENGTH_LONG);
                        }
                        final progress = ProgressHUD.of(context);
                        progress!.showWithText('Updating User Info...');
                        UserModel userModel = UserModel(phoneNumber: _textEditingController.text.toString(),email:context.read(authControllerProvider)!.email);
                        await context.read(authControllerProvider.notifier).updateUserModel(context.read(authControllerProvider)!.uid,userModel);
                        progress.dismiss();
                        context.router.navigate(AppEntryRoute());
                      }, imageIcon: null,),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
