import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/description_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class DescriptionSection extends HookWidget {
  final bool isProfileView;
  final UserModel? userModel;
  const DescriptionSection({required this.isProfileView,required this.userModel});

  @override
  Widget build(BuildContext context) {
    if(isProfileView){
      var size = MediaQuery.of(context).size;
      return userModel==null?Text(""):
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.06,
          ),
          userModel!.isBuyer?SizedBox.shrink():Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text("${userModel!.profileDescriptionTitle??""}",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14,fontWeight: FontWeight.w700)),),
          const SizedBox(height: 15,),
          DescriptionTextWidget(
            textColor: const Color(0xff29283C),
            textSize: 14,
          ),
          SizedBox(
            height: 40.5,
          ),
          Container(
            width: size.width,
            height: 1,
            color: const Color(0xffACACAC),
          ),
          SizedBox(
            height: 16.5,
          ),
        ],
      );
    }else{
      var size = MediaQuery.of(context).size;
      var userModelState = useProvider(userModelExtensionController);
      return userModelState==null?Text(""):
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.06,
          ),
          userModelState.userModel.isBuyer?SizedBox.shrink():Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Description",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if(userModelState.userModel.sellerType=="Organization"){
                        context.router.navigate(EditOrganizationDescritionRoute());
                      }else{
                        context.router.navigate(EditIndividualDescriptionRoute());
                      }
                    },
                    child: Text(
                      "EDIT",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: const Color(0xff0000FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text("${userModelState.userModel.profileDescriptionTitle??""}",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14,fontWeight: FontWeight.w700)),),
          const SizedBox(height: 15,),
          userModelState.userModel.profileDescription==null?SizedBox.shrink():DescriptionTextWidget(
            textColor: const Color(0xff29283C),
            textSize: 14,
          ),
          userModelState.userModel.profileDescriptionTitle==null?SizedBox.shrink():SizedBox(
            height: 40.5,
          ),
          userModelState.userModel.profileDescriptionTitle==null?SizedBox.shrink():Container(
            width: size.width,
            height: 1,
            color: const Color(0xffACACAC),
          ),
          userModelState.userModel.profileDescriptionTitle==null?SizedBox.shrink():SizedBox(
            height: 16.5,
          ),
        ],
      );
    }

  }
}
