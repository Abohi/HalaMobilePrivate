import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/pages/dashboard_pages/widget/offer_item_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class OfferSentPage extends HookWidget {
  final String requestId;
  const OfferSentPage({required this.requestId});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
    appBar:AppBar(
      elevation: 5,
      title: Text(
        "Sellers Offer",
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
    ) ,
        body: Container(
      width: size.width,
      height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          margin: EdgeInsets.only(top: 20),
          child:StreamBuilder<List<OfferModel>>(
            stream: context.read(userControllerProvider.notifier).getOffers(context.read(authControllerProvider)!.uid, requestId),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
                  ],
                );
              }else if(snapshot.hasData){
                if(snapshot.data!.length==0){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("No Available Offer")
                    ],
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return OfferItemCard(
                       offerModel:snapshot.data![index],
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }else{
                return SizedBox.shrink();
              }
            },
          ),
    )));
  }
}
