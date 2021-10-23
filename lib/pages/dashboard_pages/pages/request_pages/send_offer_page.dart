import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/requests_model/request_model2.dart';
import 'package:halawork/pages/dashboard_pages/widget/request_card.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/utils/decimal_formatter.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:auto_route/auto_route.dart';

class SendOfferPage extends HookWidget {
  final CreateRequestModel2 createRequestModel2;
  const SendOfferPage({required this.createRequestModel2});

  @override
  Widget build(BuildContext context) {
    var descriptionController = useTextEditingController();
    var amtController=useTextEditingController();
    var durationDate=useState<DateTime?>(null);
    var durationString=useState<String>("");
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(
            "Send Offer",
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
        body: ProviderListener(
          provider: exceptionMessageProvider,
          onChange: (BuildContext context, StateController<CustomException?> customException,) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xff3E3E3E),
                content: Text(customException.state!.message!),
              ),
            );
          },
          child: ProgressHUD(
            backgroundColor:const Color(0xff0000FF),
            indicatorColor: Colors.white,
            child: Builder(
              builder: (context){
                return Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: const SizedBox(height: 36,)),
                      SliverToBoxAdapter(child: SellerRequestCard(isLast:false,createRequestModel: createRequestModel2,btnLabel: "SEND OFFER",isRemoveOfferBtn:true)),
                      SliverToBoxAdapter(child: const SizedBox(height: 45,)),
                      SliverToBoxAdapter(
                        child: Column(
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
                                  controller: descriptionController,
                                  keyboardType: TextInputType.multiline,
                                  textAlignVertical: TextAlignVertical.top,
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: const Color(0xff29283C), fontSize: 14)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Description",
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
                      ),
                      SliverToBoxAdapter(child: const SizedBox(height: 26,)),
                      SliverToBoxAdapter(
                        child: Theme(
                          data:
                          Theme.of(context).copyWith(splashColor: Colors.transparent),
                          child: TextField(
                            autofocus: false,
                            controller: amtController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [DecimalFormatter()],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: const Color(0xff29283C), fontSize: 14)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Enter Amount",
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
                      ),
                      SliverToBoxAdapter(child: const SizedBox(height: 26,)),
                      SliverToBoxAdapter(
                        child: Theme(
                          data: ThemeData.light().copyWith(splashColor: Colors.transparent,//selection color
                          ),
                          child: DateTimeField(
                            format: DateFormat("yyyy-MM-dd"),
                            style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Pick a duration",
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
                              durationDate.value = DateTimeField.combine(date, time);
                                return DateTimeField.combine(date, time);
                              } else {
                                return currentValue;
                              }
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: const SizedBox(height: 56,)),
                      SliverToBoxAdapter(
                        child: CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                          buttonTitle: "SUBMIT OFFER",
                          buttonFontColor: Colors.white,
                          onButtonPressed: () async{
                              if(descriptionController.text.isNotEmpty && amtController.text.isNotEmpty && durationDate.value!=null){
                                final progress = ProgressHUD.of(context);
                                progress!.showWithText('Sending Offer...');
                                int mintues=0;
                                if(durationDate.value!.minute==30){
                                  mintues = 30;
                                }else{
                                  mintues = 30;
                                }
                                DateTime dateOfDelivery = DateTime(durationDate.value!.year, durationDate.value!.month, durationDate.value!.day, durationDate.value!.hour,mintues);
                                String requestId= createRequestModel2.requestId!;
                                String buyerId = createRequestModel2.userId!;
                                String sellerId = context.read(authControllerProvider)!.uid;
                                final differenceSeconds = dateOfDelivery.difference(DateTime.now());
                                OfferModel offerModel = OfferModel(description: descriptionController.text, amount: amtController.text, selectedDuration: differenceSeconds.inSeconds.toString(), selectedDurationInWords: dateOfDelivery.month.toString(),dateOfDelivery: dateOfDelivery);
                                await context.read(userControllerProvider.notifier).sendOffer(sellerId, requestId, buyerId, offerModel);
                                progress.dismiss();
                                await Fluttertoast.showToast(msg: "Offer sent successfully",toastLength: Toast.LENGTH_LONG);
                                context.popRoute();
                              }else{
                                await Fluttertoast.showToast(msg: "Fields cannot be empty",toastLength: Toast.LENGTH_LONG);
                              }

                          }, imageIcon: null,),
                      ),
                      SliverToBoxAdapter(child: const SizedBox(height: 20,)),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
