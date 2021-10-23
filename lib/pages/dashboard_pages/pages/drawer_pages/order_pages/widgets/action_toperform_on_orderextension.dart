import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/pages/dashboard_pages/pages/dialogs/extend_ordertime_dialog.dart';
import 'package:halawork/pages/dashboard_pages/widget/message_btn.dart';
import 'package:halawork/pages/dashboard_pages/widget/offer_btn.dart';
import 'package:halawork/providers/state_providers/buyerSellerIdsStateProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class ActionToPerformOnExtendOrder extends HookWidget {
  final String buyerId, sellerId;
  final Function(DateTime,bool) extendTimeOfDelivery;

  const ActionToPerformOnExtendOrder(
      {required this.sellerId,
      required this.buyerId,
      required this.extendTimeOfDelivery});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModel = useProvider(userControllerProvider);
    var buyerSellerIdState = useProvider(buyerSellerIdsStateProvider);
    return Container(
      width: size.width,
      height: size.height * 0.05,
      color: const Color(0xff0000FF),
      margin: EdgeInsets.only(bottom: 20),
      child: userModel!.userModel.isSeller
          ? MessageBtn(
              onButtonPressed: () {
                context.router.navigate(InboxDetailRoute());
                buyerSellerIdState.state = [buyerId, sellerId];
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Require Extension of completion time,Extend?",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OfferBtn(
                        onButtonPressed: () async {
                          await showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: MaterialLocalizations.of(context)
                                  .modalBarrierDismissLabel,
                              barrierColor: Colors.black.withOpacity(0.34),
                              transitionDuration:
                                  const Duration(milliseconds: 250),
                              pageBuilder: (BuildContext buildContext,
                                  Animation animation,
                                  Animation secondaryAnimation) {
                                return ExtendOrderTimeDialog(
                                  addExtensionDate: (deliveryDate) {
                                    extendTimeOfDelivery(deliveryDate,true);
                                  },
                                );
                              });
                        },
                        label: "Accept",
                      ),
                    ),
                    Expanded(
                      child: MessageBtn(
                        onButtonPressed: () {
                          extendTimeOfDelivery(DateTime.now(),false);
                        },
                        label: "Decline",
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }
}
