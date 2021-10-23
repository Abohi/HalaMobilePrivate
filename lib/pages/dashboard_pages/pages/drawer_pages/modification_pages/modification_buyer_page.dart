import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/firebase_reference_extension/firebase_firestore_extension.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/providers/general_providers/general_providers.dart';
import 'package:halawork/repositories/order_repository.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/utils/decimal_formatter.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModificationBuyerPage extends HookWidget {
  final OrderModel orderModel;
  const ModificationBuyerPage({required this.orderModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var modifiationTextController = useTextEditingController();
    var budgetController = useTextEditingController();
    var durationDate = useState<DateTime?>(null);
    return Scaffold(
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
              child: ListView(
                children: [
                  Text("For all modification raised, a one day interval is given for the Seller, to either raise a dispute regarding modification, or accept the modification",style:
                  GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff29283C),
                          fontSize: 14)),),
                  const SizedBox(height: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: Container(
                          width: size.width,
                          height: size.height * 0.3,
                          child: TextField(
                            autofocus: false,
                            maxLines: 300,
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.top,
                            controller:modifiationTextController,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: const Color(0xff29283C), fontSize: 10)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Reason For Modification",
                              labelStyle: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff29283C),
                                      fontSize: 14)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff0000FF), width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffACACAC), width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Spacer(),
                          Text("maximum of 250-300 words",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff29283C),
                                      fontSize: 10))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Theme(
                        data:
                        Theme.of(context).copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          controller: budgetController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [DecimalFormatter()],
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: const Color(0xff29283C), fontSize: 10)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Enter Tip or Added Amount",
                            labelStyle: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: const Color(0xff29283C), fontSize: 14)),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: const Color(0xff0000FF), width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: const Color(0xffACACAC), width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Spacer(),
                          Text("An Additional Amount/Tip for Seller (Optional)",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff29283C),
                                      fontSize: 10))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Theme(
                        data: ThemeData.light().copyWith(splashColor: Colors.transparent,//selection color
                        ),
                        child: DateTimeField(
                          format: DateFormat("yyyy-MM-dd"),
                          style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Modification Time",
                            labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                            suffixIcon: Icon(Icons.keyboard_arrow_down,size: 24,color: const Color(0xff0000FF),),
                            contentPadding:
                            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onShowPicker: (context, currentValue) async{
                            final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1930),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2050),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                        colorScheme: ColorScheme.light().copyWith(
                                          primary: const Color(0xff0000FF),
                                        )//selection color
                                    ),
                                    child: child!,
                                  );
                                });
                            if (date != null) {

                              final time=await showTimePicker(
                                  context: context,
                                  initialTime:
                                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now(),),
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                          colorScheme: ColorScheme.light().copyWith(
                                            primary: const Color(0xff0000FF),
                                          )//selection color
                                      ),
                                      child: child!,
                                    );
                                  }
                              );
                              durationDate.value=DateTimeField.combine(date, time);
                              return DateTimeField.combine(date, time);
                            } else {
                              return currentValue;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 22,),
                          Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                    buttonTitle: "MARK FOR MODIFICATION",
                    buttonFontColor: Colors.white,
                    onButtonPressed: () async{
                      if(modifiationTextController.text.isEmpty || durationDate.value==null){
                        return await Fluttertoast.showToast(msg: "Reason and Time Fields cannot be empty",toastLength: Toast.LENGTH_LONG);
                      }
                      final progress = ProgressHUD.of(context);
                      progress!.showWithText('Marking Order As Needing Modification...');
                      double? amount;
                      if(budgetController.text.isNotEmpty){
                        amount = double.tryParse(budgetController.text.toString().replaceAll(RegExp(r'[^0-9\.]'), ''));
                      }
                      int mintues=0;
                      if(durationDate.value!.minute==30){
                        mintues = 30;
                      }else{
                        mintues = 30;
                      }
                      DateTime nowTime = DateTime.now();
                      DateTime decisionTime = DateTime(nowTime.year, nowTime.month, nowTime.day, nowTime.hour+48,30);
                      DateTime dateOfDelivery = DateTime(durationDate.value!.year, durationDate.value!.month, durationDate.value!.day, durationDate.value!.hour+48,mintues);
                      await context.read(orderRepositoryProvider).addActionToOrder("modification", orderModel.requestId);
                     CreateRequestModel? createRequestModel =  await context.read(userRepositoryProvider).getRequest(orderModel.requestId);
                      Map<String,dynamic> modificationPayload = {
                        "time":dateOfDelivery,
                        "decisionTime":decisionTime,
                        "reason":modifiationTextController.text.toString(),
                        "amount":amount,
                        "amountString":budgetController.text.isEmpty?"":budgetController.text.toString(),
                        "buyerId":orderModel.buyerId,
                        "sellerId":orderModel.sellerId,
                        "requestTitle":createRequestModel!.title,
                        "createdDate":DateTime.now()
                      };
                      await context.read(orderRepositoryProvider).createAModificationRequest(orderModel.requestId, modificationPayload);
                      progress.dismiss();
                    }, imageIcon: null,)

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
