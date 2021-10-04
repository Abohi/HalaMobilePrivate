import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Divider(color: const Color(0xffACACAC),thickness: 2,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:4.0),
            child: Text("OR",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xffACACAC)))),
          ),
          Expanded(child: Divider(color: const Color(0xffACACAC),thickness: 2,)),
        ],
      ),
    );
  }
}