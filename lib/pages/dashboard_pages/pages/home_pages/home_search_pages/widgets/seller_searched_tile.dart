import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/widget/custom_chipinput.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class SellerSearchedTile extends ConsumerWidget {
  final UserModel userModel;

  const SellerSearchedTile({required this.userModel});

  @override
  Widget build(BuildContext context, ScopedReader watch) {

    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        context.router.navigate(ProfileViewRoute(userId: userModel.documentId!));
      },
      child: Container(
        width: size.width,
        height:size.height*0.17,
        padding: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:const Color(0xffF8F8F8) ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width*0.3,
              height: size.width*0.3,
              child: SvgPicture.asset(
                userModel.serviceIcon!,
              ),
            ),
            SizedBox(width: 17,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 13,),
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
                            userModel.profilePictureUrl!,

                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 7,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userModel.sellerType=="Organization"?
                              "${userModel.orgDetailModel!["firstName"]} ${userModel.orgDetailModel!["lastName"]}":
                              "${userModel.firstName} ${userModel.lastName}",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  textStyle: TextStyle(
                                      color: const Color(0xff555555), fontSize: 14)),
                            ),
                            SizedBox(height: 3.21,),
                            userModel.ratings==null?Text(""):Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  initialRating:  double.parse(userModel.ratings!.serviceOfWorkRatinig.toString()),
                                  minRating: 1,
                                  itemSize: 6.92,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                  ignoreGestures: true,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ), onRatingUpdate: (double value) {

                                },
                                ),
                                SizedBox(width: 6.54,),
                                Text(userModel.ratings!.serviceOfWorkRatinig.toString(),style:TextStyle(fontSize: 10,color: const Color(
                                    0xff555555),fontWeight: FontWeight.normal) ,)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.21,),
                  // snapshot.data.ratingNotAvaialable?Text(""):FutureBuilder<String>(
                  //     future: DashBoardService().getSellerDescription(queryDocumentSnapshot.id, snapshot.data.isOrganisation),
                  //     builder: (context,snapshot){
                  //       if(snapshot.hasData){
                  //         return Text(snapshot.data,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: const Color(0xff555555))),);
                  //       }
                  //       return Text("");
                  //     }),
                  const SizedBox(height: 10,),
                  Container(
                    height: size.height * 0.04,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: userModel.skills!.length,
                        itemBuilder: (context, index) {
                          return CustomChipInput(
                            skillsList: userModel.skills!.cast<String>(),
                            selected: true,
                            index: index,
                            onTap: () {},
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}