import 'package:flutter/material.dart';
class CustomSliverDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: EdgeInsets.only(
          bottom: size.height * 0.025,
          top: size.height * 0.025),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 1,
          width: size.width,
          color: const Color(0xffACACAC),
        ),
      ),
    );
  }
}