import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WithDrawFundsButton extends StatelessWidget {
  final Function onButtonPressed;
  final String labelText;
  const WithDrawFundsButton({required this.onButtonPressed,required this.labelText});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(5)
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.59,vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(labelText,style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 16,
                color: const Color(0xff29283C),
                fontWeight: FontWeight.w700
              )
            ),),
            Icon(Icons.eleven_mp,color: const Color(0xff0000FF),size: 14,)
          ],
        ),
      ),
    );
  }
}
