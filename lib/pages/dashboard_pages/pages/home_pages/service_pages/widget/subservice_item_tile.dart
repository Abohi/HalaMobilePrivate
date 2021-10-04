import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubServiceItemTile extends StatelessWidget {
  final String subServiceName;
  final Function voidButtonPressed;
  const SubServiceItemTile({required this.subServiceName,required this.voidButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=>voidButtonPressed(),
      child: Container(
        color: const Color(0xffE6E6E6),
        width: size.width,
        height: size.height*0.08,
        margin: EdgeInsets.only(top: 4),
        child: Center(child: Text(subServiceName,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12,color: const Color(0xff555555),fontWeight: FontWeight.normal)),)),
      ),
    );
  }
}