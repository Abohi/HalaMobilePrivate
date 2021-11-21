import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ByServiceComponentHeader extends StatelessWidget {
  final Function onButtonPressed;
  const ByServiceComponentHeader({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 17.0, bottom: 20, right: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "By Sevices",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff29283C),
                      fontSize: 16)),
            ),
            Text(
              "View all",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff0000FF),
                      fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
