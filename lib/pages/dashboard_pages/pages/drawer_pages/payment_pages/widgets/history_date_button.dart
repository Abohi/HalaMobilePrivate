import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/transfer_model/transfer_response_data_model.dart';
import 'package:halawork/providers/state_providers/dateStateProvider.dart';
import 'package:halawork/providers/state_providers/transferResponseDataModelFilteredListProvider.dart';
import 'package:halawork/providers/state_providers/transferResponseDataModelListProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class HistoryDateButton extends HookWidget {
  const HistoryDateButton();

  @override
  Widget build(BuildContext context) {
    var transferResponseDataState = useProvider(transferResonseDataModelListProvider);
    var filteredTransferResponseDataState= useProvider(transferResponseDataModelFilteredListProvider);
    var size = MediaQuery
        .of(context)
        .size;
    var dateState = useProvider(dateStateProvider);
    return GestureDetector(
      onTap: () async {
        List<TransferResponseDataModel> transferResponseData = [];
        final DateTime? picked = await showDatePicker(
          context: context,
          firstDate: DateTime(1930),
          initialDate: DateTime.now(),
          lastDate: DateTime(2050),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light().copyWith(
                    primary: const Color(0xff0000FF),
                  ) //selection color
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          DateTime currentTime = DateTime.now();
          dateState.state = picked;
          if(currentTime.isAfter(picked)){
            if(transferResponseDataState.state!=null){
              if(transferResponseDataState.state!.isNotEmpty){
                for(int i=0;i<transferResponseDataState.state!.length;i++){
                  DateTime transferDateTime = DateFormat("yyyy-MM-dd").parse(transferResponseDataState.state![i].createdAt);
                  if(picked.isBefore(transferDateTime) || transferDateTime.isAtSameMomentAs(picked)){
                    transferResponseData.add(transferResponseDataState.state![i]);
                  }
                }
                filteredTransferResponseDataState.state = transferResponseData;
              }
            }
          }else{
            await Fluttertoast.showToast(msg: "Please Pick a valid date",toastLength: Toast.LENGTH_LONG);
            return;
          }
        }
      },

      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(color: Colors.white,
            border: Border.all(color: const Color(0xffACACAC),),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 17,),
            Text(
              "${dateState.state==null?"Filter by date":DateFormat.yMMMd().format(dateState.state!)+" - "+DateFormat.yMMMd().format(DateTime.now())}",
              style: GoogleFonts.roboto(textStyle: TextStyle(
                  fontSize: 14, color: const Color(0xffACACAC))),),
            Spacer(),
            Icon(Icons.date_range, color: const Color(0xff0000FF), size: 16,),
            SizedBox(width: 23.3,)
          ],
        ),
      ),
    );
  }
}
