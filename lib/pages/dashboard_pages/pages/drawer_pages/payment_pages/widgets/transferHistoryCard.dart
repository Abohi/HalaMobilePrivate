import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/transfer_model/transfer_response_data_model.dart';
import 'package:halawork/utils/currencyFormatter.dart';
import 'package:halawork/utils/locale_currency_utils.dart';
import 'package:intl/intl.dart';
class TransferHistoryCard extends StatelessWidget {
  final TransferResponseDataModel transferResponseDataModel;
  const TransferHistoryCard({required this.transferResponseDataModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: const Color(0xffE6E6E6),width: 1))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat.yMMMMd().format(DateTime.parse(transferResponseDataModel.createdAt)),style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: const Color(0xff29283C),
              fontSize: 12,
              fontWeight: FontWeight.normal
            )
          ),),
          const SizedBox(height: 6,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Receipt #: ${transferResponseDataModel.reference}",style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: const Color(0xff0000FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  )
              ),),

              Text("${LocaleCurrencyUtils.getCurrencySymbol(context)}${currencyFormater(transferResponseDataModel.amount.toDouble()/10)}",style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: const Color(0xff555555),
                      fontSize: 14,
                      fontWeight: FontWeight.normal
                  )
              ),)
          ],)
        ],
      ),
    );
  }
}
