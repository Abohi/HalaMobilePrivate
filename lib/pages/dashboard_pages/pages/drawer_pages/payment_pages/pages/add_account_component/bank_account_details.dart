import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';




class BankAccountDetails extends HookWidget {
  final String? accountName,accountNumber,bankName;
  const BankAccountDetails({required this.accountNumber,required this.accountName,this.bankName});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: const Color(0xffE6E6E6),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: EdgeInsets.only(left: 22,top: 10,bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Name",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
                Text(
                  accountName?? "",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bank Name",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
                Text(
                  bankName?? "",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Number",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
                Text(
                  accountNumber ?? "",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
