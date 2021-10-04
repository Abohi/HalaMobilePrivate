import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/requests_model/request_model2.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:halawork/pages/dashboard_pages/widget/viewoffer_btn.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:auto_route/auto_route.dart';
class SellerRequestCard extends StatelessWidget {
  final CreateRequestModel2 createRequestModel;
  final String btnLabel;
  final bool isRemoveOfferBtn;
  final bool isLast;
  const SellerRequestCard({required this.createRequestModel,this.isRemoveOfferBtn=false,required this.btnLabel,this.isLast=false});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: isLast?EdgeInsets.only(bottom: 45):EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${ createRequestModel.title!.length<=10?createRequestModel.title:createRequestModel.title!.replaceRange(10, createRequestModel.title!.length, "...")}",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff555555),
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Container(
                width: 64,
                height: 19,
                decoration: BoxDecoration(
                    color: createRequestModel.requestStatus==true?const Color(0xff11DD00):Colors.red,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "${createRequestModel.requestStatus==true?'Active':'CLOSED'}",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Icon(
                Icons.clear,
                color: const Color(0xffACACAC),
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    createRequestModel.budget!,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    createRequestModel.state!,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMd().format(DateTime.parse(createRequestModel.date!)),
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
                    "Date",
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
          Consumer(builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
            var firstHalfState = watch(firstHalfStateProvider).state;
            var secondHalfState = watch(secondHalfStateProvider).state;
            if(createRequestModel.description!.length>200){
              firstHalfState = createRequestModel.description!.substring(0, 200);
              secondHalfState = createRequestModel.description!.substring(200, createRequestModel.description!.length);
            }else{
              firstHalfState=createRequestModel.description!;
              secondHalfState = "";
            }
            return  ExpandableTextView(
                textColor: const Color(0xff7C7C7C),
                textSize: 14);
          },),
          isRemoveOfferBtn?Text(""):SizedBox(
            height: 23,
          ),
          isRemoveOfferBtn?Text(""):ViewOfferBtn(
            btnLabel: btnLabel,
            isViewBtn: false,
            onButtonPressed: () {
              context.router.navigate(SendOfferRoute(createRequestModel2: createRequestModel));
            },
          ),
          isRemoveOfferBtn?Text(""):SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
class BuyerRequestCard extends StatelessWidget {
  final CreateRequestModel createRequestModel;
  final String btnLabel;
  final bool isRemoveOfferBtn;
  final bool isLast;
  const BuyerRequestCard({required this.createRequestModel,this.isRemoveOfferBtn=false,required this.btnLabel,this.isLast=false});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: isLast?EdgeInsets.only(bottom: 45):EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${ createRequestModel.title.length<=10?createRequestModel.title:createRequestModel.title.replaceRange(10, createRequestModel.title.length, "...")}",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff555555),
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Container(
                width: 64,
                height: 19,
                decoration: BoxDecoration(
                    color: createRequestModel.requestStatus==true?const Color(0xff11DD00):Colors.red,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "${createRequestModel.requestStatus==true?'Active':'CLOSED'}",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Icon(
                Icons.clear,
                color: const Color(0xffACACAC),
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    createRequestModel.budget,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    createRequestModel.state,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMd().format(DateTime.parse(createRequestModel.date)),
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
                    "Date",
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
          Consumer(builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
            var firstHalfState = watch(firstHalfStateProvider).state;
            var secondHalfState = watch(secondHalfStateProvider).state;
            if(createRequestModel.description.length>200){
              firstHalfState = createRequestModel.description.substring(0, 200);
              secondHalfState = createRequestModel.description.substring(200, createRequestModel.description.length);
            }else{
              firstHalfState=createRequestModel.description;
              secondHalfState = "";
            }
            return  ExpandableTextView(
                textColor: const Color(0xff7C7C7C),
                textSize: 14);
          },),
          isRemoveOfferBtn?Text(""):SizedBox(
            height: 23,
          ),
          isRemoveOfferBtn?Text(""):ViewOfferBtn(
            btnLabel: btnLabel,
            isViewBtn: false,
            onButtonPressed: () {
              context.router.navigate(OfferSentRoute(requestId: createRequestModel.requestId!));
            },
          ),
          isRemoveOfferBtn?Text(""):SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
// class BuyerRequestCard extends StatelessWidget {
//   final BuyerRequestResponse buyerRequestResponse;
//   final String btnLabel;
//   final bool isRemoveOfferBtn;
//   final bool isLast;
//   const BuyerRequestCard({this.buyerRequestResponse,this.isRemoveOfferBtn=false,this.btnLabel,this.isLast});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width,
//       height: size.height * 0.4,
//       margin: isLast?EdgeInsets.only(bottom: 45):EdgeInsets.only(bottom: 20),
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//           color: const Color(0xffF8F8F8),
//           borderRadius: BorderRadius.circular(4)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Text(
//                   "${ buyerRequestResponse.requestModel.title.length<=10?buyerRequestResponse.requestModel.title:buyerRequestResponse.requestModel.title.replaceRange(10, buyerRequestResponse.requestModel.title.length, "...")}",
//                   style: GoogleFonts.roboto(
//                       textStyle: TextStyle(
//                           color: const Color(0xff555555),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700)),
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 64,
//                       height: 19,
//                       decoration: BoxDecoration(
//                           color: buyerRequestResponse.status=='OPEN'?const Color(0xff11DD00):Colors.red,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Center(
//                         child: Text(
//                           "${ buyerRequestResponse.status=='OPEN'?'Active':'CLOSED'}",
//                           style: GoogleFonts.roboto(
//                               textStyle: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.normal)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Icon(
//                       Icons.clear,
//                       color: const Color(0xffACACAC),
//                       size: 20,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 16,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     buyerRequestResponse.requestModel.budget,
//                     style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                             color: const Color(0xff555555),
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     "Budget",
//                     style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                             color: const Color(0xff7C7C7C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.normal)),
//                   ),
//                 ],
//               ),
//               Spacer(),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     buyerRequestResponse.state,
//                     style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                             color: const Color(0xff555555),
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     "State",
//                     style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                             color: const Color(0xff7C7C7C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.normal)),
//                   ),
//                 ],
//               ),
//               Spacer(),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     buyerRequestResponse.requestModel.datePosted,
//                     style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                             color: const Color(0xff555555),
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     "Date",
//                     style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                             color: const Color(0xff7C7C7C),
//                             fontSize: 12,
//                             fontWeight: FontWeight.normal)),
//                   ),
//                 ],
//               ),
//               Spacer(),
//             ],
//           ),
//           SizedBox(
//             height: 21,
//           ),
//           DescriptionTextWidget(
//               text: "${ buyerRequestResponse.requestModel.description.length<=15?buyerRequestResponse.requestModel.description:buyerRequestResponse.requestModel.description.replaceRange(15, buyerRequestResponse.requestModel.description.length, "...")}",
//               textColor: const Color(0xff7C7C7C),
//               textSize: 14),
//           isRemoveOfferBtn?Text(""):SizedBox(
//             height: 23,
//           ),
//           isRemoveOfferBtn?Text(""):ViewOfferBtn(
//             isViewBtn: false,
//             btnLabel: btnLabel,
//             onButtonPressed: () {
//               changeScreen(context: context, widget: OffersPage(requestId: buyerRequestResponse.requestId,));
//             },
//           ),
//           isRemoveOfferBtn?Text(""):SizedBox(
//             height: 16,
//           )
//         ],
//       ),
//     );
//   }
// }