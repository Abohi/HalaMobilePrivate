
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBtn extends StatelessWidget {
  final Function onButtonPressed;
  final String? label;
  const MessageBtn({required this.onButtonPressed,this.label});
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
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xff0000FF))),
        child: Center(
          child: Text(
            label??"MESSAGE",
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