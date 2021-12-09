import 'package:dartz/dartz.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/bank_model/bank_data_model.dart';
import 'package:halawork/models/bank_model/bank_model.dart';
import 'package:halawork/providers/future_providers/banklist_provider.dart';
import 'package:halawork/providers/state_providers/bankDataModelProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BankNameDropDown extends HookWidget {
  const BankNameDropDown();

  @override
  Widget build(BuildContext context) {
    AsyncValue<Either<NetworkFailure,BankModel>> bankListAsyncData= useProvider(bankListProvider);
    var bankDataModelState = useProvider(bankDataModelProvider);
    return bankListAsyncData.when(data: (bankData){
      return bankData.fold((l){
        return ErrorWidgetControl(networkFailure: l, retryHandler: ()async{
          await context.read(userRepositoryProvider).getBanks();
        });
      }, (r){
        return   DropdownSearch<BankDataModel>(
          mode: Mode.BOTTOM_SHEET,
          showSearchBox: true,
          items: r.data,
          label: "Select your bank",
          emptyBuilder: (context,error){
            if(error!=null)
              return Center(
                child: Text("Invalid Selection",style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: const Color(0xff29283C),decoration:TextDecoration.none)),),
              );
            return Center(
              child: Text("Invalid Selection",style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: const Color(0xff29283C),decoration: TextDecoration.none)),),
            );
          },
          itemAsString: (BankDataModel bankDataModel) => bankDataModel.name.toString(),
          onChanged: (value){
           bankDataModelState.state = value;
          },
          selectedItem: bankDataModelState.state==null?BankDataModel(name: "Select your bank",code: ""):r.data.firstWhere((element) => element.name==bankDataModelState.state?.name),
        );
      });
    }, loading: (){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
        ],
      );
    }, error: (object,stacktrace){
      return Text(stacktrace.toString());
    });
    return Container();
  }
}
