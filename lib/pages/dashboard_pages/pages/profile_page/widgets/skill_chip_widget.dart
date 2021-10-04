import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillItemChip extends StatelessWidget {
  final String name;
  const SkillItemChip({required this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: InputChip(

        labelPadding: EdgeInsets.only(left: 0, top: -2, bottom: -2),
        label: Text(
          name,
          style: GoogleFonts.roboto(
              textStyle:
              TextStyle(color: const Color(0xff5A5AFC), fontSize: 14)),
        ),
        labelStyle: GoogleFonts.roboto(
            textStyle: TextStyle(color: const Color(0xffEBEBFF), fontSize: 10)),
        backgroundColor: const Color(0xffEBEBFF),
      ),
    );
  }
}