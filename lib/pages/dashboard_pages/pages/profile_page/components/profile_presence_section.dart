//Sellers/Buyers Location and business information
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/addlocation_organization_entry_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;


class ProfilePresenceSection extends HookWidget {
  final bool isProfileView;
  final UserModelExtension? userModel;
  const ProfilePresenceSection({required this.isProfileView,required this.userModel});

  @override
  Widget build(BuildContext context) {
    if(isProfileView){
      return userModel==null?Text(""):
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 43.32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Location",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              Text(
                "${userModel!.locationModel![0].state},Nigeria",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          userModel!.locationModel!.length>1?Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Other branch location",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              GestureDetector(
                onTap: (){
                  modalBottomSheetMenu(context:context, locationList: userModel!.locationModel!);
                },
                child: Text(
                  "VIEW",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff0000FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ),
              )
            ],
          ):SizedBox.shrink(),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Member since",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              Text(
                DateFormat("yyyy-MM-dd").format(userModel!.userModel.joined!),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Availability",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              Text(
                userModel!.userModel.available!,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Toggle Nationwide availability",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              Switch(
                value: false,
                onChanged: (value) async{

                },
                activeTrackColor: Colors.white,
                activeColor: const Color(0xff5A5AFC),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              "${userModel!.userModel.completedOrders} Jobs completed",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: const Color(0xff29283C),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          SizedBox(
            height: 28,
          ),
        ],
      );
    }else{
      var userModelState = useProvider(userControllerProvider);
      return userModelState==null?Text(""):
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 43.32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Location",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              Text(
                "${userModelState.locationModel![0].state},Nigeria",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          userModelState.locationModel!.length>1?Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Other branch location",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              GestureDetector(
                onTap: (){
                  modalBottomSheetMenu(context:context, locationList: userModelState.locationModel!);
                },
                child: Text(
                  "VIEW",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff0000FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ),
              )
            ],
          ):SizedBox.shrink(),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Member since",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              Text(
                DateFormat("yyyy-MM-dd").format(userModelState.userModel.joined!),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Availability",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              Text(
                userModelState.userModel.available!,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Toggle Nationwide availability",
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(color: const Color(0xff29283C), fontSize: 12)),
              ),
              Switch(
                value: false,
                onChanged: (value) async{

                },
                activeTrackColor: Colors.white,
                activeColor: const Color(0xff5A5AFC),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              "${userModelState.userModel.completedOrders} Jobs completed",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: const Color(0xff29283C),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          SizedBox(
            height: 28,
          ),
        ],
      );
    }
  }
  void modalBottomSheetMenu({required BuildContext context,required List<LocationModel> locationList}){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        builder: (builder){
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          return Container(
            width: width,
            height: height*0.45,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: ListView(
              children: locationList.map((e) => LocationItem(streetAddress: e.streetAddress, state: e.state, localGovt: e.localGovt, onButtonPressed: (){

              })).toList(),
            ),
          );
        }
    );
  }
}
