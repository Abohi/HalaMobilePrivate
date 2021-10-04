import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewOfferBtn extends StatelessWidget {
  final Function onButtonPressed;
  final String? btnLabel;
  final bool isViewBtn;

  const ViewOfferBtn({required this.onButtonPressed,required this.btnLabel,required this.isViewBtn});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onButtonPressed();
      },
      child: Container(
        width: size.width,
        height: isViewBtn?size.height * 0.065:size.height * 0.08,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xff0000FF))),
        child: Center(
          child: Text(
            btnLabel??"VIEW OFFERS",
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