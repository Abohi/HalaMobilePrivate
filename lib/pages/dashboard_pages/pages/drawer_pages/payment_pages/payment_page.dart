import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/account_info_model/account_info_data_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/withdraw_funds_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/payment_component/payment_top_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/widgets/account_item_card.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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



//Button withdraw funds
// class PayBtnWithDrawFunds extends StatelessWidget {
//   final Function onTap;
//
//   const PayBtnWithDrawFunds({@required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () {
//         onTap();
//       },
//       child: Container(
//         width: size.width,
//         height: 50,
//         margin: EdgeInsets.symmetric(horizontal: 14),
//         decoration: BoxDecoration(
//             color: const Color(0xff0000FF),
//             borderRadius: BorderRadius.circular(4)),
//         child: Center(
//           child: Text(
//             "WITHDRAW FUNDS(ADD ACCT)",
//             style: GoogleFonts.roboto(
//                 textStyle: TextStyle(
//                     fontSize: 14,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700)),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// //Funds capital status
// class FundsClearingStatus extends StatelessWidget {
//   const FundsClearingStatus();
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 21),
//       width: size.width,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Funds Pending",
//                 style: GoogleFonts.roboto(
//                     textStyle: TextStyle(
//                         color: const Color(0xffACACAC),
//                         fontSize: 12,
//                         fontWeight: FontWeight.normal)),
//               ),
//               Text(
//                 "Cleared Funds",
//                 style: GoogleFonts.roboto(
//                     textStyle: TextStyle(
//                         color: const Color(0xffACACAC),
//                         fontSize: 12,
//                         fontWeight: FontWeight.normal)),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "0.00NGN",
//                 style: GoogleFonts.roboto(
//                     textStyle: TextStyle(
//                         color: const Color(0xff29283C),
//                         fontSize: 14,
//                         fontWeight: FontWeight.normal)),
//               ),
//               Text(
//                 "0.00NGN",
//                 style: GoogleFonts.roboto(
//                     textStyle: TextStyle(
//                         color: const Color(0xff29283C),
//                         fontSize: 14,
//                         fontWeight: FontWeight.normal)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//


class AccountList extends StatelessWidget {
  const AccountList();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.25,
      child: StreamBuilder<List<AccountInfoDataModel>>(
        stream: context.read(userRepositoryProvider).getBankAccounts(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemBuilder: (context, index) {
                if((index+1)==snapshot.data!.length)
                  return GestureDetector(
                    onTap: (){
                      context.router.navigate(WithDrawFundsRoute());
                    },
                      child: AccountItems(isLastCard: true, accountInfoDataModel:snapshot.data![index] ));
                return GestureDetector(

                  onTap: (){
                    context.router.navigate(WithDrawFundsRoute());
                  },
                    child: AccountItems(isLastCard: false, accountInfoDataModel: snapshot.data![index],));
              },
              itemCount: snapshot.data!.length,
            );
          }  if (snapshot.connectionState == ConnectionState.waiting) {
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
                Text("No Available Request")
              ],
            );
          }
        },
      ),
    );
  }
}




//
// class FundsBtn extends StatelessWidget {
//   final Function onButtonPressed;
//   final String btnTitle;
//
//   const FundsBtn({this.btnTitle, @required this.onButtonPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () {
//         onButtonPressed();
//       },
//       child: Container(
//         width: size.width,
//         color: const Color(0xffF8F8F8),
//         height: 55,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 25,
//             ),
//             Text(
//               btnTitle,
//               style: GoogleFonts.roboto(
//                   textStyle: TextStyle(
//                       color: const Color(0xff29283C),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700)),
//             ),
//             Spacer(),
//             Icon(
//               Icons.keyboard_arrow_right,
//               size: 18,
//               color: const Color(0xff0000FF),
//             ),
//             SizedBox(
//               width: 12.59,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class PaymentPage extends HookWidget {
  const PaymentPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 5,
              title: Text(
                "Payment",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff3E3E3E),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
              centerTitle: true,
              pinned: true,
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
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const PaymentTopSection(),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 26.0, right: 26, top: 39),
                    child: Text(
                      "Accounts",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: const Color(0xff29283C),
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                    ),
                  ),
                  const AccountList(),
                  const SizedBox(
                    height: 25,
                  ),
                  // FundsBtn(
                  //   btnTitle: "Withdrawn Funds",
                  //   onButtonPressed: () {
                  //     // changeScreen(
                  //     //     context: context, widget: WithDrawFundsHistory());
                  //   },
                  // ),
                  const Divider(
                    height: 0.5,
                    color: const Color(0xffACACAC),
                  ),
                  // FundsBtn(
                  //   btnTitle: "Funds on pending",
                  //   onButtonPressed: () {
                  //     // changeScreen(
                  //     //     context: context, widget: FundsPendingHistory());
                  //   },
                  // ),
                  const SizedBox(
                    height: 25,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
