import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/account_info_model/account_info_data_model.dart';
import 'package:halawork/providers/state_providers/bankAccountProvider.dart';
import 'package:halawork/providers/state_providers/bankDataModelProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class WithDrawFundsPage extends HookWidget {
  const WithDrawFundsPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bankDataState= useProvider(bankAccountProvider);
    var _textEditingController = useTextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
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
        backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Personal balance",style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 14,fontWeight: FontWeight.normal
                        )
                      ),),
                      SizedBox(height: 10,),
                      Text("0.00NGN",style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.w700
                        )
                      ),)
                    ],
                  ),
                ),
                const SizedBox(height: 17,),
                StreamBuilder<List<AccountInfoDataModel>>(stream: context.read(userRepositoryProvider).getBankAccounts(),
                    builder: (context,snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data!.isEmpty){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("You have not added a bank Account yet")
                        ],
                      );
                    }else{
                      return DropdownSearch<AccountInfoDataModel>(
                        mode: Mode.BOTTOM_SHEET,
                        showSearchBox: true,
                        items: snapshot.data,
                        label: "Select your account",
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
                        itemAsString: (AccountInfoDataModel bankDataModel) => bankDataModel.account_name.toString(),
                        onChanged: (value){
                          bankDataState.state = value;
                        },
                        selectedItem: bankDataState.state==null?AccountInfoDataModel(account_name: "Select your account", account_number: ''):snapshot.data!.firstWhere((element) => element.account_name==bankDataState.state!.account_name),
                      );
                    }
                  }else if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
                      ],
                    );
                  }
                  else{
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("You have not added a bank Account yet")
                      ],
                    );
                  }
                }),
                SizedBox(height:size.height*0.2,),
                CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                  buttonTitle: "CONTINUE",
                  buttonFontColor: Colors.white,
                  onButtonPressed: () async{
                    context.router.navigate(AmountToWithdrawRoute());
                  }, imageIcon: null,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
