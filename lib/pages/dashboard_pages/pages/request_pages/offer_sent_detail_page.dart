import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/orderpayment/order_payment.dart';
import 'package:halawork/models/paystack_verify_model/verify_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/offers_sent_detailpage_component/offer_bottom_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/offers_sent_detailpage_component/offer_top_section.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/widgets/payment_dialog.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/utils/random_number_generator.dart';
import 'package:halawork/widgets/error_widget.dart';
import 'offers_sent_detailpage_component/custom_divider.dart';
import 'package:halawork/utils/random_number_generator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:halawork/datetime_extension/time_of_day.dart';
import 'package:intl/intl.dart' show DateFormat;
class OfferSentDetailPage extends StatefulHookWidget {
  final UserModel userModel;
  final OfferModel offerModel;
  const OfferSentDetailPage({required this.offerModel,required this.userModel});
  @override
  _OfferSentDetailPageState createState() => _OfferSentDetailPageState();

}

class _OfferSentDetailPageState extends State<OfferSentDetailPage>{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userControllerProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 5,
          title: Text(
            widget.userModel.firstName!,
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
              context.popRoute();
            },
          ),
        ),
        body:ProgressHUD(
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
                    SizedBox(height: 19,),
                    OfferTopSection(userModel: widget.userModel, offerModel: widget.offerModel),
                    const CustomDivider(),
                    OfferBottomSection(offerModel: widget.offerModel, userModel: widget.userModel, onOfferButtonPressed: ()async{
                      String orderId =RandomDigits.getInteger(8).toString();
                      double? amount =  double.tryParse(widget.offerModel.amount.replaceAll(RegExp(r'[^0-9\.]'), ''));
                      bool? paymentPromptDialogResult= await showGeneralDialog<bool>(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return PayLaterDialog(
                                orderId: orderId);
                          });
                      TimeOfDay t= TimeOfDay.now();
                      final now = new DateTime.now();
                      // DateTime tenMinutesLater = DateTime(now.year, now.month, now.day, t.hour, t.minute);
                      DateTime twoDaysTime = DateTime(now.year, now.month, now.day, t.hour+48, t.minute);

                      if(paymentPromptDialogResult!){
                       UserModel usermodel =  context.read(userControllerProvider)!.userModel;
                       if(usermodel.wallet!=null){
                         num balance = usermodel.wallet!.creditBalance-usermodel.wallet!.debitBalance;
                         if(balance.toDouble()>amount!){
                           final paymentProgress = ProgressHUD.of(context);
                           paymentProgress!.showWithText('Creating Order For Request...');
                           String reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                           DateTime paidAt = DateTime.now();
                           await context.read(userRepositoryProvider).addUserMap({
                             "wallet":{
                               "debitBalance":FieldValue.increment(amount)
                             }
                           });

                           //Removing Request from sellers to stop bidding
                           CreateRequestModel? createRequestModel = await context.read(userRepositoryProvider).getRequest(widget.offerModel.requestId!);
                           await context.read(userRepositoryProvider).updateRequestStatus(createRequestModel!, widget.offerModel.requestId!);

                           OrderPaymentModel orderPaymentModel = OrderPaymentModel(requestId: widget.offerModel.requestId!, sellerId:widget.offerModel.sellerId!, orderId: orderId, buyerId: context.read(authControllerProvider)!.uid, dateOfPayment: paidAt, amountPaid:amount.toString(), paymentReference: reference);
                           await context.read(userRepositoryProvider).addOrderPayment(orderPaymentModel, widget.offerModel.requestId!);
                           await context.read(userControllerProvider.notifier).sendOrderModel({
                             "orderStatus":"ongoing",
                             "orderState":"activated",
                             "buyerId":context.read(authControllerProvider)!.uid,
                             "requestId":widget.offerModel.requestId!,
                             "orderId":orderId,
                             "sellerId":widget.offerModel.sellerId!,
                             "isDispute":false,
                             "isSubmitted":false,
                             "requireExtension":false,
                             "isPaid":true,
                             "orderDeliveryTime":widget.offerModel.dateOfDelivery,
                             "amount":amount,
                             "orderDeliveryTimeExpires":false,
                             "orderPaymentExpired":false,
                             "actionType":"None"
                           });
                           paymentProgress.dismiss();
                           await Fluttertoast.showToast(msg: "Order created successfully");
                         }else{

                           //Removing Request from sellers to stop bidding
                           CreateRequestModel? createRequestModel = await context.read(userRepositoryProvider).getRequest(widget.offerModel.requestId!);
                           await context.read(userRepositoryProvider).updateRequestStatus(createRequestModel!, widget.offerModel.requestId!);

                           final verifyingPaymentProgress = ProgressHUD.of(context);
                           final charge = Charge()
                             ..email = context.read(authControllerProvider)!.email
                             ..amount = amount.toInt()*100
                             ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                           final res =
                           await PaystackClient.checkout(context, charge: charge);
                           if (res.status) {
                             verifyingPaymentProgress!.showWithText('Verifying Payment...');
                             dartz.Either<NetworkFailure,VerifyModel> verifyResponse = await context.read(userRepositoryProvider).verifyTransactionReference(res.reference!);
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
                                 OrderPaymentModel orderPaymentModel = OrderPaymentModel(requestId: widget.offerModel.requestId!, sellerId:widget.offerModel.sellerId!, orderId: orderId, buyerId: context.read(authControllerProvider)!.uid, dateOfPayment:  DateFormat("yyyy-MM-dd").parse(r.data.paid_at), amountPaid: amount.toString(), paymentReference: r.data.reference);
                                 await context.read(userRepositoryProvider).addOrderPayment(orderPaymentModel, widget.offerModel.requestId!);
                                 verifyingPaymentProgress.dismiss();
                                 await Fluttertoast.showToast(msg: "Payment Verified Successfully");
                                 final progress = ProgressHUD.of(context);
                                 progress!.showWithText('Creating Order For Request...');
                                 await context.read(userControllerProvider.notifier).sendOrderModel({
                                   "orderStatus":"ongoing",
                                   "orderState":"activated",
                                   "buyerId":context.read(authControllerProvider)!.uid,
                                   "requestId":widget.offerModel.requestId!,
                                   "orderId":orderId,
                                   "sellerId":widget.offerModel.sellerId!,
                                   "isDispute":false,
                                   "isSubmitted":false,
                                   "requireExtension":false,
                                   "isPaid":true,
                                   "orderDeliveryTime":widget.offerModel.dateOfDelivery,
                                   "amount":amount,
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
                         CreateRequestModel? createRequestModel = await context.read(userRepositoryProvider).getRequest(widget.offerModel.requestId!);
                         await context.read(userRepositoryProvider).updateRequestStatus(createRequestModel!, widget.offerModel.requestId!);

                         final verifyingPaymentProgress = ProgressHUD.of(context);
                         final charge = Charge()
                           ..email = context.read(authControllerProvider)!.email
                           ..amount = amount!.toInt()*100
                           ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                         final res =
                         await PaystackClient.checkout(context, charge: charge);
                         if (res.status) {
                           verifyingPaymentProgress!.showWithText('Verifying Payment...');
                           dartz.Either<NetworkFailure,VerifyModel> verifyResponse = await context.read(userRepositoryProvider).verifyTransactionReference(res.reference!);
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
                               OrderPaymentModel orderPaymentModel = OrderPaymentModel(requestId: widget.offerModel.requestId!, sellerId:widget.offerModel.sellerId!, orderId: orderId, buyerId: context.read(authControllerProvider)!.uid, dateOfPayment: DateFormat("yyyy-MM-dd").parse(r.data.paid_at), amountPaid: r.data.amount.toString(), paymentReference: r.data.reference);
                               await context.read(userRepositoryProvider).addOrderPayment(orderPaymentModel, widget.offerModel.requestId!);
                               verifyingPaymentProgress.dismiss();
                               await Fluttertoast.showToast(msg: "Payment Verified Successfully");
                               final progress = ProgressHUD.of(context);
                               progress!.showWithText('Creating Order For Request...');
                               await context.read(userControllerProvider.notifier).sendOrderModel({
                                 "orderStatus":"ongoing",
                                 "orderState":"activated",
                                 "buyerId":context.read(authControllerProvider)!.uid,
                                 "requestId":widget.offerModel.requestId!,
                                 "orderId":orderId,
                                 "sellerId":widget.offerModel.sellerId!,
                                 "isDispute":false,
                                 "isSubmitted":false,
                                 "requireExtension":false,
                                 "isPaid":true,
                                 "orderDeliveryTime":widget.offerModel.dateOfDelivery,
                                 "amount":amount,
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
                        final progress = ProgressHUD.of(context);
                        progress!.showWithText('Creating Order For Request...');
                        await context.read(userControllerProvider.notifier).sendOrderModel({
                          "orderStatus":"pending",
                          "orderState":"activated",
                          "buyerId":context.read(authControllerProvider)!.uid,
                          "requestId":widget.offerModel.requestId!,
                          "orderId":orderId,
                          "sellerId":widget.offerModel.sellerId!,
                          "isDispute":false,
                          "isSubmitted":false,
                          "requireExtension":false,
                          "isPaid":false,
                          "orderPaymentTime":twoDaysTime,
                          "orderPaymentExpired":false,
                          "actionType":"None"
                        });
                        progress.dismiss();
                        await Fluttertoast.showToast(msg: "Order created successfully");
                      }

                    },),
                    const CustomDivider(),
                  ],
                ),
              );
            },
          ),
        ) ,
      ),
    );
  }

}
