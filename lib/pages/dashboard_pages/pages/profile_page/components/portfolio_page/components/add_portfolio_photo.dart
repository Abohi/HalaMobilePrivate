import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/models/profile_models/portfolio_model.dart';
import 'package:halawork/repositories/auth_repository.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_route/auto_route.dart';
final portfolioStateProvider = StateProvider<XFile?>((ref){
  return  null;
});
class AddPortfolioPhotoPage extends HookWidget {
  final List<String>skills;
  final String projectName;
  const AddPortfolioPhotoPage({required this.skills,required this.projectName});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var porfolioPhotoState = useProvider(portfolioStateProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          backgroundColor: const Color(0xff0000FF),
          indicatorColor:Colors.white,
          child: Builder(
            builder: (context){
              return Container(
                width: size.width,
                height: size.height,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      elevation: 5,
                      title: Text(
                        "Create A Portfolio",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff3E3E3E),
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ),
                      centerTitle: true,
                      pinned: true,
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
                    const SliverToBoxAdapter(child: const SizedBox(height: 37,)),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      sliver: SliverToBoxAdapter(
                        child: Text("Please upload Pictures",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14,fontWeight: FontWeight.normal)),),
                      ),
                    ),
                    const SliverToBoxAdapter(child: const SizedBox(height: 37,)),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal:17.0),
                      sliver: SliverToBoxAdapter(
                        child: const PhotoArea(),
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height:size.height*0.13,)),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      sliver: SliverToBoxAdapter(
                        child: CustomButtonSignup(
                          buttonBg: const Color(0xff0000FF),
                          buttonTitle: "FINISH",
                          buttonFontColor: Colors.white,
                          isFullWidth: true,
                          onButtonPressed: () async{
                            if(porfolioPhotoState.state!.path.isEmpty){
                              await Fluttertoast.showToast(msg: "Please select a picture",toastLength: Toast.LENGTH_LONG);
                              return;
                            }
                            final progress = ProgressHUD.of(context);
                            progress!.showWithText('Adding Portfolio...');
                            await context.read(userRepositoryProvider).uploadPortfolio(PortfolioModel(photoUrl: porfolioPhotoState.state!.path,project_name: projectName,skills: skills), context.read(authControllerProvider)!.uid);
                            progress.dismiss();
                            await Fluttertoast.showToast(msg: "Portfolio updated successfully",toastLength: Toast.LENGTH_LONG);
                            context.popRoute();
                          }, imageIcon: null,),
                      ),
                    ),
                    const SliverToBoxAdapter(child: const SizedBox(height: 20,)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PhotoArea extends HookWidget {
  const PhotoArea();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var porfolioPhotoState = useProvider(portfolioStateProvider);
    var _picker =   useMemoized(()=>ImagePicker());
    return Container(
      width: size.width,
      height: size.height*0.45,
      decoration: BoxDecoration(
          color: const Color(0xffEBEBFF),
          borderRadius: BorderRadius.circular(4)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 29),

      child: Container(
        child: DottedBorder(
          borderType: BorderType.RRect,
            radius: const Radius.circular(24),
          color: const Color(0xff0000FF),
          strokeWidth: 1.0,
          dashPattern: const [5, 5],
          child:porfolioPhotoState.state==null?GestureDetector(
            onTap: ()async{
              porfolioPhotoState.state = await _picker.pickImage(source: ImageSource.gallery);
            },
            child: Center(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                child: Center(
                  child: Icon(Icons.photo,color: const Color(0xff5A5AFC),),
                ),
              ),
            ),
          ):GestureDetector(
            onTap: ()async{
              porfolioPhotoState.state = await _picker.pickImage(source: ImageSource.gallery);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(image: DecorationImage(image: FileImage(File(porfolioPhotoState.state!.path))),
            ),
          ),
        ),
      ),
    ));
  }
}





