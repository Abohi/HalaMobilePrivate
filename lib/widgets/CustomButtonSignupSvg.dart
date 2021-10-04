import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonSignupSvg extends StatelessWidget {
  final Color buttonBg,buttonFontColor;
  final String buttonTitle;
  final bool isBorder,isIconLeft;
  final Function onButtonPressed;
  final Icon icon;


  const CustomButtonSignupSvg({required this.buttonBg,required this.buttonTitle,required this.buttonFontColor,this.isBorder=false,required this.onButtonPressed,this.isIconLeft=false,required this.icon});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: GestureDetector(
        onTap: (){
          onButtonPressed();
        },
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width*0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: buttonBg,
              border: this.isBorder?Border.all(width: 1,color: const Color(0xff0000FF)):null
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Spacer(),
                  isIconLeft?icon:Text(""),
                  isIconLeft?SizedBox(width: 20,):Text(""),
                  Text(buttonTitle,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: this.buttonFontColor)),),
                  Spacer(),
              ],
            )),
      ),
    );
  }
}
