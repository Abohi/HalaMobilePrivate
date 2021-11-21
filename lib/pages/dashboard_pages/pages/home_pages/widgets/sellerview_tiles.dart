import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/recently_visited_model/recently_visited_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/widget/custom_chipinput.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class SellersViewedTiles extends HookWidget {
  final RecentlyVisitedModel recentlyVisitedModel;

  const SellersViewedTiles({required this.recentlyVisitedModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<UserModelExtension>(
      stream: context.read(userRepositoryProvider).getUserModelExtension(recentlyVisitedModel.sellerId),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Container(
            width: size.width * 0.5,
            color: const Color(0xffF8F8F8),
            margin: EdgeInsets.only(
              left: 18,
            ),
            padding: EdgeInsets.only(left: 6, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          snapshot.data!.userModel.profilePictureUrl!,

                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            snapshot.data!.userModel.sellerType=="Organization"?"${snapshot.data!.userModel.orgDetailModel!["firstName"]} ${snapshot.data!.userModel.orgDetailModel!["lastName"]}":"${snapshot.data!.userModel.firstName} ${snapshot.data!.userModel.lastName}",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                textStyle: TextStyle(
                                    color: const Color(0xff555555), fontSize: 14)),
                          ),
                          SizedBox(
                            height: 3.21,
                          ),
                          snapshot.data!.userModel.ratings==null?Text(""):RatingBar.builder(
                            initialRating:snapshot.data!.userModel.ratings!.serviceOfWorkRatinig,
                            minRating: 1,
                            itemSize: 6.92,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                snapshot.data!.userModel.ratings==null?Text(""):SizedBox(
                  height: 14,
                ),
                Text(snapshot.data!.userModel.sellerType=="Organization"?snapshot.data!.userModel.orgDetailModel!["companiesDescription"]:snapshot.data!.userModel.profileDescription,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: const Color(0xff555555))),),
                Container(
                  height: size.height * 0.04,
                  child: snapshot.data!.userModel.skills==null?Text("No available skills"):ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.userModel.skills!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomChipInput(
                            skillsList: snapshot.data!.userModel.skills!.cast<String>(),
                            selected:true,
                            index: index,
                            onTap: () {},
                          ),
                        );
                      }),
                ),
                snapshot.data!.portfolios==null || snapshot.data!.portfolios!.isEmpty?Container(
                    width: size.width,
                child: SvgPicture.asset(snapshot.data!.userModel.serviceIcon!,width: size.width,height: size.height*0.2,),):Expanded(
                    child: Container(
                      width: size.width,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(snapshot.data!.portfolios![0].photoUrl!),fit: BoxFit.fill)),
                    ))
              ],
            ),
          );
        }
        return Text("");
      },
    );
  }
}