import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfferTopSection extends HookWidget {
  final UserModel userModel;
  final OfferModel offerModel;
  const OfferTopSection({required this.userModel,required this.offerModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(color: const Color(0xffF8F8F8),borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(userModel.profilePictureUrl!),
                ),
              ),
              SizedBox(width: 21.54,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text( "${userModel.firstName} ${userModel.lastName}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: const Color(0xff555555))),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        itemSize: 6.92,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {

                        },
                      ),
                      SizedBox(width: 6.54,),
                      Text("5",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: const Color(0xff555555))),)
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 25,),
          Consumer(builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
            var firstHalfState = watch(firstHalfStateProvider).state;
            var secondHalfState = watch(secondHalfStateProvider).state;
            if(offerModel.description.length>200){
              firstHalfState = offerModel.description.substring(0, 200);
              secondHalfState = offerModel.description.substring(200, offerModel.description.length);
            }else{
              firstHalfState=offerModel.description;
              secondHalfState = "";
            }
            return  ExpandableTextView(
                textColor: const Color(0xff7C7C7C),
                textSize: 14);
          },),
        ],
      ),

    );
  }
}
