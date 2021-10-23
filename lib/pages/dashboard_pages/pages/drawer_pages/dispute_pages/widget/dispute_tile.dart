import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/dispute_model/dispute_model.dart';

class DisputeItem extends StatelessWidget {
  final Function onTap;
  final DisputeModel disputeModel;

  const DisputeItem({required this.onTap, required this.disputeModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: const Color(0xffACACAC), width: 1))),
        margin: EdgeInsets.only(bottom: 20.69),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  disputeModel.disputeId!,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff0000FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Status: ${disputeModel.disputeStatus}",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
                SizedBox(
                  height: 19.31,
                )
              ],
            ),
            Spacer(),
            Center(
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 24,
                color: const Color(0xff0000FF),
              ),
            ),
            SizedBox(
              width: 18.59,
            )
          ],
        ),
      ),
    );
  }
}