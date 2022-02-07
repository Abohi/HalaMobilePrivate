import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page/widgets/settings_item_card.dart';
import 'package:auto_route/auto_route.dart';
class SettingsPage extends HookWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(
            "Settings",
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
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsItemCard(labelText: "Notification", onButtonPressed: (){
                  context.router.navigate(NotificationSettingsRoute());
              },),
              SettingsItemCard(labelText: "Security", onButtonPressed: (){
                context.router.navigate(SecurityRoute());
              },),
              SettingsItemCard(labelText: "Terms of service", onButtonPressed: (){

              },),
            ],
          ),
        ),
      ),
    );
  }
}
