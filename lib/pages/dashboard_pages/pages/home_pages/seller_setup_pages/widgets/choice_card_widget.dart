import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
class ChoiceCard extends HookWidget {
  final String choiceTitle,choiceImage;
  final Function(bool isClicked)? onTap;
  final bool selected;
  ChoiceCard({required this.choiceImage, required this.choiceTitle,required this.onTap,required this.selected });


  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    isSelected.value = selected;
    return GestureDetector(
      onTap: (){
        isSelected.value = !isSelected.value;
        if (onTap != null) onTap!(true);
      },
      child: Container(
        width: width,
        height: height*0.30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(choiceImage,width: 116.11,height: 127.96,fit: BoxFit.scaleDown,),
            ),
            SizedBox(height: height*0.03,),
            Center(child: Text(choiceTitle,style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: const Color(0xff0000FF))),),),
            SizedBox(height: 10,),
            Expanded(child: Text("")),
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(color: selected?const Color(0xff0000FF):const Color(0xffACACAC),borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10) )),
            )
          ],
        ),
        decoration: BoxDecoration(color: const Color(0xffEBEBFF), borderRadius: BorderRadius.circular(5),  boxShadow: [
          BoxShadow(
              color:  const Color(0xffACACAC),
              blurRadius: 6.0,
              offset: Offset(0, 3)
          )
        ]),
      ),
    );
  }
}