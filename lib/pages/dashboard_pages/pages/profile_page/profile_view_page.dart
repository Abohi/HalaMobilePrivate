import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
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
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
final userModelStreamProvider = StreamProvider.autoDispose.family<UserModelExtension,String>((ref,id) {
  return ref.read(userRepositoryProvider).getUserModelExtension(id);
});
class ProfileViewPage extends HookWidget {
  final String userId;
  const ProfileViewPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    useEffect((){
      Future.microtask(()async{
        await context.read(userRepositoryProvider).recentlyVisitedProfiles(userId);
      });
      return null;
    },[userId]);

    var size = MediaQuery.of(context).size;
    final userModelStream = useProvider(userModelStreamProvider(userId));
    return userModelStream.when(data: (data){
      return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(
            data.userModel.sellerType=="Organization"?
            "${data.userModel.orgDetailModel!["firstName"]} ${data.userModel.orgDetailModel!["lastName"]}":
            "${data.userModel.firstName} ${data.userModel.lastName}",
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
        body: Container(
          width: size.width,
          height: size.height,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    padding: EdgeInsets.only(left: 17,right:17),
                    width: size.width,
                    color: const Color(0xffEBEBFF),
                    child: ProfilePhotoSection(isProfileView: true, userModel: data.userModel, updateProfilePicture: (){

                    },),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17,right:17,bottom: 44),
                    width: size.width,
                    color: const Color(0xffEBEBFF),
                    child: ProfilePresenceSection(userModel: data, isProfileView: true, updateNationalAvailability: (bool isVisibility) {  },),
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
                              SliverToBoxAdapter(child: DescriptionSection(userModel: data.userModel, isProfileView: true,)),
                               ServiceSection(userModel: data.userModel,isProfileView:true),
                              data.userModel.subServices==null ||data.userModel.subServices!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()): SubServiceSection(userModel: data.userModel, isProfileView: true,),
                              data.userModel.skills==null ||data.userModel.skills!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):SkillsSection(userModel: data.userModel, isProfileView: true,),
                              data.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()): CustomSliverDivider(),
                              PortFolioSection(isProfileView: true, userModel: data,),
                              data.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverDivider(),

                              data.workEntrieModels==null ||data.workEntrieModels!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):WorkSection(userModel: data, isProfileView: true,),
                              data.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverDivider(),
                              data.achievementModels==null ||data.achievementModels!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):AchievementSection(userModel: data, isProfileView: true,),
                              data.userModel.isBuyer?SliverToBoxAdapter(child: SizedBox.shrink()):CustomSliverDivider(),
                              data.educationModels==null ||data.educationModels!.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):
                              EducationSection(userModel: data, isProfileView: true,)
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child:ToggleAsSeller(userModel: data.userModel, isProfileView: true,),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      );
    }, loading: (){
      return Scaffold(
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
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
            ],
          ),
        ),
      );
    }, error:(object,stacktrace){
      return Scaffold(
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
        body: Container(
          width: size.width,
          height: size.height,
          child: Center(
            child: Text(stacktrace.toString()),
          ),
        ),
      );
    });

  }
}
