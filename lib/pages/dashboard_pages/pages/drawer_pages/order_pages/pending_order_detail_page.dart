import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/orderpayment/order_payment.dart';
import 'package:halawork/models/paystack_verify_model/verify_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/order_countdown_timer.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/payment_expires_dialog.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:halawork/repositories/order_repository.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
class PendingOrderDetailPage extends HookWidget {
  final OrderModel orderModel;

  const PendingOrderDetailPage({required this.orderModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pending Orders",
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
        body: Container(
            width: size.width,
            height: size.height,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: StreamBuilder<CreateRequestModel?>(
                stream: context
                    .read(userRepositoryProvider)
                    .getRequestStream(orderModel.requestId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        orderModel.orderPaymentExpired!
                            ? const SizedBox(
                                height: 25,
                              )
                            : Text(""),
                        orderModel.orderPaymentExpired!
                            ? PaymentExpirationDialog(
                                onMessageSeller: () {
                                  //Order Message
                                },
                                onDonotMessageSeller: () async {
                                  context
                                      .read(orderRepositoryProvider)
                                      .deleteOfferAndOrder(
                                          orderModel.sellerId,
                                          orderModel.requestId,
                                          orderModel.buyerId);
                                  await Fluttertoast.showToast(
                                      msg: "Order deleted Successfully",
                                      toastLength: Toast.LENGTH_LONG);
                                },
                              )
                            : Text(""),
                        Container(
                          width: size.width,
                          height: size.height * 0.25,
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              color: const Color(0xffF8F8F8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!.title,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xff555555),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.budget,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xff555555),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Budget",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.state,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xff555555),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "State",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.date,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xff555555),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "date",
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
                              SizedBox(
                                height: 21,
                              ),
                              Consumer(
                                builder: (BuildContext context,
                                    T Function<T>(ProviderBase<Object?, T>)
                                        watch,
                                    Widget? child) {
                                  var firstHalfState =
                                      watch(firstHalfStateProvider).state;
                                  var secondHalfState =
                                      watch(secondHalfStateProvider).state;
                                  if (snapshot.data!.description.length > 200) {
                                    firstHalfState = snapshot.data!.description
                                        .substring(0, 200);
                                    secondHalfState = snapshot.data!.description
                                        .substring(200,
                                            snapshot.data!.description.length);
                                  } else {
                                    firstHalfState = snapshot.data!.description;
                                    secondHalfState = "";
                                  }
                                  return ExpandableTextView(
                                      textColor: const Color(0xff7C7C7C),
                                      textSize: 14);
                                },
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Expected time of Payment",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff29283C))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CountDownTimerPayment(
                              endTime: orderModel.orderPaymentTime!
                                  .difference(DateTime.now())
                                  .inSeconds,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            userModelState!.userModel.isSeller
                                ? SizedBox.shrink()
                                : CustomButtonSignup(
                                    buttonBg: const Color(0xff0000FF),
                                    buttonTitle: "PAY FOR ORDER",
                                    buttonFontColor: Colors.white,
                                    onButtonPressed: () async{
                                      OfferModel? offerModel =  await context.read(userRepositoryProvider).getOffer(orderModel.buyerId, orderModel.sellerId, orderModel.requestId);
                                      if(userModelState.userModel.wallet!=null){
                                        num balance = userModelState.userModel.wallet!.creditBalance-userModelState.userModel.wallet!.debitBalance;
                                        if(balance.toDouble()>orderModel.amount.toDouble()){
                                          final paymentProgress = ProgressHUD.of(context);
                                          paymentProgress!.showWithText('Creating Order For Request...');
                                          String reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                                          DateTime paidAt = DateTime.now();
                                          await context.read(userRepositoryProvider).addUserMap({
                                            "wallet":{
                                              "debitBalance":FieldValue.increment(orderModel.amount.toInt())
                                            }
                                          });

                                          //Removing Request from sellers to stop bidding
                                          CreateRequestModel? createRequestModel = await context.read(userRepositoryProvider).getRequest(orderModel.requestId);
                                          await context.read(userRepositoryProvider).updateRequestStatus(createRequestModel!, orderModel.requestId);

                                          OrderPaymentModel orderPaymentModel = OrderPaymentModel(requestId: orderModel.requestId, sellerId:orderModel.sellerId, orderId: orderModel.orderId, buyerId: context.read(authControllerProvider)!.uid, dateOfPayment: paidAt, amountPaid:orderModel.amount.toString(), paymentReference: reference);
                                          await context.read(userRepositoryProvider).addOrderPayment(orderPaymentModel, orderModel.requestId);
                                          await context.read(userControllerProvider.notifier).sendOrderModel({
                                            "orderStatus":"ongoing",
                                            "orderState":"activated",
                                            "buyerId":context.read(authControllerProvider)!.uid,
                                            "requestId":orderModel.requestId,
                                            "orderId":orderModel.orderId,
                                            "sellerId":orderModel.sellerId,
                                            "isDispute":false,
                                            "isSubmitted":false,
                                            "requireExtension":false,
                                            "isPaid":true,
                                            "orderDeliveryTime":offerModel!.dateOfDelivery,
                                            "amount":orderModel.amount.toInt(),
                                            "orderDeliveryTimeExpires":false,
                                            "orderPaymentExpired":false,
                                            "actionType":"None"
                                          });
                                          paymentProgress.dismiss();
                                          await Fluttertoast.showToast(msg: "Order created successfully");
                                        }else{
                                          //Removing Request from sellers to stop bidding
                                          CreateRequestModel? createRequestModel = await context.read(userRepositoryProvider).getRequest(orderModel.requestId);
                                          await context.read(userRepositoryProvider).updateRequestStatus(createRequestModel!, orderModel.requestId);

                                          final verifyingPaymentProgress = ProgressHUD.of(context);
                                          final charge = Charge()
                                            ..email = context.read(authControllerProvider)!.email
                                            ..amount = orderModel.amount.toInt()*100
                                            ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                                          final res =
                                          await PaystackClient.checkout(context, charge: charge);
                                          if (res.status) {
                                            verifyingPaymentProgress!.showWithText('Verifying Payment...');
                                            Either<NetworkFailure,VerifyModel> verifyResponse = await context.read(userRepositoryProvider).verifyTransactionReference(res.reference!);
                                            verifyResponse.fold((l){
                                              verifyingPaymentProgress.dismiss();
                                              return ErrorWidgetControl(networkFailure: l, retryHandler: ()async{
                                                final verifyingPaymentProgress = ProgressHUD.of(context);
                                                verifyingPaymentProgress!.showWithText('Retrying Payment Verification');
                                                await context.read(userRepositoryProvider).verifyTransactionReference(res.reference!);
                                                verifyingPaymentProgress.dismiss();
                                              });
                                            }, (r)async{
                                              if(r.data.status=="success"){
                                                OrderPaymentModel orderPaymentModel = OrderPaymentModel(requestId: orderModel.requestId, sellerId:orderModel.sellerId, orderId: orderModel.orderId, buyerId: context.read(authControllerProvider)!.uid, dateOfPayment:  DateFormat("yyyy-MM-dd").parse(r.data.paid_at), amountPaid: orderModel.amount.toString(), paymentReference: r.data.reference);
                                                await context.read(userRepositoryProvider).addOrderPayment(orderPaymentModel, orderModel.requestId);
                                                verifyingPaymentProgress.dismiss();
                                                await Fluttertoast.showToast(msg: "Payment Verified Successfully");
                                                final progress = ProgressHUD.of(context);
                                                progress!.showWithText('Creating Order For Request...');
                                                await context.read(userControllerProvider.notifier).sendOrderModel({
                                                  "orderStatus":"ongoing",
                                                  "orderState":"activated",
                                                  "buyerId":context.read(authControllerProvider)!.uid,
                                                  "requestId":orderModel.requestId,
                                                  "orderId":orderModel.orderId,
                                                  "sellerId":orderModel.sellerId,
                                                  "isDispute":false,
                                                  "isSubmitted":false,
                                                  "requireExtension":false,
                                                  "isPaid":true,
                                                  "orderDeliveryTime":offerModel!.dateOfDelivery,
                                                  "amount":orderModel.amount.toInt(),
                                                  "orderDeliveryTimeExpires":false,
                                                  "orderPaymentExpired":false,
                                                  "actionType":"None"
                                                });
                                                progress.dismiss();
                                                await Fluttertoast.showToast(msg: "Order created successfully");
                                              }else{
                                                verifyingPaymentProgress.dismiss();
                                                await Fluttertoast.showToast(msg: "Verification was not successfull");
                                              }
                                            });
                                            // _message = 'Charge was successful. Ref: ${res.reference}';
                                          } else {
                                            await Fluttertoast.showToast(msg: res.message);
                                          }
                                        }
                                      }else{
                                        //Removing Request from sellers to stop bidding
                                        CreateRequestModel? createRequestModel = await context.read(userRepositoryProvider).getRequest(orderModel.requestId);
                                        await context.read(userRepositoryProvider).updateRequestStatus(createRequestModel!, orderModel.requestId);

                                        final verifyingPaymentProgress = ProgressHUD.of(context);
                                        final charge = Charge()
                                          ..email = context.read(authControllerProvider)!.email
                                          ..amount = orderModel.amount.toInt()*100
                                          ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                                        final res =
                                        await PaystackClient.checkout(context, charge: charge);
                                        if (res.status) {
                                          verifyingPaymentProgress!.showWithText('Verifying Payment...');
                                          Either<NetworkFailure,VerifyModel> verifyResponse = await context.read(userRepositoryProvider).verifyTransactionReference(res.reference!);
                                          verifyResponse.fold((l){
                                            verifyingPaymentProgress.dismiss();
                                            return ErrorWidgetControl(networkFailure: l, retryHandler: ()async{
                                              final verifyingPaymentProgress = ProgressHUD.of(context);
                                              verifyingPaymentProgress!.showWithText('Retrying Payment Verification');
                                              await context.read(userRepositoryProvider).verifyTransactionReference(res.reference!);
                                              verifyingPaymentProgress.dismiss();
                                            });
                                          }, (r)async{
                                            if(r.data.status=="success"){
                                              OrderPaymentModel orderPaymentModel = OrderPaymentModel(requestId: orderModel.requestId, sellerId:orderModel.sellerId, orderId: orderModel.orderId, buyerId: context.read(authControllerProvider)!.uid, dateOfPayment:  DateFormat("yyyy-MM-dd").parse(r.data.paid_at), amountPaid: orderModel.amount.toString(), paymentReference: r.data.reference);
                                              await context.read(userRepositoryProvider).addOrderPayment(orderPaymentModel, orderModel.requestId);
                                              verifyingPaymentProgress.dismiss();
                                              await Fluttertoast.showToast(msg: "Payment Verified Successfully");
                                              final progress = ProgressHUD.of(context);
                                              progress!.showWithText('Creating Order For Request...');
                                              OfferModel? offerModel =  await context.read(userRepositoryProvider).getOffer(orderModel.buyerId, orderModel.sellerId, orderModel.requestId);
                                              await context.read(userControllerProvider.notifier).sendOrderModel({
                                                "orderStatus":"ongoing",
                                                "orderState":"activated",
                                                "buyerId":context.read(authControllerProvider)!.uid,
                                                "requestId":orderModel.requestId,
                                                "orderId":orderModel.orderId,
                                                "sellerId":orderModel.sellerId,
                                                "isDispute":false,
                                                "isSubmitted":false,
                                                "requireExtension":false,
                                                "isPaid":true,
                                                "orderDeliveryTime":offerModel!.dateOfDelivery,
                                                "amount":orderModel.amount.toInt(),
                                                "orderDeliveryTimeExpires":false,
                                                "orderPaymentExpired":false,
                                                "actionType":"None"
                                              });
                                              progress.dismiss();
                                              await Fluttertoast.showToast(msg: "Order created successfully");
                                            }else{
                                              verifyingPaymentProgress.dismiss();
                                              await Fluttertoast.showToast(msg: "Verification was not successfull");
                                            }
                                          });
                                          // _message = 'Charge was successful. Ref: ${res.reference}';
                                        } else {
                                          await Fluttertoast.showToast(msg: res.message);
                                        }
                                      }

                                    },
                                    imageIcon: null,
                                  )
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              const Color(0xff0000FF)),
                        )),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text("No Pending Orders")],
                    );
                  }
                },
              ),
            )));
  }
}
