
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/providers/state_providers/seller_setup_provider.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:auto_route/auto_route.dart';
class SellerBasicInfoEntryPage extends HookWidget {
  const SellerBasicInfoEntryPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final customUserModelState = useProvider(userModelExtensionController);
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final _optionalNumber = useState<String?>(null);
    final _firstName = useState<String?>("");
    final _lastName = useState<String?>("");
    String _phoneNo = customUserModelState!.userModel.phoneNumber!;
    final _dateOfBirth = useState<DateTime?>(null);
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: ()async{
            context.popRoute();
            return true;
          },
          child: ProviderListener(
            provider: exceptionMessageProvider,
            onChange: (BuildContext context, StateController<CustomException?> customException,) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color(0xff29283C),
                  content: Text(customException.state!.message!),
                ),
              );
            },
            child: ProgressHUD(
              backgroundColor: const Color(0xff0000FF),
              indicatorColor:Colors.white,
              child: Builder(
                builder: (context){
                  return Container(
                    width: size.width,
                    height: size.height,
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          elevation: 0,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                "Profile Setup",
                                style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(
                                        color: const Color(0xff3E3E3E),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Spacer(),
                              Text(
                                "2/10",
                                style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(
                                        color: const Color(0xff29283C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
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
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          sliver: SliverToBoxAdapter(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height*0.04,),
                                  Text("Profile Details",style:
                                  GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: const Color(0xff29283C)))),
                                  SizedBox(height: size.height*0.04,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Theme(
                                              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                              child: TextFormField(
                                                autofocus: false,
                                                keyboardType:
                                                TextInputType.name,
                                                validator: (val){
                                                  if(val==null) return "Field must not be empty";
                                                  else
                                                    return null;
                                                },
                                                onSaved: (value)=>_firstName.value=value,
                                                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10)),
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  labelText: "First name",
                                                  labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
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
                                      ),
                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Theme(
                                              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                              child: TextFormField(
                                                autofocus: false,
                                                keyboardType:
                                                TextInputType.text,
                                                validator: (val){
                                                  if(val==null) return "Field must not be empty";
                                                  else
                                                    return null;
                                                },
                                                onSaved: (value)=>_lastName.value=value,
                                                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10)),
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  labelText: "Last name",
                                                  labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 22,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Theme(
                                        data: ThemeData.light().copyWith(splashColor: Colors.transparent,//selection color
                                        ),
                                        child: DateTimeField(
                                          format:DateFormat("yyyy-MM-dd"),
                                          style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          validator: (val){
                                            if(val.toString().isEmpty) return "Field must not be empty";
                                            else
                                              return null;
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelText: "Date Of Birth",
                                            labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                            suffixIcon: Icon(Icons.date_range,size: 24,color: const Color(0xff0000FF),),
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
                                          onChanged: (val)=>_dateOfBirth.value=val,
                                          onShowPicker: (context, currentValue) {
                                            return showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1930),
                                              initialDate: currentValue ?? DateTime.now(),
                                              lastDate: DateTime(2050),
                                              builder: (BuildContext? context, Widget? child) {
                                                return Theme(
                                                  data: ThemeData.light().copyWith(
                                                      colorScheme: ColorScheme.light().copyWith(
                                                        primary: const Color(0xff0000FF),
                                                      )//selection color
                                                  ),
                                                  child: child!,
                                                );
                                              },);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 22,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Theme(
                                        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                        child:AbsorbPointer(
                                          child: TextFormField(
                                            keyboardType: null,
                                            style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xffACACAC),fontSize: 10)),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              labelText: _phoneNo,
                                              labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xffACACAC),fontSize: 14,fontWeight: FontWeight.bold)),
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
                                          ),
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
                                  SizedBox(height: 22,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Theme(
                                        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                        child: TextFormField(
                                          autofocus: false,
                                          keyboardType:
                                          TextInputType.phone,
                                          validator: (val){
                                            if(val==null) return "Field must not be empty";
                                            else
                                              return null;
                                          },
                                          onSaved: (value)=>_optionalNumber.value=value,
                                          style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10)),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelText: "Optional No.",
                                            labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
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
                                  SizedBox(height: size.height*0.10,),
                                  CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "NEXT  >", buttonFontColor: Colors.white, onButtonPressed: () async{
                                    if(_dateOfBirth.value==null)
                                      return await Fluttertoast.showToast(msg: "Field cannot be empty",toastLength: Toast.LENGTH_LONG);
                                    if(_formKey.currentState!.validate()){
                                      _formKey.currentState!.save();
                                      final progress = ProgressHUD.of(context);
                                      progress!.showWithText('Submitting basic info...');
                                      UserModel userModel = UserModel(phoneNumber: customUserModelState.userModel.phoneNumber,
                                      isSeller:customUserModelState.userModel.isSeller,isBuyer:customUserModelState.userModel.isBuyer,
                                      isPhoneNumberVerified:customUserModelState.userModel.isPhoneNumberVerified,
                                      firstName: _firstName.value,lastName: _lastName.value,optionalNumber: _optionalNumber.value==null
                                      ?"":_optionalNumber.value,dateOfBirth: _dateOfBirth.value,sellerType: context.read(sellerSetupStateProvider).state!.sellerType,email: context.read(authControllerProvider)!.email);
                                      await context.read(userModelExtensionController.notifier).saveBasicSellerInfo(userModel);
                                     await context.read(serviceTypeControllerProvider.notifier).retrieveServiceType(isRefreshing:true);
                                      progress.dismiss();
                                      if(context.read(exceptionMessageProvider).state==null){
                                        await Fluttertoast.showToast(msg: "Basic info saved successfully",toastLength: Toast.LENGTH_LONG);
                                        context.router.navigate(SelectServiceTypeRoute(isOrganization: false));
                                      }else{
                                        context.read(exceptionMessageProvider).state =null;
                                      }
                                    }
                                  }, imageIcon: null,)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}



