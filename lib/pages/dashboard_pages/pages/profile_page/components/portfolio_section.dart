import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/profile_models/portfolio_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/skill_chip_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class PortFolioSection extends HookWidget {
  final bool isProfileView;
  final UserModelExtension? userModel;
  const PortFolioSection({required this.userModel,required this.isProfileView});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if(isProfileView){
      return userModel==null?SliverToBoxAdapter(
        child: Text(""),
      ):
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            userModel!.userModel.isBuyer?SizedBox.shrink():Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Portfolio",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            userModel!.portfolios!.isEmpty?Text(""):SizedBox(
              height: 24,
            ),
            userModel!.portfolios!.isEmpty?Text(""): Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom:
                      BorderSide(color: const Color(0xffACACAC), width: 1))),
              width: size.width,
              child:userModel!.portfolios!.isEmpty?Text(""):ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children:userModel!.portfolios!.map((e) => PortfolioItems(
                    portfolioModel: e,)).toList()
              ),
            )
          ],
        ),
      );
    }else{
      var userModelState = useProvider(userControllerProvider);
      return userModelState==null?SliverToBoxAdapter(
        child: Text(""),
      ):
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            userModelState.userModel.isBuyer?SizedBox.shrink():Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Portfolio",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
                GestureDetector(
                  onTap: (){
                      context.router.navigate(AddPortfolioDescriptionRoute());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "ADD",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: const Color(0xff0000FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              ],
            ),
            userModelState.portfolios!.isEmpty?Text(""):SizedBox(
              height: 24,
            ),
            userModelState.portfolios!.isEmpty?Text(""): Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom:
                      BorderSide(color: const Color(0xffACACAC), width: 1))),
              width: size.width,
              child: userModelState.portfolios!.isEmpty?Text(""):ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children:userModelState.portfolios!.map((e) => PortfolioItems(
                    portfolioModel: e,)).toList()
              ),
            )
          ],
        ),
      );
    }

  }
}

class PortfolioItems extends StatelessWidget {
  final PortfolioModel portfolioModel;

  const PortfolioItems({required this.portfolioModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      margin: EdgeInsets.only(right: size.width * 0.10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size.width,
            color: const Color(0xffF8F8F8),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18, top: 15, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    portfolioModel.project_name!,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff29283C),
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(Icons.edit,
                              color: const Color(0xff5A5AFC), size: 12),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.delete,
                            color: const Color(0xff5A5AFC),
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  )
                ],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height*0.06),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: getSkillsItems(skills:portfolioModel.skills!),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              height: size.height * 0.35,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(portfolioModel.photoUrl!),fit: BoxFit.fill)),
            ),
          )
        ],
      ),
    );
  }

  List<Widget>getSkillsItems({required List<String> skills}){
    return skills.map((e) => SkillItemChip(name: e)).toList();
  }
}