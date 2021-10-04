import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonSignup extends StatelessWidget {
  final Color buttonBg,buttonFontColor;
  final String buttonTitle;
  final bool isBorder,isIconLeft;
  final Function onButtonPressed;
  final SvgPicture? imageIcon;
  final isFullWidth;


  const CustomButtonSignup({required this.buttonBg,required this.buttonTitle,required this.buttonFontColor,this.isBorder=false,required this.onButtonPressed,this.isIconLeft=false,required this.imageIcon,this.isFullWidth=false});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
          height: 50,
          width: size.width,
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
                isIconLeft?imageIcon??Text(""):Text(""),
                isIconLeft?SizedBox(width: 20,):Text(""),
                Text(buttonTitle,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: this.buttonFontColor)),),
                Spacer(),
            ],
          )),
    );
  }
}
