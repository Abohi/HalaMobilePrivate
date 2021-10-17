//message seller button
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonOutLine extends StatelessWidget {
  final Function  onButtonPressed;
  final String? buttonLabel;
  const CustomButtonOutLine({required this.onButtonPressed,required this.buttonLabel});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width*0.43,
        height: size.height * 0.08,
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xff0000FF))),
        child: Center(
          child: Text(
            buttonLabel??"DECLINE",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: const Color(0xff0000FF),
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}

//offer seller the work button
class CustomButtonFilled extends StatelessWidget {
  final Function onButtonPressed;
  final String? buttonLabel;
  const CustomButtonFilled({required this.onButtonPressed,required this.buttonLabel});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width*0.43,
        height: size.height * 0.08,
        decoration: BoxDecoration(color: Color(0xff0000FF),
          borderRadius: BorderRadius.circular(4),),
        child: Center(
          child: Text(
            buttonLabel??"PAY",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color:Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}