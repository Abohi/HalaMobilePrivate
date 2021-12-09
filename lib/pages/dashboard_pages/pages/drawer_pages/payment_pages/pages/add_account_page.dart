// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:halawork/exception_handlers/network_failure_exception.dart';
// import 'package:halawork/models/account_info_model/account_info_model.dart';
// import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/add_account_component/back_names_dropdown.dart';
// import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/add_account_component/bank_account_details.dart';
// import 'package:halawork/providers/future_providers/account_info_future_provider.dart';
// import 'package:halawork/providers/future_providers/banklist_provider.dart';
// import 'package:halawork/providers/state_providers/bankDataModelProvider.dart';
// import 'package:halawork/repositories/user_repository.dart';
// import 'package:halawork/widgets/error_widget.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class _AddAccountState extends State<AddAccount> {
//   TextEditingController _textEditingController;
//
//
//   @override
//   void initState() {
//     _textEditingController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var dashBoardProvider = Provider.of<BankInfoProvider>(context);
//
//     return Scaffold(
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
//                 "Add Account",
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
//               padding: EdgeInsets.symmetric(horizontal: 18),
//               sliver: SliverList(
//                 delegate: SliverChildListDelegate([
//                   const SizedBox(
//                     height: 22,
//                   ),
//                   Text(
//                     "Add a Bank detail to withdraw funds",
//                     style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                             color: const Color(0xff29283C))),
//                   ),
//                   SizedBox(
//                     height: 47,
//                   ),
//                   CustomDropDownBtn(),
//                   const SizedBox(
//                     height: 22,
//                   ),
//                   Theme(
//                     data: Theme.of(context)
//                         .copyWith(splashColor: Colors.transparent),
//                     child: TextField(
//                       autofocus: false,
//                       keyboardType: TextInputType.number,
//                       controller: _textEditingController,
//                       style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                               color: const Color(0xff29283C), fontSize: 14)),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelText: "Enter Account Number",
//                         labelStyle: GoogleFonts.roboto(
//                             textStyle: TextStyle(
//                                 color: const Color(0xff29283C), fontSize: 14)),
//                         contentPadding: const EdgeInsets.only(
//                             left: 14.0, bottom: 8.0, top: 8.0),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: const Color(0xff0000FF), width: 1),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: const Color(0xffACACAC), width: 1),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 22,
//                   ),
//                   FutureProvider<String>.value(
//                       value: resolveName(
//                           _textEditingController.text,
//                           Provider.of<BankInfoProvider>(context)
//                               .saveBankInfo
//                               .bankCode),
//                       child: Consumer<String>(
//                         builder: (_, value, __) {
//                           dashBoardProvider.getBankInfoToSave(
//                               accountName: value,
//                               accountNumber: _textEditingController.text,
//                               bankCode:
//                               dashBoardProvider.saveBankInfo
//                                   .bankCode,
//                               bankName:
//                               dashBoardProvider
//                                   .saveBankInfo
//                                   .bankName);
//                           return AccountNameField(
//                             name: value,
//                             accountNumber: _textEditingController.text,
//                           );
//                         },
//                       )),
//                   SizedBox(
//                     height: size.height * 0.3,
//                   ),
//                   CustomBtnContinue(
//                     onButtonPressed: () async {
//                       ProgressDialog _progressDialog;   _progressDialog = ProgressDialog(context,
//                           type: ProgressDialogType.Normal,
//                           isDismissible: false,
//                           customBody: CustomProgressBody(
//                             progressLabel: "Charging Account...",
//                           ));
//                       await _progressDialog.show();
//                       final user = FirebaseAuth.instance.currentUser;
//                       HttpsCallable callableChargeAccount = FirebaseFunctions.instance.httpsCallable("chargeAccount");
//                       HttpsCallableResult<dynamic> chargeAccount =
//                       await callableChargeAccount.call({
//                         "email": user.email,
//                         "amount": "1000",
//                         "bankCode":
//                         dashBoardProvider.saveBankInfo.bankCode,
//                         "accountNumber": dashBoardProvider
//                             .saveBankInfo.accountNumber
//                       });
//                       await _progressDialog.hide();
//                       if(chargeAccount.data["data"]["status"]=="send_otp"){
//
//                       }else if(chargeAccount.data["data"]["status"]=="failed"){
//                         Fluttertoast.showToast(msg: "${chargeAccount.data["data"]["message"]=="Unable to process transaction."?"Transaction banned, due to multiple attempt,retry after 24hrs":chargeAccount.data["data"]["message"]}",toastLength: Toast.LENGTH_LONG);
//                       }
//                       print(
//                           "Charge Type ${chargeAccount.data["data"]["status"]}  Reference ${chargeAccount.data["data"]["reference"]}");
//                     },
//                   )
//                 ]),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<String> resolveName(String accountNum, String code) async {
//     String name = "";
//     if (accountNum.length >= 10) {
//       final HttpsCallable callable =
//       FirebaseFunctions.instance.httpsCallable("resolveAccountNumber");
//       HttpsCallableResult<dynamic> result =
//       await callable.call({"accountNum": accountNum, "bankCode": code});
//       return name = result.data["name"];
//     }
//     return name;
//   }
// }
//
// void dialogWithDraw(BuildContext context) {
//   showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       barrierColor: Colors.black45,
//       transitionDuration: const Duration(milliseconds: 200),
//       pageBuilder: (BuildContext buildContext, Animation animation,
//           Animation secondaryAnimation) {
//         return WithDrawFundsDialog(
//           onBottonPressed: () {
//             changeScreenReplacement(context: context, widget: Payment());
//           },
//           text1: "Successfully added",
//           text2: "A bank account",
//         );
//       });
// }
//
//
//
// class AddAccountPage extends HookWidget {
//   const AddAccountPage();
//
//   @override
//   Widget build(BuildContext context) {
//     var _textEditingController = useTextEditingController();
//     var bankInfoState = useProvider(bankDataModelProvider);
//     AsyncValue<Either<NetworkFailure,AccountInfoModel?>> accountInfoState= useProvider(accountInfoFutureProvider);
//     var size = MediaQuery.of(context).size;
//     WidgetsBinding.instance!
//         .addPostFrameCallback((_){
//           if(_textEditingController.text.length==10){
//             bankInfoState.state=bankInfoState.state?.copyWith(accountNumber: _textEditingController.text.toString());
//           }
//     });
//     return Scaffold(
//       backgroundColor: Colors.white,
//         body: Container(
//           width: size.width,
//           height: size.height,
//           child: CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 elevation: 5,
//                 title: Text(
//                   "Add Account",
//                   style: GoogleFonts.roboto(
//                       textStyle: TextStyle(
//                           color: const Color(0xff3E3E3E),
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700)),
//                 ),
//                 centerTitle: true,
//                 pinned: true,
//                 backgroundColor: Colors.white,
//                 leading: IconButton(
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: const Color(0xff0000FF),
//                     size: 24,
//                   ),
//                   onPressed: () {
//                    context.popRoute();
//                   },
//                 ),
//               ),
//               SliverPadding(
//                 padding: EdgeInsets.symmetric(horizontal: 18),
//                 sliver: SliverList(
//                   delegate: SliverChildListDelegate([
//                     const SizedBox(
//                       height: 22,
//                     ),
//                     Text(
//                       "Add a Bank detail to withdraw funds",
//                       style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: const Color(0xff29283C))),
//                     ),
//                     SizedBox(
//                       height: 47,
//                     ),
//                     BankNameDropDown(),
//                     const SizedBox(
//                       height: 22,
//                     ),
//                     Theme(
//                       data: Theme.of(context)
//                           .copyWith(splashColor: Colors.transparent),
//                       child: TextField(
//                         autofocus: false,
//                         keyboardType: TextInputType.number,
//                         controller: _textEditingController,
//                         style: GoogleFonts.roboto(
//                             textStyle: TextStyle(
//                                 color: const Color(0xff29283C), fontSize: 14)),
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelText: "Enter Account Number",
//                           labelStyle: GoogleFonts.roboto(
//                               textStyle: TextStyle(
//                                   color: const Color(0xff29283C), fontSize: 14)),
//                           contentPadding: const EdgeInsets.only(
//                               left: 14.0, bottom: 8.0, top: 8.0),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: const Color(0xff0000FF), width: 1),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: const Color(0xffACACAC), width: 1),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 22,
//                     ),
//                     accountInfoState.when(data: (accountInfoData){
//                       return accountInfoData.fold((l){
//                         return ErrorWidgetControl(networkFailure: l, retryHandler: ()async{
//                           await context.read(userRepositoryProvider).resolveAccountInfo();
//                         });
//                       }, (r){
//                         return BankAccountDetails(accountNumber: r?.data.account_number, accountName: r?.data.account_name);
//                       });
//                     }, loading: (){
//                       return Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
//                         ],
//                       );
//                     }, error: (object,stacktrace){
//                       return Text(stacktrace.toString());
//                     }),
//                     SizedBox(
//                       height: size.height * 0.3,
//                     ),
//                     // CustomBtnContinue(
//                     //   onButtonPressed: () async {
//                     //     ProgressDialog _progressDialog;   _progressDialog = ProgressDialog(context,
//                     //         type: ProgressDialogType.Normal,
//                     //         isDismissible: false,
//                     //         customBody: CustomProgressBody(
//                     //           progressLabel: "Charging Account...",
//                     //         ));
//                     //     await _progressDialog.show();
//                     //     final user = FirebaseAuth.instance.currentUser;
//                     //     HttpsCallable callableChargeAccount = FirebaseFunctions.instance.httpsCallable("chargeAccount");
//                     //     HttpsCallableResult<dynamic> chargeAccount =
//                     //     await callableChargeAccount.call({
//                     //       "email": user.email,
//                     //       "amount": "1000",
//                     //       "bankCode":
//                     //       dashBoardProvider.saveBankInfo.bankCode,
//                     //       "accountNumber": dashBoardProvider
//                     //           .saveBankInfo.accountNumber
//                     //     });
//                     //     await _progressDialog.hide();
//                     //     if(chargeAccount.data["data"]["status"]=="send_otp"){
//                     //
//                     //     }else if(chargeAccount.data["data"]["status"]=="failed"){
//                     //       Fluttertoast.showToast(msg: "${chargeAccount.data["data"]["message"]=="Unable to process transaction."?"Transaction banned, due to multiple attempt,retry after 24hrs":chargeAccount.data["data"]["message"]}",toastLength: Toast.LENGTH_LONG);
//                     //     }
//                     //     print(
//                     //         "Charge Type ${chargeAccount.data["data"]["status"]}  Reference ${chargeAccount.data["data"]["reference"]}");
//                     //   },
//                     // )
//                   ]),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
