import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class CompleteSellerProfile extends HookWidget {
  final Function onDismissedClicked;

  const CompleteSellerProfile({required this.onDismissedClicked});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userControllerProvider);
    return SliverAppBar(
      titleSpacing: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      collapsedHeight: size.height * 0.15,
      flexibleSpace: Container(
        width: size.width,
        height: size.height * 0.15,
        padding: EdgeInsets.symmetric(horizontal: 17),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom:
                BorderSide(width: 1.0, color: const Color(0xffACACAC)),
                top: BorderSide(width: 2.0, color: const Color(0xffE6E6E6)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Complete your profile to gain full functionality As a seller.",
              style: GoogleFonts.roboto(textStyle: TextStyle(
                  color: const Color(0xFF29283C),
                  fontWeight: FontWeight.normal,
                  fontSize: 14
              )),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                (userModelState!.userModel.isSeller==false)&&(userModelState.userModel.isDismissCompleteProfile==true)?SizedBox.shrink():GestureDetector(
                  onTap: (){
                   onDismissedClicked();
                  },
                  child: Text(
                    "DISMISS",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff0000FF))),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () async{
                    context.router.navigate(SelectSellerTypeRoute());
                  },
                  child: Text(
                    "SETUP PROFILE",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff0000FF))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      pinned: true,
      centerTitle: false,
    );
  }
}