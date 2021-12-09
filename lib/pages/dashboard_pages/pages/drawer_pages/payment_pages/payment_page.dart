// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:auto_route/auto_route.dart';
// class Payment extends StatefulWidget {
//   const Payment();
//
//   @override
//   _PaymentState createState() => _PaymentState();
// }
//
// class _PaymentState extends State<Payment> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: WillPopScope(
//         onWillPop: () async {
//           Navigator.pop(context);
//           return true;
//         },
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               elevation: 5,
//               title: Text(
//                 "Payment",
//                 style: GoogleFonts.roboto(
//                     textStyle: TextStyle(
//                         color: const Color(0xff3E3E3E),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700)),
//               ),
//               centerTitle: true,
//               pinned: true,
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: const Color(0xff0000FF),
//                   size: 24,
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             SliverPadding(
//               padding: EdgeInsets.symmetric(horizontal: 17),
//               sliver: SliverList(
//                 delegate: SliverChildListDelegate([
//                   const PaymentTopSection(),
//                   Padding(
//                     padding:
//                     const EdgeInsets.only(left: 26.0, right: 26, top: 39),
//                     child: Text(
//                       "Accounts",
//                       style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                               color: const Color(0xff29283C),
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16)),
//                     ),
//                   ),
//                   const AccountList(),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   FundsBtn(
//                     btnTitle: "Withdrawn Funds",
//                     onButtonPressed: () {
//                       changeScreen(
//                           context: context, widget: WithDrawFundsHistory());
//                     },
//                   ),
//                   const Divider(
//                     height: 0.5,
//                     color: const Color(0xffACACAC),
//                   ),
//                   FundsBtn(
//                     btnTitle: "Funds on pending",
//                     onButtonPressed: () {
//                       changeScreen(
//                           context: context, widget: FundsPendingHistory());
//                     },
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                 ]),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PaymentTopSection extends StatelessWidget {
//
//   const PaymentTopSection();
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     // ProgressDialog  _progressDialog = ProgressDialog(context,
//     //     type: ProgressDialogType.Normal,
//     //     isDismissible: false,
//     //     customBody: CustomProgressBody(
//     //       progressLabel: "Charging Account...",
//     //     ));
//     return Container(
//       width: size.width,
//       height: 232,
//       color: const Color(0xffF8F8F8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 21,
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // changeScreen(context: context, widget: WithDrawFunds2());
//                   },
//                   child: Text(
//                     "Personal Balance",
//                     style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                             fontSize: 14, color: const Color(0xffACACAC))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "0.00NGN",
//                   style: GoogleFonts.roboto(
//                       textStyle: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                           color: const Color(0xff0000FF))),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           PayBtnWithDrawFunds(
//             onTap: () async {
//
//               // changeScreen(context: context, widget:
//               // FutureProvider<BankModel>.value(value: PaymentService().getBankList(),
//               //   child:AddAccount() ,));
//             },
//           ),
//           SizedBox(
//             height: 27,
//           ),
//           const FundsClearingStatus()
//         ],
//       ),
//     );
//   }
// }
//
// //Button withdraw funds
// // class PayBtnWithDrawFunds extends StatelessWidget {
// //   final Function onTap;
// //
// //   const PayBtnWithDrawFunds({@required this.onTap});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var size = MediaQuery.of(context).size;
// //     return GestureDetector(
// //       onTap: () {
// //         onTap();
// //       },
// //       child: Container(
// //         width: size.width,
// //         height: 50,
// //         margin: EdgeInsets.symmetric(horizontal: 14),
// //         decoration: BoxDecoration(
// //             color: const Color(0xff0000FF),
// //             borderRadius: BorderRadius.circular(4)),
// //         child: Center(
// //           child: Text(
// //             "WITHDRAW FUNDS(ADD ACCT)",
// //             style: GoogleFonts.roboto(
// //                 textStyle: TextStyle(
// //                     fontSize: 14,
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.w700)),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // //Funds capital status
// // class FundsClearingStatus extends StatelessWidget {
// //   const FundsClearingStatus();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var size = MediaQuery.of(context).size;
// //     return Container(
// //       margin: EdgeInsets.symmetric(horizontal: 21),
// //       width: size.width,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         children: [
// //           Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 "Funds Pending",
// //                 style: GoogleFonts.roboto(
// //                     textStyle: TextStyle(
// //                         color: const Color(0xffACACAC),
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.normal)),
// //               ),
// //               Text(
// //                 "Cleared Funds",
// //                 style: GoogleFonts.roboto(
// //                     textStyle: TextStyle(
// //                         color: const Color(0xffACACAC),
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.normal)),
// //               )
// //             ],
// //           ),
// //           SizedBox(
// //             height: 8,
// //           ),
// //           Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 "0.00NGN",
// //                 style: GoogleFonts.roboto(
// //                     textStyle: TextStyle(
// //                         color: const Color(0xff29283C),
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.normal)),
// //               ),
// //               Text(
// //                 "0.00NGN",
// //                 style: GoogleFonts.roboto(
// //                     textStyle: TextStyle(
// //                         color: const Color(0xff29283C),
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.normal)),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class AccountList extends StatelessWidget {
// //   const AccountList();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var size = MediaQuery.of(context).size;
// //     return SizedBox(
// //       width: size.width,
// //       height: size.height * 0.25,
// //       child: ListView.builder(
// //         itemBuilder: (context, index) {
// //           if (index == 2) {
// //             return AccountItemsAdd(
// //               onButtonPressed: () {},
// //             );
// //           } else {
// //             return const AccountItems();
// //           }
// //         },
// //         itemCount: 3,
// //       ),
// //     );
// //   }
// // }
// //
// // class AccountItems extends StatelessWidget {
// //   const AccountItems();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var size = MediaQuery.of(context).size;
// //     return Container(
// //       height: 55,
// //       width: size.width,
// //       decoration: BoxDecoration(
// //           color: const Color(0xffF8F8F8),
// //           border: Border(
// //               bottom: BorderSide(width: 1, color: const Color(0xffACACAC)))),
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text(
// //               "UBA **** 7960",
// //               style: GoogleFonts.roboto(
// //                   textStyle: TextStyle(
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.normal,
// //                       color: const Color(0xff29283C))),
// //             ),
// //             Row(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 Container(
// //                   decoration: BoxDecoration(
// //                       color: Colors.white, shape: BoxShape.circle),
// //                   width: 28,
// //                   height: 28,
// //                   child: Center(
// //                     child: Icon(
// //                       Icons.edit,
// //                       color: const Color(0xff5A5AFC),
// //                       size: 12,
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(
// //                   width: 11,
// //                 ),
// //                 Container(
// //                   decoration: BoxDecoration(
// //                       color: Colors.white, shape: BoxShape.circle),
// //                   width: 28,
// //                   height: 28,
// //                   child: Center(
// //                     child: Icon(
// //                       Icons.delete,
// //                       color: const Color(0xff5A5AFC),
// //                       size: 12,
// //                     ),
// //                   ),
// //                 )
// //               ],
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class AccountItemsAdd extends StatelessWidget {
// //   final Function onButtonPressed;
// //
// //   const AccountItemsAdd({@required this.onButtonPressed});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var size = MediaQuery.of(context).size;
// //     return Container(
// //       height: 60,
// //       width: size.width,
// //       color: const Color(0xffF8F8F8),
// //       child: GestureDetector(
// //         onTap: () {
// //           onButtonPressed();
// //         },
// //         child: Center(
// //           child: Container(
// //             width: size.width * 0.3,
// //             height: 34,
// //             decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 border: Border.all(color: const Color(0xff0000FF)),
// //                 borderRadius: BorderRadius.circular(25)),
// //             child: Row(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 Icon(
// //                   Icons.add,
// //                   color: const Color(0xff0000FF),
// //                   size: 15,
// //                 ),
// //                 Text(
// //                   "ADD",
// //                   style: GoogleFonts.roboto(
// //                       textStyle: TextStyle(
// //                           fontSize: 12,
// //                           fontWeight: FontWeight.w700,
// //                           color: const Color(0xff0000FF))),
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class FundsBtn extends StatelessWidget {
// //   final Function onButtonPressed;
// //   final String btnTitle;
// //
// //   const FundsBtn({this.btnTitle, @required this.onButtonPressed});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var size = MediaQuery.of(context).size;
// //     return GestureDetector(
// //       onTap: () {
// //         onButtonPressed();
// //       },
// //       child: Container(
// //         width: size.width,
// //         color: const Color(0xffF8F8F8),
// //         height: 55,
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             SizedBox(
// //               width: 25,
// //             ),
// //             Text(
// //               btnTitle,
// //               style: GoogleFonts.roboto(
// //                   textStyle: TextStyle(
// //                       color: const Color(0xff29283C),
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w700)),
// //             ),
// //             Spacer(),
// //             Icon(
// //               Icons.keyboard_arrow_right,
// //               size: 18,
// //               color: const Color(0xff0000FF),
// //             ),
// //             SizedBox(
// //               width: 12.59,
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// class PaymentPage extends StatelessWidget {
//   const PaymentPage();
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         width: size.width,
//         height: size.height,
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               elevation: 5,
//               title: Text(
//                 "Payment",
//                 style: GoogleFonts.roboto(
//                     textStyle: TextStyle(
//                         color: const Color(0xff3E3E3E),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700)),
//               ),
//               centerTitle: true,
//               pinned: true,
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: const Color(0xff0000FF),
//                   size: 24,
//                 ),
//                 onPressed: () {
//                context.popRoute();
//                 },
//               ),
//             ),
//             SliverPadding(
//               padding: EdgeInsets.symmetric(horizontal: 17),
//               sliver: SliverList(
//                 delegate: SliverChildListDelegate([
//                   const PaymentTopSection(),
//                   Padding(
//                     padding:
//                     const EdgeInsets.only(left: 26.0, right: 26, top: 39),
//                     child: Text(
//                       "Accounts",
//                       style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                               color: const Color(0xff29283C),
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16)),
//                     ),
//                   ),
//                   const AccountList(),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   FundsBtn(
//                     btnTitle: "Withdrawn Funds",
//                     onButtonPressed: () {
//                       // changeScreen(
//                       //     context: context, widget: WithDrawFundsHistory());
//                     },
//                   ),
//                   const Divider(
//                     height: 0.5,
//                     color: const Color(0xffACACAC),
//                   ),
//                   FundsBtn(
//                     btnTitle: "Funds on pending",
//                     onButtonPressed: () {
//                       // changeScreen(
//                       //     context: context, widget: FundsPendingHistory());
//                     },
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                 ]),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
