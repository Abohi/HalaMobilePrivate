import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/widgets/history_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
class WorkSection extends HookWidget {
  const WorkSection();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userControllerProvider);
    return userModelState==null?SliverToBoxAdapter(
      child: Text(""),
    ):SliverList(delegate: SliverChildListDelegate(
        userModelState.workEntrieModels!.map((e) => HistoryTile(title:"${e.positionHeld}|${e.companyName}", description:"${DateFormat.yMMMMd('en_US').format(e.dateWorkedFrom!)} - ${DateFormat.yMMMMd('en_US').format(e.dateResigned!)}",)).toList()
    ));
  }
}