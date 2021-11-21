import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:intl/intl.dart' show DateFormat;
class NotificationItems extends StatelessWidget {
  final NotificationModel notificationModel;
  final Function onButtonPressed;
  const NotificationItems({required this.notificationModel,required this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width,
        height: size.height*0.2,
        decoration: BoxDecoration(color:notificationModel.isOpen?Colors.white:const Color(0xffEBEBFF),border: Border(bottom: BorderSide(color: const Color(0xffACACAC),width: 0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(notificationModel.createdAt==null?"":DateFormat.yMMMd().format(notificationModel.createdAt!),style: GoogleFonts.roboto(textStyle: TextStyle(color:notificationModel.isOpen?const Color(0xff7C7C7C):Colors.white,fontSize: 16,fontWeight: FontWeight.w700)),),
            SizedBox(height: 19,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(notificationModel.createdAt==null?"":DateFormat.yMMMd().format(notificationModel.createdAt!),style: GoogleFonts.roboto(textStyle: TextStyle(color:notificationModel.isOpen?const Color(0xffACACAC):Colors.white,fontSize: 16,fontWeight: FontWeight.normal)),),
                IconButton(icon: Icon(Icons.clear,color: notificationModel.isOpen?Colors.black:const Color(0xff5a5afc),size: 18,),onPressed: ()async{

                },)
              ],
            ),
            SizedBox(height: 8,),
            Text(notificationModel.title,style: GoogleFonts.roboto(textStyle: TextStyle(color:notificationModel.isOpen?Colors.black:const Color(0xff5a5afc),fontSize: 14,fontWeight: FontWeight.normal)),),
          ],
        ),
      ),
    );
  }
}