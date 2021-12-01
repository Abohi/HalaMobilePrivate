import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/history_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
class EducationSection extends HookWidget {
  final bool isProfileView;
  final UserModelExtension? userModel;
  const EducationSection({required this.userModel,required this.isProfileView});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if(isProfileView){


      return userModel==null?SliverToBoxAdapter(
        child: Text(""),
      ):SliverList(delegate: SliverChildListDelegate(
          userModel!.educationModels!.map((e) => HistoryTile(title:e.schoolName!, description:"${DateFormat.yMMMMd('en_US').format(e.dateAttended!)}-${DateFormat.yMMMMd('en_US').format(e.dateEnded!)}",)).toList()
      ));
    }else{
      var userModelState = useProvider(userControllerProvider);
      return userModelState==null?SliverToBoxAdapter(
        child: Text(""),
      ):SliverList(delegate: SliverChildListDelegate(
          userModelState.educationModels!.map((e) => HistoryTile(title:e.schoolName!, description:"${DateFormat.yMMMMd('en_US').format(e.dateAttended!)}-${DateFormat.yMMMMd('en_US').format(e.dateEnded!)}",)).toList()
      ));
    }
  }
}