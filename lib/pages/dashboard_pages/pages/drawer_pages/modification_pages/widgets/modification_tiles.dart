import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class ModificationTile extends HookWidget {
  final String title,date;
  final Function onButtonPressed;
  const ModificationTile({required this.title,required this.date,required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width,
        height: size.height*0.15,
        child: Column(
          children: [
            Text(title,style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 18)),),
            const SizedBox(height: 20,),
            Text(date,style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),)
          ],
        ),
      ),
    );
  }
}
