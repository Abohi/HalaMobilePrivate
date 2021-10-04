import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/pages/dashboard_pages/widget/expandable_textview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class NotificationDetailPage extends HookWidget {
  final String requestId;
  const NotificationDetailPage({required this.requestId});

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
        body: FutureBuilder<CreateRequestModel?>(
          future: context.read(userControllerProvider.notifier).getRequest(requestId),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Container(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${ snapshot.data!.title}",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: const Color(0xff555555),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 64,
                                height: 19,
                                decoration: BoxDecoration(
                                    color: snapshot.data!.requestStatus==true?const Color(0xff11DD00):Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "${snapshot.data!.requestStatus==true?'Active':'CLOSED'}",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.budget,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff555555),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Budget",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff7C7C7C),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.state,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff555555),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "State",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff7C7C7C),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.date,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff555555),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Date",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff7C7C7C),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Consumer(builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
                      var firstHalfState = watch(firstHalfStateProvider).state;
                      var secondHalfState = watch(secondHalfStateProvider).state;
                      if(snapshot.data!.description.length>200){
                        firstHalfState = snapshot.data!.description.substring(0, 200);
                        secondHalfState = snapshot.data!.description.substring(200, snapshot.data!.description.length);
                      }else{
                        firstHalfState=snapshot.data!.description;
                        secondHalfState = "";
                      }
                      return  ExpandableTextView(
                          textColor: const Color(0xff7C7C7C),
                          textSize: 14);
                    },),
                  ],
                ),
              );
            }
            else if(snapshot.connectionState==ConnectionState.waiting){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
                ],
              );
            }
            else{
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
