import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/skill_chip_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SkillsSection extends HookWidget{
  final bool isProfileView;
  final UserModel? userModel;
  const SkillsSection({required this.userModel,required this.isProfileView});
  @override
  Widget build(BuildContext context) {
    if(isProfileView){
      return userModel==null?SliverToBoxAdapter(child: Text("Seller has not added any skill yet")):
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 17),
        sliver: SliverGrid.count(
          crossAxisSpacing: 0,
          crossAxisCount: 3,
          childAspectRatio: 3 / 1,
          mainAxisSpacing: 0,
          children:getSkillsItems(skills:userModel!.skills!),
        ),
      );
    }else{
      var userModelState = useProvider(userModelExtensionController);
      return userModelState==null?SliverToBoxAdapter(child: Text("Please add some skills, to better showcase your work")):
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 17),
        sliver: SliverGrid.count(
          crossAxisSpacing: 0,
          crossAxisCount: 3,
          childAspectRatio: 3 / 1,
          mainAxisSpacing: 0,
          children:getSkillsItems(skills:userModelState.userModel.skills!),
        ),
      );
    }
  }
  List<Widget>getSkillsItems({required List<String> skills}){
    return skills.map((e) => SkillItemChip(name: e)).toList();
  }
}


