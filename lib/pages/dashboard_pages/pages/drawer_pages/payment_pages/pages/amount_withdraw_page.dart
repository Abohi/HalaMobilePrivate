import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/transfer_model/transfer_model.dart';
import 'package:halawork/models/transfer_model/transfer_response_model.dart';
import 'package:halawork/models/transfer_recipient_model/transfer_recipient_model.dart';
import 'package:halawork/models/transfer_recipient_model/transfer_recipient_request_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page/widgets/pin_pad_widget.dart';
import 'package:halawork/pages/dashboard_pages/widget/generic_response_dialog.dart';
import 'package:halawork/providers/state_providers/bankAccountProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/utils/getUserBalance.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class AmountToWithdrawPage extends HookWidget {
  const AmountToWithdrawPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bankDataState= useProvider(bankAccountProvider);
    var _amountTextEditingController = useTextEditingController();
    var pinTextEditingController= useTextEditingController();
    var userModelState = useProvider(userModelExtensionController);
    var amountText = useState<String>("");
    var pinText = useState<String>("");
    var isAmountToWithdraw = useState<bool>(true);
    var isPinPad = useState<bool>(false);
    var isPaymentButton = useState<bool>(false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        elevation: 5,
        title: Text(
          "WithDraw Funds",
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
          body:
      ProgressHUD(
        backgroundColor:const Color(0xff0000FF),
        indicatorColor: Colors.white,
        child: Builder(
          builder: (context){
            return Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 34,),
                    Container(
                      width: size.width,
                      height: 96,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Personal balance",style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: const Color(0xffACACAC)
                              )
                          ),) ,
                          SizedBox(height: 10,),
                          Text("${returnAccountBalance(userModelState!.userModel.wallet?.creditBalance??0.0, userModelState.userModel.wallet?.creditBalance??0.0)} NGN",style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff0000FF)
                              )
                          ),)
                        ],
                      ),
                    ),
                    Visibility(
                        visible:isAmountToWithdraw.value,
                        child: const SizedBox(height: 32,)),
                    Visibility(
                      visible: isAmountToWithdraw.value,
                      child: Text("Enter and amount to withdraw",style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: const Color(0xff29283C),
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          )
                      ),),
                    ),
                    const SizedBox(height: 17,),
                    Visibility(
                      visible: isAmountToWithdraw.value,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          controller: _amountTextEditingController,
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
                    Visibility(
                      visible: isPinPad.value,
                      child: KeyPadPage(pinLength: 4,
                        inputLabel: "ENTER PIN",
                        pinController: pinTextEditingController,
                        onSubmit: (String pin) async{
                          if(userModelState.userModel.transactionPin==null)
                            context.router.navigate(CreatePinRoute());

                          if(userModelState.userModel.transactionPin==pin){
                            pinText.value=pin;
                            isPaymentButton.value=true;
                            isPinPad.value = false;
                          }else{
                            await Fluttertoast.showToast(msg: "Pin is not valid",toastLength: Toast.LENGTH_LONG);
                          }
                        }, onChange: (String val) {

                        },
                      ),
                    ),
                    isAmountToWithdraw.value?SizedBox(
                      height: size.height*0.2,
                    ):SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: isAmountToWithdraw.value,
                      child: CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                        buttonTitle: "CONTINUE",
                        buttonFontColor: Colors.white,
                        onButtonPressed: () async{
                          isAmountToWithdraw.value = false;
                          isPinPad.value = true;
                        }, imageIcon: null,),
                    ),
                    Visibility(
                      visible:isPaymentButton.value,
                      child: CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                        buttonTitle: "CONTINUE",
                        buttonFontColor: Colors.white,
                        onButtonPressed: () async{
                          if(userModelState.userModel.transactionPin!=pinText.value)
                            return await Fluttertoast.showToast(msg: "Pin is not valid",toastLength: Toast.LENGTH_LONG);
                          if(_amountTextEditingController.text.isEmpty)
                            return await Fluttertoast.showToast(msg: "Please enter an amount",toastLength: Toast.LENGTH_LONG);

                          final progress = ProgressHUD.of(context);
                          progress!.showWithText('Creating Transfer Recipient...');
                          TransferRecipientRequestModel transferRecipient = TransferRecipientRequestModel(currency: 'NGN', type: 'nuban', account_number: bankDataState.state!.account_number, name: bankDataState.state!.account_name, bank_code: bankDataState.state!.bankCode!);
                          Either<NetworkFailure,TransferRecipientModel> recipientResponse = await context.read(userRepositoryProvider).createTransferRecipient(transferRecipient);
                          recipientResponse.fold((l){
                            progress.dismiss();
                            return ErrorWidgetControl(networkFailure: l, retryHandler: ()async{
                              await context.read(userRepositoryProvider).createTransferRecipient(transferRecipient);
                            });
                          }, (r)async{
                            progress.dismiss();
                                if(r.status==true){
                                  await Fluttertoast.showToast(msg: "Transfer recipient created successfully",toastLength: Toast.LENGTH_LONG);
                                  final progress = ProgressHUD.of(context);
                                  progress!.showWithText('Making Transfer...');
                                  int amount = int.parse(_amountTextEditingController.text.toString())*10;
                                  print("User amount: ${amount.toString()}");
                                  TransferModel tranferModel = TransferModel(amount:amount.toString(), recipient: r.data.recipient_code, reason: 'withdrawal', source: 'balance');
                                  Either<NetworkFailure,TransferResponseModel> transferResponse = await context.read(userRepositoryProvider).makeTransfer(tranferModel);
                                  transferResponse.fold((l) {
                                    progress.dismiss();
                                    return ErrorWidgetControl(networkFailure: l, retryHandler: ()async{
                                      await context.read(userRepositoryProvider).makeTransfer(tranferModel);
                                    });
                                  }, (r)async{
                                    await context.read(userRepositoryProvider).addTransfer(r.data);
                                    progress.dismiss();
                                    if(r.status==true){
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
                                                context.router.navigate(PaymentRoute());
                                              },
                                              text1: "Transfer",
                                              text2: r.message, btnText: 'CONTINUE',
                                            );
                                          });
                                    }else{
                                      await Fluttertoast.showToast(msg: r.message,toastLength: Toast.LENGTH_LONG);
                                    }
                                  });
                                }else{
                                  await Fluttertoast.showToast(msg: "Failed to create transfer recipient",toastLength: Toast.LENGTH_LONG);
                                }
                          });
                          isAmountToWithdraw.value =true;
                          isPinPad.value = false;
                          isPaymentButton.value=false;
                        }, imageIcon: null,),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }

}
