import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:halawork/pages/dashboard_pages/widget/viewoffer_btn.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class OfferItemCard extends HookWidget {
  final OfferModel offerModel;
  const OfferItemCard({required this.offerModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModel = useState<UserModel?>(null);
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<UserModel>(
            stream: context.read(userRepositoryProvider).getUserModel(offerModel.sellerId!),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
                  ],
                );
              }
              else if(snapshot.hasData){
                WidgetsBinding.instance!
                    .addPostFrameCallback((_){
                  userModel.value = snapshot.data;
                });
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(snapshot.data!.profilePictureUrl!),
                      ),
                    ),
                    SizedBox(
                      width: 21.54,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff555555))),
                        ),
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
                              itemPadding:
                              EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {

                              },
                            ),
                            SizedBox(
                              width: 6.54,
                            ),
                            Text(
                              "4",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xff555555))),
                            )
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.clear,
                      size: 18,
                      color: const Color(0xffACACAC),
                    )
                  ],
                );
              }
              else{
                return SizedBox.shrink();
              }
            },
          ),
          SizedBox(
            height: 17,
          ),
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
          SizedBox(
            height: 35,
          ),
          ViewOfferBtn(
            btnLabel: "View",
            isViewBtn: true,
            onButtonPressed: () {
                context.router.navigate(OfferSentDetailRoute(offerModel: offerModel, userModel: userModel.value!));
            },
          )
        ],
      ),

    );
  }
}