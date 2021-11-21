import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/user_model/user_model.dart';

class ToggleAsSeller extends HookWidget {
  final bool isProfileView;
  final UserModel? userModel;
  const ToggleAsSeller({required this.isProfileView,required this.userModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if(isProfileView){
      return Container(
        width: size.width,
        height: 60,
        decoration: BoxDecoration(
            color: const Color(0xffC7C7C7),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xffC7C7C7).withOpacity(0.3),
                  blurRadius: 6.0,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 22,
                ),
                Icon(
                  Icons.card_travel,
                  color: const Color(0xff29283C),
                  size: 24,
                ),
                SizedBox(
                  width: 19,
                ),
                Text(
                  "Seller mode",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff555555),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                )
              ],
            ),
            Switch(
              value: userModel!.isSeller,
              onChanged: (value) async{

              },
              activeTrackColor: Colors.white,
              activeColor: const Color(0xff5A5AFC),
            ),
          ],
        ),
      );
    }else{
      return Container(
        width: size.width,
        height: 60,
        decoration: BoxDecoration(
            color: const Color(0xffC7C7C7),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xffC7C7C7).withOpacity(0.3),
                  blurRadius: 6.0,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 22,
                ),
                Icon(
                  Icons.card_travel,
                  color: const Color(0xff29283C),
                  size: 24,
                ),
                SizedBox(
                  width: 19,
                ),
                Text(
                  "Seller mode",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff555555),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                )
              ],
            ),
            Switch(
              value: true,
              onChanged: (value) async{

              },
              activeTrackColor: Colors.white,
              activeColor: const Color(0xff5A5AFC),
            ),
          ],
        ),
      );
    }
  }
}
