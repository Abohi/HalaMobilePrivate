import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/providers/state_providers/navigation_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/in_app_notification"));

    _notificationsPlugin.initialize(initializationSettings,onSelectNotification: (String? route) async{
      if(route != null){
        context.read(navigationStateProvider).state = int.parse(route);
        context.router.replaceAll([DashBoardRoute()]);
      }
    });

  }

  static void display(RemoteMessage message) async {

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/1000;

      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "halawork",
          "halawork channel",
          "this is our channel",
          importance: Importance.max,
          priority: Priority.high,
        )
      );


      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["notificationType"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
