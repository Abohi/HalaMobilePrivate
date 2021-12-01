import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';


final profilePictureStateProvider = StateProvider<XFile?>((ref){
  return  null;
});
class ProfilePhotoSection extends HookWidget {
  final bool isProfileView;
  final UserModel? userModel;
  final Function(String path) updateProfilePicture;
  const ProfilePhotoSection({required this.isProfileView,required this.userModel,required this.updateProfilePicture});
  @override
  Widget build(BuildContext context) {
    if(isProfileView){
      var size = MediaQuery.of(context).size;
      return userModel==null?Text(""):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              userModel?.profilePictureUrl==null?Center(
                child: Text("${userModel?.email!.toUpperCase().substring(0,1)}",style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    )
                ),),
              ):SizedBox(
                  height: 116,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(userModel!.profilePictureUrl!,width: 130,
                      height: 130,fit: BoxFit.fill,),
                  )
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userModel!.sellerType=="Organization"?"${userModel!.orgDetailModel!["firstName"]} ${userModel!.orgDetailModel!["lastName"]}":"${userModel!.firstName} ${userModel!.lastName}",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                width: 13.5,
              ),
              userModel!.available == "Available to work"
                  ? Container(
                width: 13.84,
                height: 13.17,
                decoration: BoxDecoration(
                    color: const Color(0xff08BDFF),
                    shape: BoxShape.circle),
              )
                  : Container(
                width: 13.84,
                height: 13.17,
                decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              )
            ],
          ),
          SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatingBar.builder(
                initialRating:  userModel!.ratings?.serviceOfWorkRatinig==null?0:userModel!.ratings!.serviceOfWorkRatinig.toDouble(),
                minRating: 1,
                itemSize: 17.68,
                unratedColor: const Color(0xffACACAC),
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: const Color(0xffFFD800),
                ),
                ignoreGestures: true,
                onRatingUpdate: (rating) {

                },
              ),
              SizedBox(
                width: 17.82,
              ),
              Text(
                userModel!.ratings?.serviceOfWorkRatinig==null?"0":userModel!.ratings!.serviceOfWorkRatinig.toString(),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              )
            ],
          )
        ],
      );
    }else{
      var userModelState = useProvider(userControllerProvider);
      var size = MediaQuery.of(context).size;
      var _picker =   useMemoized(()=>ImagePicker());
      var profilePhotoState = useProvider(profilePictureStateProvider);
      return userModelState==null?Text(""):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 28,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: 116,
                    child: profilePhotoState.state==null?ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: userModelState.userModel.profilePictureUrl==null?Icon(Icons.person_rounded,size: 130,):Image.network(userModelState.userModel.profilePictureUrl!,width: 130,
                        height: 130,fit: BoxFit.fill,),
                    ):ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.file(File(profilePhotoState.state!.path),width: 130,
                        height: 130,fit: BoxFit.fill,),
                    ),
                  ),
                  Positioned(
                    left: -size.width*0.03,
                    top: -10,
                    child: GestureDetector(
                      onTap: () async {
                        profilePhotoState.state = await _picker.pickImage(source: ImageSource.gallery);
                        if (profilePhotoState.state != null) {
                          updateProfilePicture(profilePhotoState.state!.path);
                        }
                      },
                      child: SvgPicture.asset(
                        "assets/images/upload_image_icon.svg",width: 62,height: 62,),
                    ),
                  )
                ],
              ),
              Spacer(),
              Text(
                "Edit",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff0000FF),
                        fontWeight: FontWeight.w700,
                        fontSize: 14)),
              ),
              SizedBox(width: 17,)
            ],
          ),
          userModelState.userModel.profilePictureUrl==null?SizedBox.shrink():SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              userModelState.userModel.isBuyer==true && userModelState.userModel.isSeller==false?Text(userModelState.userModel.email!,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ):Text(
                userModelState.userModel.sellerType=="Organization"?"${userModelState.userModel.orgDetailModel!["firstName"]} ${userModelState.userModel.orgDetailModel!["lastName"]}":"${userModelState.userModel.firstName} ${userModelState.userModel.lastName}",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                width: 13.5,
              ),
              userModelState.userModel.available == "Available to work"
                  ? Container(
                width: 13.84,
                height: 13.17,
                decoration: BoxDecoration(
                    color: const Color(0xff08BDFF),
                    shape: BoxShape.circle),
              )
                  : Container(
                width: 13.84,
                height: 13.17,
                decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              )
            ],
          ),
          userModelState.userModel.profilePictureUrl==null?SizedBox.shrink():SizedBox(
            height: 11,
          ),
          userModelState.userModel.ratings==null?SizedBox.shrink():Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatingBar.builder(
                initialRating:  userModelState.userModel.ratings?.serviceOfWorkRatinig==null?0:userModelState.userModel.ratings!.serviceOfWorkRatinig.toDouble(),
                minRating: 1,
                itemSize: 17.68,
                unratedColor: const Color(0xffACACAC),
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: const Color(0xffFFD800),
                ),
                ignoreGestures: true,
                onRatingUpdate: (rating) {

                },
              ),
              SizedBox(
                width: 17.82,
              ),
              Text(
                userModelState.userModel.ratings?.serviceOfWorkRatinig==null?"0":userModelState.userModel.ratings!.serviceOfWorkRatinig.toString(),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              )
            ],
          )
        ],
      );
    }

  }
}

