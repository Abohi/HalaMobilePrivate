import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTile extends HookWidget {
  final String title,description;
  const HistoryTile({required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.1,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,style: GoogleFonts.roboto(
                color: const Color(0xff29283C),
                fontWeight: FontWeight.w700,
                fontSize: 14
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.edit,color: const Color(0xff5A5AFC),size: 18,),
                  SizedBox(width: 28,),
                  Icon(Icons.delete,color: const Color(0xff5A5AFC),size: 18,),
                ],
              )
            ],
          ),
          SizedBox(height: 8,),
          Text(description,style: GoogleFonts.roboto(
              color: const Color(0xff555555),
              fontWeight: FontWeight.normal,
              fontSize: 12
          ),),
        ],
      )
    );
  }
}
