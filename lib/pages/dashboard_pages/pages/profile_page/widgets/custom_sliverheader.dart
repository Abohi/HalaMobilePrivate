import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliverHeader extends StatelessWidget {
  final leftHeadTitle,rightHeaderTitle;
  final Function voidButtonPressed;
  const CustomSliverHeader({required this.leftHeadTitle,required this.rightHeaderTitle,required this.voidButtonPressed});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only( bottom: 20),
      sliver: SliverToBoxAdapter(
        child: GestureDetector(
          onTap: (){
            voidButtonPressed();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leftHeadTitle,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ),
              Text(
                rightHeaderTitle,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff0000FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}