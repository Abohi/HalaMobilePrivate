import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/account_info_model/account_info_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/add_account_component/back_names_dropdown.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/add_account_component/bank_account_details.dart';
import 'package:halawork/providers/future_providers/account_info_future_provider.dart';
import 'package:halawork/providers/future_providers/banklist_provider.dart';
import 'package:halawork/providers/state_providers/bankDataModelProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class AddAccountPage extends HookWidget {
  const AddAccountPage();

  @override
  Widget build(BuildContext context) {
    var _textEditingController = useTextEditingController();
    var bankInfoState = useProvider(bankDataModelProvider);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          height: size.height,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 5,
                title: Text(
                  "Add Account",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff3E3E3E),
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                centerTitle: true,
                pinned: true,
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
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Add a Bank detail to withdraw funds",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff29283C))),
                    ),
                    SizedBox(
                      height: 47,
                    ),
                    BankNameDropDown(),
                    const SizedBox(
                      height: 22,
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        controller: _textEditingController,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff29283C), fontSize: 14)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Enter Account Number",
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
                    SizedBox(
                      height: size.height * 0.3,
                    ),
                    CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                      buttonTitle: "CONTINUE",
                      buttonFontColor: Colors.white,
                      onButtonPressed: () async{
                        if(_textEditingController.text.toString().isEmpty || bankInfoState.state==null){
                          return await Fluttertoast.showToast(msg: "Fields cannot be empty",toastLength: Toast.LENGTH_LONG);
                        }else{
                          bankInfoState.state=bankInfoState.state?.copyWith(accountNumber: _textEditingController.text.toString());

                        }
                      }, imageIcon: null,)
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
