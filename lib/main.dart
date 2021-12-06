import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/pages/auth_pages/sigup_page/signup_page.dart';
import 'package:halawork/pages/basic_verification_pages/email_verification_success_page.dart';
import 'package:halawork/pages/basic_verification_pages/enter_phone_number_page.dart';
import 'package:halawork/pages/basic_verification_pages/resend_email_verification_link_page.dart';
import 'package:halawork/pages/splash_screen/splash_screen.dart';
import 'package:halawork/providers/state_providers/navigation_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'controllers/auth_controller.dart';
import 'controllers/local_notification_service.dart';
import 'controllers/phone_number_controller.dart';
import 'pages/app_entry_pages/app_entry_main_page.dart';

///Receive message when app is in background solution for on message
Future<void> backgroundHandler(RemoteMessage message) async{
  print("Background: ${message.data.toString()}");
  print("Background: ${message.notification!.title}");
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await dotenv.load(fileName: ".env");
  await PaystackClient.initialize("pk_test_e1b309e4165f444cebce332c49bc7bab45b00f16");
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(ProviderScope(child: MyApp()));
}

Future _connectToFirebaseEmulator()async{
  final String localHostString = 'localhost';

  FirebaseFirestore.instance.settings = Settings(
    host: '$localHostString:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );

  await FirebaseAuth.instance.useAuthEmulator(localHostString,9099);
  FirebaseFunctions.instance.useFunctionsEmulator(localHostString, 5001);
}
final _appRouter = AppRouter();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

class AppEntryPage extends HookWidget{
  const AppEntryPage();
  @override
  Widget build(BuildContext context) {

    useEffect((){
      Future.microtask((){
        LocalNotificationService.initialize(context);

        ///gives you the message on which user taps
        ///and it opened the app from terminated state
        FirebaseMessaging.instance.getInitialMessage().then((message) {
          if(message != null){
            final routeFromMessage = message.data["notificationType"];
            context.read(navigationStateProvider).state = int.parse(routeFromMessage);
            context.router.replaceAll([DashBoardRoute()]);
          }
        });

        ///forground work
        FirebaseMessaging.onMessage.listen((message) {
          if(message.notification != null){
            print(message.notification!.body);
            print(message.notification!.title);
          }

          LocalNotificationService.display(message);
        });

        ///When the app is in background but opened and user taps
        ///on the notification
        FirebaseMessaging.onMessageOpenedApp.listen((message) {
          final routeFromMessage = message.data["notificationType"];
          context.read(navigationStateProvider).state = int.parse(routeFromMessage);
          context.router.replaceAll([DashBoardRoute()]);
        });
      });
      return null;
    },[]);
    final authControllerState = useProvider(authControllerProvider);
    if(authControllerState==null){
      //App Starter Page/Entry Page

      return AppEntryMainPage();
    }else{
      if(authControllerState.emailVerified){


        return CheckPhoneVerificationStateWidgetPage();
      } {
        // Resend Email Verification Link
        return ResendEmailVerificationLinkPage();

      }
    }
  }

}
class CheckPhoneVerificationStateWidgetPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userModelState = useProvider(phoneNumberController);
    if(userModelState!=null){
      if(userModelState.isPhoneNumberVerified!=null){
        if(userModelState.isPhoneNumberVerified!){
          context.router.replaceAll([DashBoardRoute()]);
          return SizedBox.shrink();
        }else{
          return EmailVerificationSuccessPage();
        }
      }else{
        return EnterPhoneNumberPage();
      }
    }else{
      return SplashScreenPage();
    }

  }
}