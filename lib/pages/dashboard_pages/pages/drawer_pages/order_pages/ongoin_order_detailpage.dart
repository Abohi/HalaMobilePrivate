import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/firebase_reference_extension/firebase_firestore_extension.dart';
import 'package:halawork/models/modification_model/modification_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/models/rating_model/rating_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/action_toperform_on_orderextension.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/apply_rating_widget.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/order_countdown_timer.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/order_download_task.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/order_upload_task.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/perform_action_button.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:halawork/pages/dashboard_pages/widget/message_btn.dart';
import 'package:halawork/pages/dashboard_pages/widget/offer_btn.dart';
import 'package:halawork/providers/general_providers/general_providers.dart';
import 'package:halawork/repositories/order_repository.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;

final sellersComRatingProvider = StateProvider<double?>((ref) {
  return null;
});
final likelyRecomRatingProvider = StateProvider<double?>((ref) {
  return null;
});
final serviceWorkRatingProvider = StateProvider<double?>((ref) {
  return null;
});

class OngoingOrderDetailPage extends StatelessWidget {
  final String requestId;

  const OngoingOrderDetailPage({required this.requestId});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(
            "Ongoing Orders",
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
        body: ProgressHUD(
          backgroundColor: const Color(0xff0000FF),
          indicatorColor: Colors.white,
          child: Builder(
            builder: (context) {
              return StreamBuilder<OrderModel?>(
                stream: context.read(orderRepositoryProvider).getOrder(requestId),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data==null)
                      return SizedBox.shrink();
                    if(snapshot.data?.orderStatus=="ongoing"){
                      OrderModel orderModel = snapshot.data!;
                      return Container(
                        width: size.width,
                        height: size.height,
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: StreamBuilder<CreateRequestModel?>(
                                stream: context
                                    .read(userRepositoryProvider)
                                    .getRequestStream(orderModel.requestId),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        orderModel.requireExtension
                                            ? ActionToPerformOnExtendOrder(
                                          buyerId: orderModel.buyerId,
                                          sellerId: orderModel.sellerId,
                                          extendTimeOfDelivery:
                                              (dateOfDelivery, isAccepted) async {
                                            if (isAccepted) {
                                              final progress =
                                              ProgressHUD.of(context);
                                              progress!.showWithText(
                                                  'Extending Delivery Date');
                                              await context
                                                  .read(userModelExtensionController
                                                  .notifier)
                                                  .sendOrderModel({
                                                "requireExtension": false,
                                                "isExtended": true,
                                                "orderDeliveryTimeExpires": false,
                                                "orderDeliveryTime":
                                                dateOfDelivery
                                              });
                                              progress.dismiss();
                                              await Fluttertoast.showToast(
                                                  msg:
                                                  "Delivery date extended successfully",
                                                  toastLength: Toast.LENGTH_LONG);
                                            } else {
                                              final progress =
                                              ProgressHUD.of(context);
                                              progress!.showWithText(
                                                  'Declining Extension Offer');
                                              await context
                                                  .read(userModelExtensionController
                                                  .notifier)
                                                  .sendOrderModel({
                                                "requireExtension": false,
                                                "isExtended": false,
                                              });
                                              progress.dismiss();
                                              await Fluttertoast.showToast(
                                                  msg:
                                                  "SuccessFully Decline extension Offer",
                                                  toastLength: Toast.LENGTH_LONG);
                                            }
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        snapshot.data!.budget,
                                                        style: GoogleFonts.roboto(
                                                            textStyle: TextStyle(
                                                                color: const Color(
                                                                    0xff555555),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight.w700)),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "Budget",
                                                        style: GoogleFonts.roboto(
                                                            textStyle: TextStyle(
                                                                color: const Color(
                                                                    0xff7C7C7C),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.normal)),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        snapshot.data!.state,
                                                        style: GoogleFonts.roboto(
                                                            textStyle: TextStyle(
                                                                color: const Color(
                                                                    0xff555555),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight.w700)),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "State",
                                                        style: GoogleFonts.roboto(
                                                            textStyle: TextStyle(
                                                                color: const Color(
                                                                    0xff7C7C7C),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.normal)),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Created: ${DateFormat.yMMMMd().format(DateFormat("yyyy-MM-dd").parse(snapshot.data!.date))}",
                                                        style: GoogleFonts.roboto(
                                                            textStyle: TextStyle(
                                                                color: const Color(
                                                                    0xff555555),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight.w700)),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "date",
                                                        style: GoogleFonts.roboto(
                                                            textStyle: TextStyle(
                                                                color: const Color(
                                                                    0xff7C7C7C),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.normal)),
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
                                                    T Function<T>(
                                                        ProviderBase<Object?, T>)
                                                    watch,
                                                    Widget? child) {
                                                  var firstHalfState =
                                                      watch(firstHalfStateProvider)
                                                          .state;
                                                  var secondHalfState =
                                                      watch(secondHalfStateProvider)
                                                          .state;
                                                  if (snapshot
                                                      .data!.description.length >
                                                      200) {
                                                    firstHalfState = snapshot
                                                        .data!.description
                                                        .substring(0, 200);
                                                    secondHalfState = snapshot
                                                        .data!.description
                                                        .substring(
                                                        200,
                                                        snapshot.data!.description
                                                            .length);
                                                  } else {
                                                    firstHalfState =
                                                        snapshot.data!.description;
                                                    secondHalfState = "";
                                                  }
                                                  return ExpandableTextView(
                                                      textColor:
                                                      const Color(0xff7C7C7C),
                                                      textSize: 14);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        context
                                            .read(userModelExtensionController)!
                                            .userModel
                                            .isSeller
                                            ? CountDownTimerPayment(
                                          endTime:
                                          orderModel.orderDeliveryTime == null
                                              ? 0
                                              : orderModel.orderDeliveryTime!
                                              .millisecondsSinceEpoch,
                                        )
                                            : Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            ((orderModel.orderDeliveryTime ==
                                                null) &&
                                                (orderModel.releaseFundTime !=
                                                    null))
                                                ? Text(
                                                "Time before fund is released to seller")
                                                : SizedBox.shrink(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ((orderModel.orderDeliveryTime ==
                                                null) &&
                                                (orderModel.releaseFundTime !=
                                                    null))
                                                ? CountDownTimerPayment(
                                              endTime: orderModel
                                                  .releaseFundTime!
                                                  .millisecondsSinceEpoch,
                                            )
                                                : CountDownTimerPayment(
                                              endTime: orderModel
                                                  .orderDeliveryTime ==
                                                  null
                                                  ? 0
                                                  : orderModel
                                                  .orderDeliveryTime!
                                                  .millisecondsSinceEpoch,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "ID: ${orderModel.orderId}",
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: const Color(0xff0000FF),
                                                      fontWeight: FontWeight.w700)),
                                            ),
                                            Container(
                                              width: size.width * 0.3,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffE3A806),
                                                  borderRadius:
                                                  BorderRadius.circular(10)),
                                              child: Center(
                                                child: Text(
                                                  setStatusType(orderModel.actionType,orderModel.orderStatus),
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                          const Color(0xff0000FF),
                                                          fontWeight:
                                                          FontWeight.normal)),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  }
                                  return Text("");
                                },
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: const SizedBox(
                                height: 20,
                              ),
                            ),
                            Upload_Download_ModificationSection(
                                orderModel: orderModel,
                                userModel:
                                context.read(userModelExtensionController)!.userModel,
                                uploadTask: (String path, FileType fileType,
                                    String uploadNote) async {
                                  final progress = ProgressHUD.of(context);
                                  progress!.showWithText('Uploading Order Files...');
                                  await context
                                      .read(orderRepositoryProvider)
                                      .submitOrderToFirebase(orderModel.requestId, path,
                                      fileType, uploadNote);
                                  progress.dismiss();
                                  await Fluttertoast.showToast(
                                      msg: "Uploaded Successfully",
                                      toastLength: Toast.LENGTH_LONG);
                                },
                                performAction: (actionType) async {
                                  if (actionType == "completed") {
                                    final progress = ProgressHUD.of(context);
                                    progress!
                                        .showWithText('Marking Order As Completed...');
                                    await context
                                        .read(firebaseFirestoreProvider)
                                        .orderDocumentMapRef(orderModel.requestId)
                                        .set({
                                      "actionType": "completed",
                                      "orderStatus": "completed",
                                      "orderDeliveryTime": null,
                                      "isReviewed":false,
                                      "orderDeliveryTimeExpires": false,
                                    }, SetOptions(merge: true));
                                    progress.dismiss();
                                    await Fluttertoast.showToast(
                                        msg: "Successfully marked order as completed",
                                        toastLength: Toast.LENGTH_LONG);
                                  } else if (actionType == "modification") {
                                    context.router.navigate(
                                        ModificationBuyerRoute(orderModel: orderModel));
                                  } else if (actionType == "dispute") {
                                    //Send to dispute page
                                  }
                                }),
                            orderModel.actionType == "completed"
                                ? SliverToBoxAdapter(child: ReviewSellersWork(orderModel: orderModel, onButtonPressed: (RatingModel ratingModel) async{
                              final progress = ProgressHUD.of(context);
                              progress!.showWithText('Submitting Review...');
                              await context.read(userRepositoryProvider).submitBuyersRating(requestId: orderModel.requestId, sellerId: orderModel.sellerId, ratingModel:ratingModel, orderModel: orderModel);
                              progress.dismiss();
                              await Fluttertoast.showToast(msg: "Review submitted successfully",toastLength: Toast.LENGTH_SHORT);
                            },))
                                : SliverToBoxAdapter(child: SizedBox.shrink())
                          ],
                        ),
                      );
                    }else{
                      return SizedBox.shrink();
                    }
                  }else{
                    return SizedBox.shrink();
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
  String setStatusType(String? actionType,String status){
    if(actionType!=null){
      if(actionType=="modification"){
        return "modification";
      }else{
        return status;
      }
    }else{
      return status;
    }
  }
}

class Upload_Download_ModificationSection extends StatefulHookWidget {
  final UserModel userModel;
  final OrderModel orderModel;
  final Function(String path, FileType fileType, String uploadNote) uploadTask;
  final Function(String) performAction;

  const Upload_Download_ModificationSection(
      {required this.orderModel,
      required this.userModel,
      required this.uploadTask,
      required this.performAction});

  @override
  _UploadOrDownloadSectionState createState() =>
      _UploadOrDownloadSectionState();
}

class _UploadOrDownloadSectionState extends State<Upload_Download_ModificationSection> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _uploadNoteController = useTextEditingController();
    var _pickType = useState<FileType?>(null);
    var _path = useState<String?>(null);
    if(widget.orderModel.actionType==null){
      if (context.read(userModelExtensionController)!.userModel.isSeller) {
        if (widget.orderModel.isSubmitted) {
          return SliverToBoxAdapter(
              child: OrderDownloadTask(
                orderModel: widget.orderModel,
                isSeller: true,
              ));
        } else {
          return SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.1,
                      child: TextField(
                        autofocus: false,
                        maxLines: 300,
                        controller: _uploadNoteController,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.top,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff29283C), fontSize: 16)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Upload Note",
                          labelStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: const Color(0xff29283C), fontSize: 14)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: const Color(0xff0000FF), width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: const Color(0xffACACAC), width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  dropDown(context, _pickType),
                  _path.value == null
                      ? Container(
                    height: size.height * 0.35,
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.15),
                    // constraints: BoxConstraints(minHeight:size.height*0.15,maxHeight: size.height*0.35,maxWidth: size.width, ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffC7C7C7)),
                        borderRadius: BorderRadius.circular(17)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffC7C7C7))),
                      child: GestureDetector(
                        onTap: () => openFileExplorer(_pickType, _path),
                        child: Icon(
                          Icons.attach_file,
                          size: 23.52,
                        ),
                      ),
                    ),
                  )
                      : UploadTaskCardSeller(filePath: _path, fileType: _pickType),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtonSignup(
                    buttonBg: const Color(0xff0000FF),
                    buttonTitle: "UPLOAD WORK",
                    buttonFontColor: Colors.white,
                    isFullWidth: true,
                    onButtonPressed: () async {
                      if (_uploadNoteController.text.isEmpty)
                        return Fluttertoast.showToast(
                            msg: "Upload Note Cannot Be Empty",
                            toastLength: Toast.LENGTH_LONG);
                      widget.uploadTask(_path.value!, _pickType.value!,
                          _uploadNoteController.text.toString());
                    },
                    imageIcon: null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ));
        }
      } else {
        return widget.orderModel.fileTypeModel == null
            ? SliverToBoxAdapter(child: Text(""))
            : SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: 1,
                color: const Color(0xffE6E6E6),
                padding: EdgeInsets.symmetric(vertical: 29.31),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Review work",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: const Color(0xffACACAC),
                            fontWeight: FontWeight.w700)),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: const Color(0xffACACAC),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: size.width,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                      color: const Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(widget.orderModel.orderNote ?? "",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 14,
                              color: const Color(0xff7C7C7C),
                              fontWeight: FontWeight.w500)))),
              const SizedBox(
                height: 10,
              ),
              OrderDownloadTask(
                orderModel: widget.orderModel,
                isSeller: false,
              ),
              const SizedBox(
                height: 38,
              ),
              PerformOrderActionBtn(
                buttonLabel: "COMPLETED",
                onButtonPressed: () async {
                  widget.performAction("completed");
                },
              ),
              const SizedBox(
                height: 15,
              ),
              PerformOrderActionBtn(
                buttonLabel: "MODIFICATION",
                onButtonPressed: () async {
                  widget.performAction("modification");
                },
              ),
              const SizedBox(
                height: 15,
              ),
              PerformOrderActionBtn(
                buttonLabel: "RAISE DISPUTE",
                onButtonPressed: () {
                  widget.performAction("dispute");
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      }
    }else{
      if(widget.orderModel.actionType=="modification"){
        return StreamBuilder<ModificationModel>(
          stream: context.read(orderRepositoryProvider).getModification(widget.orderModel.requestId),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return  SliverToBoxAdapter(
                child: Container(
                  width: size.width,
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(color: const Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data!.requestTitle,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff555555),
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(height: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.yMMMMd().format(snapshot.data!.createdDate!),
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
                      SizedBox(height: 21,),
                      Consumer(builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
                        var firstHalfState = watch(firstHalfStateProvider).state;
                        var secondHalfState = watch(secondHalfStateProvider).state;
                        if(snapshot.data!.reason.length>200){
                          firstHalfState = snapshot.data!.reason.substring(0, 200);
                          secondHalfState = snapshot.data!.reason.substring(200, snapshot.data!.reason.length);
                        }else{
                          firstHalfState=snapshot.data!.reason;
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
                      CountDownTimerPayment(endTime:  snapshot.data!.decisionTime!.millisecondsSinceEpoch,),
                      SizedBox(height: 21,),
                      context.read(userModelExtensionController)!.userModel.isSeller?Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: OfferBtn(
                              onButtonPressed: ()async{
                                final progress = ProgressHUD.of(context);
                                progress!.showWithText('Accepting Modification Offer');
                                await context.read(userModelExtensionController.notifier).sendOrderModel({
                                  "orderDeliveryTimeExpires":false,
                                  "orderDeliveryTime":snapshot.data!.time,
                                  "actionType":"None",
                                  "orderState":"activated",
                                  "orderStatus":"ongoing",
                                  "requestId":widget.orderModel.requestId,
                                  "isSubmitted":false,
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
              );
            }
            else if(snapshot.connectionState==ConnectionState.waiting){
              return SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
                  ],
                ),
              );
            }
            else{
              return SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("No Modification Available")
                  ],
                ),
              );
            }
          },
        );
      }else{
        if (context.read(userModelExtensionController)!.userModel.isSeller) {
          if (widget.orderModel.isSubmitted) {
            return SliverToBoxAdapter(
                child: OrderDownloadTask(
                  orderModel: widget.orderModel,
                  isSeller: true,
                ));
          } else {
            return SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.1,
                        child: TextField(
                          autofocus: false,
                          maxLines: 300,
                          controller: _uploadNoteController,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: const Color(0xff29283C), fontSize: 16)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Upload Note",
                            labelStyle: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: const Color(0xff29283C), fontSize: 14)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: const Color(0xff0000FF), width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: const Color(0xffACACAC), width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    dropDown(context, _pickType),
                    _path.value == null
                        ? Container(
                      height: size.height * 0.35,
                      width: size.width,
                      padding: EdgeInsets.all(size.width * 0.15),
                      // constraints: BoxConstraints(minHeight:size.height*0.15,maxHeight: size.height*0.35,maxWidth: size.width, ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffC7C7C7)),
                          borderRadius: BorderRadius.circular(17)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xffC7C7C7))),
                        child: GestureDetector(
                          onTap: () => openFileExplorer(_pickType, _path),
                          child: Icon(
                            Icons.attach_file,
                            size: 23.52,
                          ),
                        ),
                      ),
                    )
                        : UploadTaskCardSeller(filePath: _path, fileType: _pickType),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButtonSignup(
                      buttonBg: const Color(0xff0000FF),
                      buttonTitle: "UPLOAD WORK",
                      buttonFontColor: Colors.white,
                      isFullWidth: true,
                      onButtonPressed: () async {
                        if (_uploadNoteController.text.isEmpty)
                          return Fluttertoast.showToast(
                              msg: "Upload Note Cannot Be Empty",
                              toastLength: Toast.LENGTH_LONG);
                        widget.uploadTask(_path.value!, _pickType.value!,
                            _uploadNoteController.text.toString());
                      },
                      imageIcon: null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ));
          }
        } else {
          return widget.orderModel.fileTypeModel == null
              ? SliverToBoxAdapter(child: Text(""))
              : SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: 1,
                  color: const Color(0xffE6E6E6),
                  padding: EdgeInsets.symmetric(vertical: 29.31),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Review work",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: const Color(0xffACACAC),
                              fontWeight: FontWeight.w700)),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: const Color(0xffACACAC),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: size.width,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                        color: const Color(0xffF8F8F8),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(widget.orderModel.orderNote ?? "",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 14,
                                color: const Color(0xff7C7C7C),
                                fontWeight: FontWeight.w500)))),
                const SizedBox(
                  height: 10,
                ),
                OrderDownloadTask(
                  orderModel: widget.orderModel,
                  isSeller: false,
                ),
                const SizedBox(
                  height: 38,
                ),
                PerformOrderActionBtn(
                  buttonLabel: "COMPLETED",
                  onButtonPressed: () async {
                    widget.performAction("completed");
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                PerformOrderActionBtn(
                  buttonLabel: "MODIFICATION",
                  onButtonPressed: () async {
                    widget.performAction("modification");
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                PerformOrderActionBtn(
                  buttonLabel: "RAISE DISPUTE",
                  onButtonPressed: () {
                    widget.performAction("dispute");
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        }
      }
    }

  }

  void openFileExplorer(ValueNotifier _pickType, ValueNotifier _path) async {
    if (_pickType.value == null) {
      await Fluttertoast.showToast(
          msg: "Please select a file type", toastLength: Toast.LENGTH_LONG);
      return;
    }
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: _pickType.value);
      if (result != null) {
        _path.value = result.files.single.path;
      } else {
        await Fluttertoast.showToast(
            msg: "User cancelled the request to pick files");
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
  }

  Widget dropDown(BuildContext context, ValueNotifier _pickType) {
    return DropdownButton<FileType>(
      hint: new Text('Select File Type'),
      value: _pickType.value,
      items: <DropdownMenuItem<FileType>>[
        DropdownMenuItem(
          child: new Text('Audio'),
          value: FileType.audio,
        ),
        DropdownMenuItem(
          child: new Text('Image'),
          value: FileType.image,
        ),
        DropdownMenuItem(
          child: new Text('Video'),
          value: FileType.video,
        ),
        DropdownMenuItem(
          child: new Text('Any'),
          value: FileType.any,
        ),
      ],
      onChanged: (value) {
        _pickType.value = value;
      },
    );
  }
}
class ReviewSellersWork extends HookWidget {
  final OrderModel orderModel;
  final Function(RatingModel ratingModel) onButtonPressed;
  const ReviewSellersWork({required this.orderModel,required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sellerComRatingState = useProvider(sellersComRatingProvider);
    var serviceWorkRatingState = useProvider(sellersComRatingProvider);
    var likelyRecomRatingState = useProvider(sellersComRatingProvider);
    var buyerShortDescriptionController = useTextEditingController();
    if(orderModel.isReviewed==null){
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            ApplyRatingWidget(
              ratingHeader: "Seller Communication",
              onButtonPressed: (value) {
                sellerComRatingState.state = value;
              },
              isIgnoreGesture: false,
            ),
            const SizedBox(height: 25),
            ApplyRatingWidget(
                ratingHeader: "Service of Work",
                onButtonPressed: (value) {
                  serviceWorkRatingState.state = value;
                },
                isIgnoreGesture: false),
            const SizedBox(height: 25),
            ApplyRatingWidget(
                ratingHeader: "How likely to recommend",
                onButtonPressed: (value) {
                  likelyRecomRatingState.state = value;
                },
                isIgnoreGesture: false),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.3,
                    child: TextField(
                      autofocus: false,
                      maxLines: 300,
                      controller:
                      buyerShortDescriptionController,
                      keyboardType:
                      TextInputType.multiline,
                      textAlignVertical:
                      TextAlignVertical.top,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color:
                              const Color(0xff29283C),
                              fontSize: 16)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText:
                        "Short description to Seller",
                        labelStyle: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(
                                    0xff29283C),
                                fontSize: 14)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                              const Color(0xff0000FF),
                              width: 1),
                          borderRadius:
                          BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                              const Color(0xffACACAC),
                              width: 1),
                          borderRadius:
                          BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 22),
                    Text("*Required",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(
                                    0xff29283C),
                                fontSize: 10))),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            PerformOrderActionBtn(
              buttonLabel: "SUBMIT",
              onButtonPressed: () async {
                if (buyerShortDescriptionController
                    .text.isEmpty) {
                  return await Fluttertoast.showToast(
                      msg:
                      "Description field cannot be empty",
                      toastLength: Toast.LENGTH_LONG);
                }
                RatingModel ratingModel = RatingModel(sellersCommunication: sellerComRatingState.state!, likelyRecommend: likelyRecomRatingState.state!, sellerId: orderModel.sellerId, serviceWork: serviceWorkRatingState.state!, buyersTestimony: buyerShortDescriptionController.text,
                );
                onButtonPressed(ratingModel);
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ]);
    }else{
      if(orderModel.isReviewed!){
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              ApplyRatingWidget(
                ratingHeader: "Seller Communication",
                onButtonPressed: (value) {
                  sellerComRatingState.state = value;
                },
                isIgnoreGesture: true,
              ),
              const SizedBox(height: 25),
              ApplyRatingWidget(
                  ratingHeader: "Service of Work",
                  onButtonPressed: (value) {
                    serviceWorkRatingState.state = value;
                  },
                  isIgnoreGesture: true),
              const SizedBox(height: 25),
              ApplyRatingWidget(
                  ratingHeader: "How likely to recommend",
                  onButtonPressed: (value) {
                    likelyRecomRatingState.state = value;
                  },
                  isIgnoreGesture: true),
            ]);
      }else{
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              ApplyRatingWidget(
                ratingHeader: "Seller Communication",
                onButtonPressed: (value) {
                  sellerComRatingState.state = value;
                },
                isIgnoreGesture: false,
              ),
              const SizedBox(height: 25),
              ApplyRatingWidget(
                  ratingHeader: "Service of Work",
                  onButtonPressed: (value) {
                    serviceWorkRatingState.state = value;
                  },
                  isIgnoreGesture: false),
              const SizedBox(height: 25),
              ApplyRatingWidget(
                  ratingHeader: "How likely to recommend",
                  onButtonPressed: (value) {
                    likelyRecomRatingState.state = value;
                  },
                  isIgnoreGesture: false),
              const SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Theme(
                    data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.3,
                      child: TextField(
                        autofocus: false,
                        maxLines: 300,
                        controller:
                        buyerShortDescriptionController,
                        keyboardType:
                        TextInputType.multiline,
                        textAlignVertical:
                        TextAlignVertical.top,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color:
                                const Color(0xff29283C),
                                fontSize: 16)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText:
                          "Short description to Seller",
                          labelStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: const Color(
                                      0xff29283C),
                                  fontSize: 14)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                const Color(0xff0000FF),
                                width: 1),
                            borderRadius:
                            BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                const Color(0xffACACAC),
                                width: 1),
                            borderRadius:
                            BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 22),
                      Text("*Required",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: const Color(
                                      0xff29283C),
                                  fontSize: 10))),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              PerformOrderActionBtn(
                buttonLabel: "SUBMIT",
                onButtonPressed: () async {
                  if (buyerShortDescriptionController
                      .text.isEmpty) {
                    return await Fluttertoast.showToast(
                        msg:
                        "Description field cannot be empty",
                        toastLength: Toast.LENGTH_LONG);
                  }
                  final progress = ProgressHUD.of(context);
                  progress!.showWithText('Submitting Review...');
                  await context.read(userRepositoryProvider).submitBuyersRating(requestId: orderModel.requestId, sellerId: orderModel.sellerId, ratingModel:RatingModel(sellersCommunication: sellerComRatingState.state!, likelyRecommend: likelyRecomRatingState.state!, sellerId: orderModel.sellerId, serviceWork: serviceWorkRatingState.state!, buyersTestimony: buyerShortDescriptionController.text,
                  ), orderModel: orderModel);
                  progress.dismiss();
                  await Fluttertoast.showToast(msg: "Review submitted successfully",toastLength: Toast.LENGTH_SHORT);
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ]);
      }
    }
  }
}
