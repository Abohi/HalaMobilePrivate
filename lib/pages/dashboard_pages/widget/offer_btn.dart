import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferBtn extends StatelessWidget {
  final Function onButtonPressed;
  const OfferBtn({required this.onButtonPressed});
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
        width: size.width,
        height: size.height * 0.08,
        decoration: BoxDecoration(color: Color(0xff0000FF),
          borderRadius: BorderRadius.circular(4),),
        child: Center(
          child: Text(
            "OFFER",
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