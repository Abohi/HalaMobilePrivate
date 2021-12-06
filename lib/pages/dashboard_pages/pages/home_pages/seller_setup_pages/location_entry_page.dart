import 'dart:convert';
import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/states_model/states_model.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/providers/state_providers/seller_setup_provider.dart';
import 'package:halawork/utils/constants.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
final stateModelStateProvider = StateProvider<StateModel?>((ref){
  return  null;
});
final lgaStateProvider = StateProvider<String?>((ref){
  return  null;
});
final streetAddressStateProvider = StateProvider<String?>((ref){
  return  null;
});
class LocationEntryPage extends HookWidget {
  const LocationEntryPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    return SafeArea(child: Scaffold(
    appBar: AppBar(
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
            "10/10",
            style: GoogleFonts.josefinSans(
                textStyle: TextStyle(
                    color: const Color(0xff29283C),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
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
        body: Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: ProviderListener(
        provider:exceptionMessageProvider,
        onChange: (BuildContext context, StateController<CustomException?> customException) {
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
            return  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Text("What is your location?",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,color: const Color(0xff29283C),fontWeight: FontWeight.w700)),),
                  SizedBox(height: 12,),
                  Text("Please provide your location as this helps in matching you with the right request",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,color: const Color(0xff29283C),fontWeight: FontWeight.normal)),),
                  SizedBox(height: 25,),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DropdownSearch<StateModel>(
                              mode: Mode.BOTTOM_SHEET,
                              showSearchBox: true,
                              items: nigeria.map((e) => StateModel.fromJson(e)).toList(),
                              label: "Select your state",
                              itemAsString: (StateModel state) => state.state.toString(),
                              onChanged: (state)=>context.read(stateModelStateProvider).state=state,
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
                              selectedItem: context.read(stateModelStateProvider).state==null?StateModel(state: "Select your state", lgas: []):context.read(stateModelStateProvider).state,
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
                        SizedBox(height:22,),
                        context.read(stateModelStateProvider).state==null?SizedBox.shrink():DropdownSearch<String>(
                          mode: Mode.BOTTOM_SHEET,
                          showSearchBox: true,
                          items: context.read(stateModelStateProvider).state!.lgas,
                          label: "Select your LGA",
                          itemAsString: (String lga) => lga,
                          onChanged: (state)=>context.read(lgaStateProvider).state=state,
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
                          selectedItem: context.read(lgaStateProvider).state==null?"Select your LGA":context.read(lgaStateProvider).state,
                        ),
                        SizedBox(height: 22,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                              child: TextFormField(
                                maxLines: 3,
                                obscureText: false,
                                autofocus: false,
                                keyboardType:
                                TextInputType.text,
                                readOnly: false,
                                validator: (val){
                                  if(val!.isEmpty) return "Field must not be empty";
                                  else
                                    return null;
                                },
                                onChanged: (val){
                                  context.read(streetAddressStateProvider).state = val;
                                },
                                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Street Address",
                                  labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                  contentPadding:
                                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                    borderRadius: BorderRadius.circular(4),
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
                            )
                          ],
                        ),
                        SizedBox(height:size.height*0.2 ,),
                        CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "NEXT  >", buttonFontColor: Colors.white, onButtonPressed: ()async{
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            final progress = ProgressHUD.of(context);
                            progress!.showWithText('Registering Seller...');

                            context.read(sellerSetupStateProvider).state = context.read(sellerSetupStateProvider).state!.copyWith(locationModel: [LocationModel(localGovt: context.read(lgaStateProvider).state!, streetAddress: context.read(streetAddressStateProvider).state!,
                                state: context.read(stateModelStateProvider).state!.state!)]);

                            await context.read(userModelExtensionController.notifier).completeSellerProfileSetup(context.read(sellerSetupStateProvider).state!);
                            progress.dismiss();
                            if(context.read(exceptionMessageProvider).state==null){
                              await Fluttertoast.showToast(msg: "Seller Information saved successfully",toastLength: Toast.LENGTH_LONG);
                              context.router.navigate(SellerSetupCompleteRoute());
                            }else{
                              context.read(exceptionMessageProvider).state =null;
                            }
                          }
                        }, imageIcon: null,),
                        SizedBox(height: 20,)

                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        ),
      ),
    )));
  }
}

