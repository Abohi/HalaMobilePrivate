import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CountDownTimerPayment extends HookWidget {

  final int endTime;
  const CountDownTimerPayment({required this.endTime});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final countDownController = useMemoized(() => CountdownTimerController(endTime:endTime, onEnd: ()async{
      await Fluttertoast.showToast(msg: "Order delivery time has expired",toastLength: Toast.LENGTH_LONG);
    }));
    print("Time ${endTime}");
    return CountdownTimer(
      controller: countDownController,
      widgetBuilder: (BuildContext context,CurrentRemainingTime? time){
        if(time!=null){
          return Container(
            width: size.width,
            height: size.height*0.1,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: const Color(0xffF8F8F8),borderRadius: BorderRadius.circular(36),border: Border.all(color: const Color(0xffC7C7C7))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${time.days??"0"}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: const Color(0xff0000FF))),),
                        SizedBox(height: 8,),
                        Text("days",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff7C7C7C))),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${time.hours??"0"}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: const Color(0xff0000FF))),),
                        SizedBox(height: 8,),
                        Text("hours",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff7C7C7C))),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${time.min??"0"}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: const Color(0xff0000FF))),),
                        SizedBox(height: 8,),
                        Text("minutes",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff7C7C7C))),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${time.sec??"0"}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: const Color(0xff0000FF))),),
                        SizedBox(height: 8,),
                        Text("seconds",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff7C7C7C))),),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        }
        return Container(
          width: size.width,
          height: size.height*0.1,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: const Color(0xffF8F8F8),borderRadius: BorderRadius.circular(36),border: Border.all(color: const Color(0xffC7C7C7))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("0",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: const Color(0xff0000FF))),),
                      SizedBox(height: 8,),
                      Text("days",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff7C7C7C))),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("0",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: const Color(0xff0000FF))),),
                      SizedBox(height: 8,),
                      Text("hours",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff7C7C7C))),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("0",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: const Color(0xff0000FF))),),
                      SizedBox(height: 8,),
                      Text("minutes",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff7C7C7C))),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("00",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: const Color(0xff0000FF))),),
                      SizedBox(height: 8,),
                      Text("seconds",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff7C7C7C))),),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}