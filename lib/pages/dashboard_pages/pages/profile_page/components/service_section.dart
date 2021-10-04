import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class ServiceSection extends HookWidget{
  const ServiceSection();

  @override
  Widget build(BuildContext context) {
    var userModelState = useProvider(userControllerProvider);
    var size = MediaQuery.of(context).size;
    return userModelState==null?Text(""):SliverList(
      delegate: SliverChildListDelegate([
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userModelState.userModel.isBuyer?SizedBox.shrink():Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Services",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Text(
                    "EDIT",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff0000FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 27,),
            userModelState.userModel.service==null?SizedBox.shrink():Container(
              width:size.width,
              height: size.height*0.065,
              padding:EdgeInsets.only(left: 22),
              child: Align(alignment:Alignment.centerLeft,child: Text(userModelState.userModel.service!,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white)),)),
              decoration: BoxDecoration(color: const Color(0xff0000FF),borderRadius: BorderRadius.circular(4)),
            ),
            SizedBox(height: 28,),
            Text("Selected Sub Category",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12,color: const Color(0xff29283C),fontWeight: FontWeight.w700)),),
          ],
        )
      ]),
    );
  }
}
