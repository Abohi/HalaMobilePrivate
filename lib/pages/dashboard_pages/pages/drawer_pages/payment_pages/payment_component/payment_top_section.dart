import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentTopSection extends HookWidget {

  const PaymentTopSection();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // ProgressDialog  _progressDialog = ProgressDialog(context,
    //     type: ProgressDialogType.Normal,
    //     isDismissible: false,
    //     customBody: CustomProgressBody(
    //       progressLabel: "Charging Account...",
    //     ));
    return Container(
      width: size.width,
      height: 232,
      color: const Color(0xffF8F8F8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 21,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // changeScreen(context: context, widget: WithDrawFunds2());
                  },
                  child: Text(
                    "Personal Balance",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 14, color: const Color(0xffACACAC))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "0.00NGN",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0000FF))),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // PayBtnWithDrawFunds(
          //   onTap: () async {
          //
          //     // changeScreen(context: context, widget:
          //     // FutureProvider<BankModel>.value(value: PaymentService().getBankList(),
          //     //   child:AddAccount() ,));
          //   },
          // ),
          SizedBox(
            height: 27,
          ),
          // const FundsClearingStatus()
        ],
      ),
    );
  }
}