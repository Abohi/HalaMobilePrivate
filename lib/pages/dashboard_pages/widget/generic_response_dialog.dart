import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericResponseDialog extends StatelessWidget {
  final onBottonPressed;
  final String? text1,text2,btnText;
  const GenericResponseDialog({required this.onBottonPressed,required this.text1,
    required this.text2,required this.btnText});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: WillPopScope(
        onWillPop: ()async{
          onBottonPressed();
          return true;
        },
        child: Container(
          width: width * 0.78,
          height: height * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:30),
              Text(text1??"Funds withdrawn",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: const Color(0xff29283C)),
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              Text(text2??"To your bank",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: const Color(0xff29283C)),
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: 27.13,
              ),
              SvgPicture.asset("assets/images/verify_mark.svg"),
              SizedBox(
                height: 50.13,
              ),
              GestureDetector(
                onTap: (){
                  onBottonPressed();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(btnText??"CONTINUE",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: const Color(0xff0000FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}