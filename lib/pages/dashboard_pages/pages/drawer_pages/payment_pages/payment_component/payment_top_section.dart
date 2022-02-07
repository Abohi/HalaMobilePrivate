import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/utils/getUserBalance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaymentTopSection extends HookWidget {

  const PaymentTopSection();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userModelExtensionController);
    // ProgressDialog  _progressDialog = ProgressDialog(context,
    //     type: ProgressDialogType.Normal,
    //     isDismissible: false,
    //     customBody: CustomProgressBody(
    //       progressLabel: "Charging Account...",
    //     ));
    return Container(
      width: size.width,
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
                  "${returnAccountBalance(userModelState!.userModel.wallet?.creditBalance??0.0, userModelState.userModel.wallet?.creditBalance??0.0)} NGN",
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