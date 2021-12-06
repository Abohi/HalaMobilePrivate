import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/models/rating_model/rating_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/ongoin_order_detailpage.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
class CompletedOrderDetailPage extends HookWidget {
  final OrderModel orderModel;
  const CompletedOrderDetailPage({required this.orderModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        title: Text(
          "Completed Orders",
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
        child:Builder(
          builder:(context){
            return Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: ListView(
                children: [
                  StreamBuilder<CreateRequestModel?>(
                    stream: context
                        .read(userRepositoryProvider)
                        .getRequestStream(orderModel.requestId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
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
                                  SizedBox(height: 10,),
                                  Text(
                                    snapshot.data!.title,
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
                                            snapshot.data!.budget,
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color: const Color(0xff555555),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700)),
                                          ),
                                          SizedBox(height: 3,),
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                          SizedBox(height: 3,),
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Created: ${DateFormat.yMMMMd().format(DateFormat("yyyy-MM-dd").parse(snapshot.data!.date))}",
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color: const Color(0xff555555),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700)),
                                          ),
                                          SizedBox(height: 3,),
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
                                  SizedBox(height: 21,),
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
                            const SizedBox(height: 35,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("ID: ${orderModel.orderId}",style: GoogleFonts.roboto(textStyle:TextStyle(fontSize:12,color:const Color(0xff0000FF),fontWeight: FontWeight.w700)),),
                                Container(
                                  width:size.width*0.3,
                                  height:20,
                                  decoration:BoxDecoration(color:const Color(0xff11DD00),borderRadius: BorderRadius.circular(10)),
                                  child: Center(child:Text(orderModel.orderStatus,style: GoogleFonts.roboto(textStyle:TextStyle(fontSize:12,color:const Color(0xff0000FF),fontWeight: FontWeight.normal)),),),
                                )
                              ],
                            )

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
                  Container(
                    width: size.width,
                    height: 1,
                    color:const Color(0xffE6E6E6),
                    padding: EdgeInsets.symmetric(vertical: 29.31),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Review work",style: GoogleFonts.roboto(textStyle:TextStyle(fontSize:16,color:const Color(0xffACACAC),fontWeight: FontWeight.w700)),),
                      Icon(orderModel.isReviewed!?Icons.keyboard_arrow_down_rounded:Icons.keyboard_arrow_up_rounded,color: const Color(0xffACACAC),)
                    ],
                  ),
                  (context.read(userModelExtensionController)!.userModel.isSeller==false)&&(!orderModel.isReviewed!)?ReviewSellersWork(orderModel: orderModel, onButtonPressed: (RatingModel ratingModel) async{
                    final progress = ProgressHUD.of(context);
                    progress!.showWithText('Submitting Review...');
                    await context.read(userRepositoryProvider).submitBuyersRating(requestId: orderModel.requestId, sellerId: orderModel.sellerId, ratingModel:ratingModel, orderModel: orderModel);
                    progress.dismiss();
                    await Fluttertoast.showToast(msg: "Review submitted successfully",toastLength: Toast.LENGTH_SHORT);
                  },):SizedBox.shrink(),
                  orderModel.isReviewed!?StreamBuilder<RatingModel?>(
                    stream: context.read(userRepositoryProvider).getRating(orderModel.sellerId, orderModel.requestId),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data!.buyersTestimony),
                            SizedBox(height: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Seller Communication",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: const Color(0xff555555))),),
                                const SizedBox(height:11),
                                Container(
                                  width: size.width*0.7,
                                  height: size.height*0.08,
                                  decoration: BoxDecoration(color: Colors.white,border: Border.all(color:const Color(0xffC7C7C7)),borderRadius: BorderRadius.circular(28)),
                                  child: Center(
                                    child: RatingBar.builder(
                                      initialRating: snapshot.data!.sellersCommunication,
                                      minRating: 1,
                                      itemSize: 24,
                                      direction: Axis.horizontal,
                                      ignoreGestures: true,
                                      unratedColor: const Color(0xffC7C7C7),
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {

                                      },
                                    ),
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Service of Work",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: const Color(0xff555555))),),
                                const SizedBox(height:11),
                                Container(
                                  width: size.width*0.7,
                                  height: size.height*0.08,
                                  decoration: BoxDecoration(color: Colors.white,border: Border.all(color:const Color(0xffC7C7C7)),borderRadius: BorderRadius.circular(28)),
                                  child: Center(
                                    child: RatingBar.builder(
                                      initialRating: snapshot.data!.serviceWork,
                                      minRating: 1,
                                      itemSize: 24,
                                      direction: Axis.horizontal,
                                      ignoreGestures: true,
                                      unratedColor: const Color(0xffC7C7C7),
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {

                                      },
                                    ),
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("How likely to recommend",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: const Color(0xff555555))),),
                                const SizedBox(height:11),
                                Container(
                                  width: size.width*0.7,
                                  height: size.height*0.08,
                                  decoration: BoxDecoration(color: Colors.white,border: Border.all(color:const Color(0xffC7C7C7)),borderRadius: BorderRadius.circular(28)),
                                  child: Center(
                                    child: RatingBar.builder(
                                      initialRating: snapshot.data!.likelyRecommend,
                                      minRating: 1,
                                      itemSize: 24,
                                      direction: Axis.horizontal,
                                      ignoreGestures: true,
                                      unratedColor: const Color(0xffC7C7C7),
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {

                                      },
                                    ),
                                  ),

                                ),
                              ],
                            )
                          ],
                        );
                      }
                      else if(snapshot.connectionState==ConnectionState.waiting){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
                          ],
                        );
                      }else{
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("No review available")
                          ],
                        );
                      }
                    },
                  ):SizedBox.shrink()
                ],
              ),
            );
          }
        )
      ),
    );
  }
}


