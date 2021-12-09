import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';




class BankAccountDetails extends HookWidget {
  final String? accountName,accountNumber;
  const BankAccountDetails({required this.accountNumber,required this.accountName});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xffE6E6E6),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: EdgeInsets.only(left: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              accountName ?? "",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: const Color(0xff29283C),
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ),
          ],
        ),
      ),
    );
  }
}
