import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformOrderActionBtn extends StatelessWidget {
  final String buttonLabel;
  final Function onButtonPressed;
  const PerformOrderActionBtn({required this.buttonLabel,required this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
          width: size.width,
          height: size.height*0.08,
          decoration:BoxDecoration(color:const Color(0xff0000FF),borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Text(this.buttonLabel,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize:14,fontWeight: FontWeight.w700,color: Colors.white),),
            ),
          )),
    );
  }
}