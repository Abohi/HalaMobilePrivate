import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsItemCard extends HookWidget {
  final String labelText;
  final Function onButtonPressed;
  const SettingsItemCard({required this.labelText,required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width,
        padding: EdgeInsets.only(top: 30,bottom: 30,left: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: const Color(0xffE6E6E6),width: 1)
          )
        ),
        child: Text(labelText,style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: const Color(0xff29283C)
          )
        ),)
      ),
    );
  }
}
