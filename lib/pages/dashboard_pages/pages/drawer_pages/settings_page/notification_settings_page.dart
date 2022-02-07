import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class NotificationSettingsPage extends HookWidget {
  const NotificationSettingsPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
        elevation: 5,
        title: Text(
          "Notification Settings",
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
        body: ProgressHUD(
          backgroundColor:const Color(0xff0000FF),
          indicatorColor: Colors.white,
          child: Builder(
            builder: (context){
              return Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotificationListTile(labelText: "Buyer request", onSwitched: (isSwitched)async{
                      final progress = ProgressHUD.of(context);
                      progress!.showWithText('Updating Notification...');
                      UserModel userModel = context.read(userModelExtensionController)!.userModel.copyWith(buyerNotification: isSwitched);
                      await context.read(userRepositoryProvider).updateUserModel(context.read(authControllerProvider)!.uid, userModel);
                      progress.dismiss();
                    }, notiType: "buyer"),
                    NotificationListTile(labelText: "Inbox messages", onSwitched: (isSwitched)async{
                      final progress = ProgressHUD.of(context);
                      progress!.showWithText('Updating Notification...');
                      UserModel userModel = context.read(userModelExtensionController)!.userModel.copyWith(inboxNotification: isSwitched);
                      await context.read(userRepositoryProvider).updateUserModel(context.read(authControllerProvider)!.uid, userModel);
                      progress.dismiss();
                    }, notiType: "inbox"),
                    NotificationListTile(labelText: "Order messages", onSwitched: (isSwitched)async{
                      final progress = ProgressHUD.of(context);
                      progress!.showWithText('Updating Notification...');
                      UserModel userModel = context.read(userModelExtensionController)!.userModel.copyWith(orderNotification: isSwitched);
                      await context.read(userRepositoryProvider).updateUserModel(context.read(authControllerProvider)!.uid,userModel );
                      progress.dismiss();
                    }, notiType: "order")
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
class NotificationListTile extends HookWidget {
  final String labelText,notiType;
  final Function(bool isSwitch) onSwitched;
  const NotificationListTile({required this.labelText,required this.onSwitched,required this.notiType});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: const Color(0xffE6E6E6),width: 1)
          )
      ),
      padding: EdgeInsets.only(top: 30,bottom: 30,left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(labelText,style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: const Color(0xff29283C),
              fontSize: 14,
            )
          ),),
          SwitcherWidget(onSwitched: (bool isSwitched) {
            onSwitched(isSwitched);
          }, notiType: notiType,)
        ],
      ),
    );
  }
}
class SwitcherWidget extends HookWidget {
  final String notiType;
  final Function(bool isSwitched) onSwitched;
  const SwitcherWidget({required this.notiType,required this.onSwitched});

  @override
  Widget build(BuildContext context) {
    var userModelState = useProvider(userModelExtensionController);
    if(notiType=="buyer"){
      return  Switch(
        value: userModelState!.userModel.buyerNotification,
        onChanged: (value) async{
          onSwitched(value);
        },
        activeTrackColor: const Color(0xffE6E6E6),
        activeColor: const Color(0xff5A5AFC),
      );
    }else if(notiType=="inbox"){
      return  Switch(
        value: userModelState!.userModel.inboxNotification,
        onChanged: (value) async{
          onSwitched(value);
        },
        activeTrackColor: const Color(0xffE6E6E6),
        activeColor: const Color(0xff5A5AFC),
      );
    }else{
      return  Switch(
        value: userModelState!.userModel.orderNotification,
        onChanged: (value) async{
          onSwitched(value);
        },
        activeTrackColor: const Color(0xffE6E6E6),
        activeColor: const Color(0xff5A5AFC),
      );
    }
  }
}


