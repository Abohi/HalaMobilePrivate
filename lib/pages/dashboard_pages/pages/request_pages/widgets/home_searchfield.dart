import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearchField extends StatelessWidget {
  final Function onButtonPressed;
  const HomeSearchField({required this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width,
        height: size.height*0.07,
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 21),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xffACACAC), width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search,
              color: const Color(0xff0000FF),
              size: 15,
            ),
            SizedBox(
              width: 12.83,
            ),
            Text(
              "What are you looking for?",
              style: GoogleFonts.roboto(
                  textStyle:
                  TextStyle(color: const Color(0xffACACAC), fontSize: 14)),
            ),
            Spacer(),
            Icon(Icons.filter_list, color:  const Color(0xff0000FF), size: 15),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}