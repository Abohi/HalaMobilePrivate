import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/providers/state_providers/seller_setup_provider.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
final profilePictureStateProvider = StateProvider<XFile?>((ref){
  return  null;
});

class ProfilePictureEntryPage extends HookWidget {
  ProfilePictureEntryPage();
  late ImagePicker _picker;
  @override
  Widget build(BuildContext context) {
    useEffect((){
      _picker =   ImagePicker();
      return null;
    },[]);
    var profilePictureState = useProvider(profilePictureStateProvider);
    var size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
    appBar:  AppBar(
      elevation: 0,
      title: context.read(sellerSetupStateProvider).state!.sellerType=="Organization"?Text(
        "Profile Setup",
        style: GoogleFonts.josefinSans(
            textStyle: TextStyle(
                color: const Color(0xff3E3E3E),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ):Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text(
            "Profile Setup",
            style: GoogleFonts.josefinSans(
                textStyle: TextStyle(
                    color: const Color(0xff3E3E3E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Spacer(),
          Text(
            "9/10",
            style: GoogleFonts.josefinSans(
                textStyle: TextStyle(
                    color: const Color(0xff29283C),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
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
        body: Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text(
            "Add a profile picture",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: const Color(0xff3E3E3E),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: 30,),
          // ToggleButtons(
          //   borderColor: const Color(0xffE5C242),
          //   fillColor: const Color(0xffE5C242),
          //   borderWidth: 2,
          //   selectedBorderColor: const Color(0xffE5C242),
          //   borderRadius: BorderRadius.circular(0),
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text(
          //         'Camera',
          //         style: TextStyle(fontSize: 16,color:const Color(0xff0000FF) ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text(
          //         'Gallary',
          //         style: TextStyle(fontSize: 16,color:const Color(0xff0000FF)),
          //       ),
          //     ),
          //   ],
          //   onPressed: (int index) {
          //     for (int i = 0; i < cameraChooserState.value.length; i++) {
          //
          //       cameraChooserState.value[i]= i== index;
          //
          //     }
          //   },
          //   isSelected: cameraChooserState.value,
          // ),
          SizedBox(height: 66,),
          profilePictureState.state == null?Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle,color: const Color(0xff9393FF)),
                  width: size.width*0.5,
                  height: size.width*0.5,
                ),
                Positioned(
                  left: -(size.width * 0.02),
                  top: size.height * 0.01,
                  child: GestureDetector(
                    onTap: ()async{
                      profilePictureState.state = await _picker.pickImage(source: ImageSource.gallery);
                    },
                    child: SizedBox(
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        child: SvgPicture.asset(
                            "assets/images/upload_image_icon.svg")),
                  ),
                )
              ],
            ),
          ):Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: size.width * 0.3,
                  backgroundImage: FileImage(File(profilePictureState.state!.path)),
                ),
                Positioned(
                  left: -(size.width * 0.02),
                  top: size.height * 0.01,
                  child: GestureDetector(
                    onTap: ()async{
                      profilePictureState.state = await _picker.pickImage(source: ImageSource.gallery);
                    },
                    child: SizedBox(
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        child: SvgPicture.asset(
                            "assets/images/upload_image_icon.svg")),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 66,),
          GestureDetector(
            onTap: (){
              if(context.read(sellerSetupStateProvider).state!.sellerType=="Organization"){
                context.router.navigate(AddLocationOrganizationEntryRoute());
              }else{
                context.router.navigate(LocationEntryRoute());
              }
            },
            child: Center(child: Text("SKIP FOR NOW",style:
            GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: const Color(0xff0000FF)))),),
          ),
          SizedBox(height: 28,),
          CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "NEXT  >", buttonFontColor: Colors.white, onButtonPressed: (){
            context.read(sellerSetupStateProvider).state = context.read(sellerSetupStateProvider).state!.copyWith(saveProfilePhoto: context.read(profilePictureStateProvider).state!.path);
            if(context.read(sellerSetupStateProvider).state!.sellerType=="Organization"){
              context.router.navigate(AddLocationOrganizationEntryRoute());
            }else{
              context.router.navigate(LocationEntryRoute());
            }

          }, imageIcon: null,),
        ],
      ),
    )));
  }
}
