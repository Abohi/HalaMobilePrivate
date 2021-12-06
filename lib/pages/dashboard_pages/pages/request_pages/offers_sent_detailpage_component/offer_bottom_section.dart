import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/widget/message_btn.dart';
import 'package:halawork/pages/dashboard_pages/widget/offer_btn.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/providers/state_providers/buyerSellerIdsStateProvider.dart';
import 'package:halawork/providers/state_providers/tabIndexSwitcherProvider.dart';
import 'package:halawork/utils/random_number_generator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:halawork/datetime_extension/time_of_day.dart';
class OfferBottomSection extends HookWidget {
  final OfferModel offerModel;
  final UserModel userModel;
  final Function onOfferButtonPressed;
  const OfferBottomSection({required this.offerModel,required this.userModel,required this.onOfferButtonPressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var buyerSellerIdState = useProvider(buyerSellerIdsStateProvider);
    var tabIndexSwitcherState = useProvider(tabIndexSwitcherProvider);
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "N${offerModel.amount}",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff29283C),
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Amount",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff29283C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offerModel.selectedDurationInWords,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff29283C),
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Duration",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff29283C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 41,),
          MessageBtn(onButtonPressed: (){
            tabIndexSwitcherState.state = 1;
            buyerSellerIdState.state=[context.read(authControllerProvider)!.uid,offerModel.sellerId!];
            context.router.navigate(InboxDetailRoute());
          },),
          SizedBox(height: 17,),
          OfferBtn(onButtonPressed: ()async{
            onOfferButtonPressed();
            // await DashBoardService().sendOrders(authProvider.user.uid, widget.offerResponseModel.requestId,orderModel);
          },)
        ],
      ),
    );
  }
}
