import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/utils/locale_currency_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
class OrderCard extends StatelessWidget {
  final OrderModel orderModel;
  final Function onButtonPressed;
  const OrderCard({required this.orderModel,required this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<CreateRequestModel?>(future: context.read(userRepositoryProvider).getRequest(orderModel.requestId),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return GestureDetector(
              onTap: (){
                onButtonPressed();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                width: size.width,
                height: 98.31,
                decoration: BoxDecoration(color: Colors.white,border: Border(bottom: BorderSide(color: const Color(0xffE6E6E6).withOpacity(0.4)))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(snapshot.data?.title??"",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: const Color(0xff555555))),),
                        SizedBox(height: 10,),
                        Text("Created: ${DateFormat.yMMMMd().format(DateFormat("yyyy-MM-dd").parse(snapshot.data!.date))}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12,color: const Color(0xff29283C))),),
                        SizedBox(height: 19,),
                        Text("Budget: ${LocaleCurrencyUtils.getCurrencySymbol(context)}${snapshot.data?.budget}",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 12)),),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_right,size: 18,color: const Color(0xff0000FF),)
                  ],
                ),
              ),
            );
          }else{
            return Text("");
          }
        });
  }
}