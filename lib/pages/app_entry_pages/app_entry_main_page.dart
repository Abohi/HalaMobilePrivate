import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:auto_route/auto_route.dart';

class AppEntryMainPage extends StatelessWidget {
  const AppEntryMainPage();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal:17.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: height*0.10,),
            Center(child: SvgPicture.asset("assets/images/logo1.svg")),
            SizedBox(height: height*0.05,),
            Center(child: SvgPicture.asset("assets/images/breakingdeal.svg")),
            SizedBox(height: height*0.10,),
            CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "SIGN UP", buttonFontColor: Colors.white, onButtonPressed: (){
              //Signup route
              context.router.navigate(SignupRoute());
            }, imageIcon: null,),
            SizedBox(height: 16,),
            CustomButtonSignup(buttonBg: Colors.white, buttonTitle: "LOGIN", buttonFontColor: const Color(0xff0000FF),isBorder: true,onButtonPressed: ()async{
              context.router.navigate(LoginRoute());
            }, imageIcon: null,),
            SizedBox(height: height*0.10,),
          ],
        ),
      ),
    );
  }


}
