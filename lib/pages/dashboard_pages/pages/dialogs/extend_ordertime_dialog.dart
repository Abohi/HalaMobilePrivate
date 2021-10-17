import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:intl/intl.dart' show DateFormat;
class ExtendOrderTimeDialog extends HookWidget {
  final Function(DateTime) addExtensionDate;
  const ExtendOrderTimeDialog({required this.addExtensionDate});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var durationDate = useState<DateTime?>(null);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child:Container(
        width: size.width*0.8,
        height: size.height*0.25,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Please select a time period, you wish to extend the order by?",style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: const Color(0xff29283C), fontSize: 14)),),
            const SizedBox(height: 15,),
            Theme(
              data: ThemeData.light().copyWith(splashColor: Colors.transparent,//selection color
              ),
              child: DateTimeField(
                format: DateFormat("yyyy-MM-dd"),
                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                onChanged: (val){
                  durationDate.value = val;
                },
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
                    );;
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
              ),
            ),
            const SizedBox(height: 30,),
            CustomButtonSignup(buttonBg: const Color(0xff0000FF),
              buttonTitle: "EXTEND",
              buttonFontColor: Colors.white,
              onButtonPressed: () async{
                int mintues=0;
                if(durationDate.value!.minute==30){
                  mintues = 30;
                }else{
                  mintues = 30;
                }
                DateTime dateOfDelivery = DateTime(durationDate.value!.year, durationDate.value!.month, durationDate.value!.day, durationDate.value!.hour,mintues);
                addExtensionDate(dateOfDelivery);
                Navigator.pop(context);
              }, imageIcon: null,)
          ],
        ),
      ) ,
    );
  }
}