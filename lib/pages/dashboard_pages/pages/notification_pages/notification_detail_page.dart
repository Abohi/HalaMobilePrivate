import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class NotificationDetailPage extends HookWidget {
  final NotificationModel notificationModel;
  const NotificationDetailPage({required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          elevation: 5,
          title: Text(
            "Alert",
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
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "${notificationModel.title}",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff555555),
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ),
              Text(
                "${notificationModel.body}",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff555555),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
