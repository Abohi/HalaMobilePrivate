import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
    backgroundColor: Colors.white,
        body: Container(
      width: size.width,
      height: size.height,
      child: Center(
        child: SvgPicture.asset("assets/images/logo1.svg"),
      ),
    ));
  }
}
