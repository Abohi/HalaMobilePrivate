
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/pages/auth_pages/login_widget/custom_login_divider.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/achievement_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/description_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/education_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/portfolio_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/profile_photo_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/profile_presence_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/service_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/skills_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/subservice_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/work_section.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/ToggleAsSeller.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/custom_sliver_divider.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/custom_sliverheader.dart';
import 'package:halawork/utils/presenceResponsiveHeight.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class ProfilePage extends HookWidget{
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    var userModelState = useProvider(userControllerProvider);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(
            "Profile",
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
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
           SliverList(
             delegate: SliverChildListDelegate([
               Container(
                 padding: EdgeInsets.only(left: 17,right:17),
                 width: size.width,
                 color: const Color(0xffEBEBFF),
                 child: ProfilePhotoSection(isProfileView: false, userModel: null,),
               ),
               Container(
                 padding: EdgeInsets.only(left: 17,right:17,bottom: 44),
                 width: size.width,
                 color: const Color(0xffEBEBFF),
                 child: const ProfilePresenceSection(userModel: null, isProfileView: false,),
               )
             ]),
           ),
            SliverFillRemaining(
                child:Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.06,0.01],
                      colors: [Color(0xffEBEBFF), Colors.white],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17,right:17,top: 40),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(child: const DescriptionSection(isProfileView: false, userModel: null,)),
                            const ServiceSection(isProfileView: false, userModel: null,),
                            userModelState!.userModel.subServices==null ||userModelState.userModel.subServices!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):SubServiceSection(userModel: null, isProfileView: false,),
                            userModelState.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverHeader(leftHeadTitle: "Skills", rightHeaderTitle: "EDIT", voidButtonPressed: (){
                              context.router.navigate(EditSkillRoute());
                            }),
                            userModelState.userModel.skills==null ||userModelState.userModel.skills!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()): SkillsSection(userModel: null, isProfileView: false,),
                            userModelState.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()): CustomSliverDivider(),
                           PortFolioSection(isProfileView: false, userModel: null,),
                            userModelState.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverDivider(),
                            userModelState.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverHeader(leftHeadTitle: "Work History", rightHeaderTitle: "ADD", voidButtonPressed: (){
                            }),
                            userModelState.workEntrieModels==null ||userModelState.workEntrieModels!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()): WorkSection(isProfileView: false, userModel: null,),
                            userModelState.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverDivider(),
                            userModelState.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverHeader(leftHeadTitle: "Achievement", rightHeaderTitle: "ADD", voidButtonPressed: (){
                            }),
                            userModelState.achievementModels==null ||userModelState.achievementModels!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):AchievementSection(userModel: null, isProfileView: false,),
                            userModelState.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverDivider(),
                            userModelState.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverHeader(leftHeadTitle: "Education", rightHeaderTitle: "ADD", voidButtonPressed: (){
                            }),
                            userModelState.educationModels==null ||userModelState.educationModels!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):
                          EducationSection(isProfileView: false, userModel: null,)
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child:ToggleAsSeller(isProfileView: false, userModel: null,),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
// CustomSliverDivider(),

