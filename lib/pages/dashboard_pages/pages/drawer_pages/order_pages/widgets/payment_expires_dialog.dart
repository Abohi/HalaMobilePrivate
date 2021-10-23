import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentExpirationDialog extends StatelessWidget {
  final Function onMessageSeller, onDonotMessageSeller;

  const PaymentExpirationDialog(
      {required this.onMessageSeller, required this.onDonotMessageSeller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.08,
      color: const Color(0xffFF0000),
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onMessageSeller();
            },
            child: Expanded(
              child: Text.rich(
                TextSpan(
                  text: "Time period expired. ",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Message seller",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white))),
                    // can add more TextSpans here...
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  onDonotMessageSeller();
                }),
          )
        ],
      ),
    );
  }
}