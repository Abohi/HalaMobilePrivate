import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:auto_route/auto_route.dart';
class SellerSetupCompletePage extends HookWidget {
  const SellerSetupCompletePage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
    backgroundColor:const Color(0xff0000FF),
        body: Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height*0.1,),
            Center(child: Text("Almost there!",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 34,color:Colors.white,fontWeight: FontWeight.w700)),)),
            SizedBox(height: 12,),
            Center(child: Text("Just one more step to go!!",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,color:Colors.white,fontWeight: FontWeight.normal)),)),
            SizedBox(height: size.height*0.1,),
            SvgPicture.asset("assets/images/almost_there.svg"),
            SizedBox(height: size.height*0.15,),
            CustomButtonSignup(buttonBg: Colors.white, buttonTitle: "NEXT  >", buttonFontColor: const Color(0xff0000FF), onButtonPressed: (){
              context.router.replaceAll([DashBoardRoute()]);
            }, imageIcon: null,),
            SizedBox(height: 20,),
          ],
        ),
      ),
    )));
  }
}



