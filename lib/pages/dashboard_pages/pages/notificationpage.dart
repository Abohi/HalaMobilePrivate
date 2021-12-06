import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/pages/dashboard_pages/widget/notification_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class NotificationPage extends HookWidget {
  const NotificationPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ProgressHUD(
      backgroundColor:const Color(0xff0000FF),
      indicatorColor: Colors.white,
      child: Builder(
        builder: (context){
          return Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(top: 20),
            color:Colors.white ,
            child:StreamBuilder<List<NotificationModel>>(
              stream: context.read(userModelExtensionController.notifier).getNotifications(context.read(authControllerProvider)!.uid),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  if(snapshot.data!.length==0){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No Notification Available")
                      ],
                    );
                  }
                  return ListView(
                    children: snapshot.data!.map((e) => NotificationItems(notificationModel: e, onButtonPressed: ()async{
                      final progress = ProgressHUD.of(context);
                      progress!.showWithText('Opening Notification...');
                      await context.read(userModelExtensionController.notifier).updateNotification(context.read(authControllerProvider)!.uid, e);
                      progress.dismiss();
                      context.router.navigate(NotificationDetailRoute(notificationModel: e));
                    },)).toList(),
                  );
                }else if(snapshot.connectionState==ConnectionState.waiting){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
                    ],
                  );
                }else{
                  return SizedBox.shrink();
                }
              },
            ) ,
          );
        },
      ),
    );
  }
}