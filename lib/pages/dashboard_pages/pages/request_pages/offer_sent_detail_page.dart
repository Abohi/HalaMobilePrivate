import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/offers_sent_detailpage_component/offer_bottom_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/offers_sent_detailpage_component/offer_top_section.dart';
import 'package:auto_route/auto_route.dart';
import 'offers_sent_detailpage_component/custom_divider.dart';

class OfferSentDetailPage extends HookWidget {
  final UserModel userModel;
  final OfferModel offerModel;
  const OfferSentDetailPage({required this.offerModel,required this.userModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        title: Text(
          userModel.firstName!,
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
        body:Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: ListView(
            children: [
              SizedBox(height: 19,),
              OfferTopSection(userModel: userModel, offerModel: offerModel),
              const CustomDivider(),
              OfferBottomSection(offerModel: offerModel, userModel: userModel),
              const CustomDivider(),
            ],
          ),
        ) ,
      ),
    );
  }
}
