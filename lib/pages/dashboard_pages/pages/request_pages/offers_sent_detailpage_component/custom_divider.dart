import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 0.5,
      margin: EdgeInsets.only(top: size.height*0.04,bottom: size.height*0.04),
      color: const Color(0xffACACAC),
    );
  }
}