import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/account_info_model/account_info_data_model.dart';
import 'package:halawork/models/account_info_model/account_info_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/widgets/add_account_success_dialog.dart';
import 'package:halawork/pages/dashboard_pages/widget/generic_response_dialog.dart';
import 'package:halawork/providers/future_providers/account_info_future_provider.dart';
import 'package:halawork/providers/state_providers/bankDataModelProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'add_account_component/bank_account_details.dart';

class AddAccountDetailPage extends HookWidget {
  const AddAccountDetailPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bankInfoState = useProvider(bankDataModelProvider);
    AsyncValue<Either<NetworkFailure,AccountInfoModel?>> accountInfoState= useProvider(accountInfoFutureProvider);
    return   SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(
            "Account Details",
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
        body: accountInfoState.when(data: (accountInfoData){
          return accountInfoData.fold((l){
            return ErrorWidgetControl(networkFailure: l, retryHandler: ()async{
              await context.read(userRepositoryProvider).resolveAccountInfo();
            });
          }, (r){
            if(r!.status==false)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Text(r.message),
                  )
                ],
              );
            return Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: ProgressHUD(
                backgroundColor:const Color(0xff0000FF),
                indicatorColor: Colors.white,
                child: Builder(
                  builder: (context){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        BankAccountDetails(accountNumber: r.data!.account_number, accountName: r.data!.account_name,bankName:bankInfoState.state!.name),
                        SizedBox(height: size.height*0.2,),
                        CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                          buttonTitle: "ADD ACCOUNT",
                          buttonFontColor: Colors.white,
                          onButtonPressed: () async{
                            final progress = ProgressHUD.of(context);
                            progress!.showWithText('Adding Account...');
                            AccountInfoDataModel accountInfoDataModel = AccountInfoDataModel(account_number: r.data!.account_number,
                                account_name: r.data!.account_name,bankCode: bankInfoState.state!.code,bankName: bankInfoState.state!.name);
                            await context.read(userRepositoryProvider).addBankAccount(accountInfoDataModel);
                            progress.dismiss();
                            await showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                                barrierColor: Colors.black45,
                                transitionDuration: const Duration(milliseconds: 200),
                                pageBuilder: (BuildContext buildContext, Animation animation,
                                    Animation secondaryAnimation) {
                                  return GenericResponseDialog(
                                    onBottonPressed: () {
                                      Navigator.pop(context);
                                     context.popRoute();
                                    },
                                    text1: "Successfully added",
                                    text2: "A bank account", btnText: 'CONTINUE',
                                  );
                                });

                          }, imageIcon: null,)
                      ],
                    );
                  },
                ),
              ),
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
        }),
      ),
    );
  }
}
