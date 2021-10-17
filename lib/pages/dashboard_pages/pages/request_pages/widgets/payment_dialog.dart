import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/widgets/payment_dialog_btn.dart';

class PayLaterDialog extends StatelessWidget {
  final String orderId;
  const PayLaterDialog({required this.orderId});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: WillPopScope(
        onWillPop: ()async{
          Navigator.pop(context);
          return true;
        },
        child: Container(
          width: width,
          height: height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: width,
                height: height*0.08,
                color: const Color(0xff0000FF),
                child: Center(child: Text("Payment for Order with ID: ${orderId}",style: GoogleFonts.roboto(textStyle:TextStyle(fontSize: 18,color:Colors.white,fontWeight: FontWeight.w700)),),),
              ),
              SizedBox(
                height: height*0.1,
              ),
              SizedBox(
                height: height*0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10,),
                    Expanded(
                      child: CustomButtonOutLine(buttonLabel: "PayLater",onButtonPressed: (){
                        Navigator.pop(context,false);
                      },),
                    ),
                    SizedBox(width: 30,),
                    Expanded(
                      child: CustomButtonFilled(buttonLabel: "PayNow",onButtonPressed: (){
                        Navigator.pop(context,true);
                      },),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}