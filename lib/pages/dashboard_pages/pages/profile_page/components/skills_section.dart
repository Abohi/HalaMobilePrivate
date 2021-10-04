import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/skill_chip_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SkillsSection extends HookWidget{
  const SkillsSection();
  @override
  Widget build(BuildContext context) {
    var userModelState = useProvider(userControllerProvider);
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
  List<Widget>getSkillsItems({required List<String> skills}){
    return skills.map((e) => SkillItemChip(name: e)).toList();
  }
}


