import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/modification_model/modification_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/order_countdown_timer.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:halawork/pages/dashboard_pages/widget/message_btn.dart';
import 'package:halawork/pages/dashboard_pages/widget/offer_btn.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart' show DateFormat;
class ModificationDetailPage extends HookWidget{
  final ModificationModel modificationModel;
  const ModificationDetailPage({required this.modificationModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(
            "${modificationModel.requestTitle}",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: const Color(0xff3E3E3E),
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: const Color(0xff0000FF),
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
    backgroundColor: Colors.white,body:
    ProgressHUD(
      backgroundColor:const Color(0xff0000FF),
      indicatorColor: Colors.white,
      child: Builder(
        builder: (context){
          return Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: ListView(
              children: [
                SizedBox(height: 20,),
                Container(
                  width: size.width,
                  height: size.height * 0.25,
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(color: const Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        modificationModel.requestTitle,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff555555),
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                modificationModel.amountString==null?"0":modificationModel.amountString!,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xff555555),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                "Additional Tip",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xff7C7C7C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat("yyyy-MM-dd").format(modificationModel.createdDate),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xff555555),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                "Date Modification Was Created",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xff7C7C7C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 21,),
                      Consumer(builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
                        var firstHalfState = watch(firstHalfStateProvider).state;
                        var secondHalfState = watch(secondHalfStateProvider).state;
                        if(modificationModel.reason.length>200){
                          firstHalfState = modificationModel.reason.substring(0, 200);
                          secondHalfState = modificationModel.reason.substring(200, modificationModel.reason.length);
                        }else{
                          firstHalfState=modificationModel.reason;
                          secondHalfState = "";
                        }
                        return  ExpandableTextView(
                            textColor: const Color(0xff7C7C7C),
                            textSize: 14);
                      },),
                      SizedBox(height: 21,),
                      Text(
                        "Decision Time for seller",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff7C7C7C),
                                fontSize: 12,
                                fontWeight: FontWeight.normal)),
                      ),
                      SizedBox(height: 10,),
                      CountDownTimerPayment(endTime:  modificationModel.decisionTime.difference(DateTime.now()).inSeconds,),
                      SizedBox(height: 21,),
                      context.read(userControllerProvider)!.userModel.isSeller?Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: OfferBtn(
                              onButtonPressed: ()async{
                                final progress = ProgressHUD.of(context);
                                progress!.showWithText('Accepting Modification Offer');
                                await context.read(userControllerProvider.notifier).sendOrderModel({
                                  "orderDeliveryTimeExpires":false,
                                  "orderDeliveryTime":modificationModel.time,
                                });
                                progress.dismiss();
                                await Fluttertoast.showToast(msg: "Modification Offer Accepted Successfully",toastLength: Toast.LENGTH_LONG);
                              },
                              label: "Accept",
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: MessageBtn(
                              onButtonPressed: () {
                                // context.router.navigate()
                              },
                              label: "Decline",
                            ),
                          )
                        ],
                      ):Text("")
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
