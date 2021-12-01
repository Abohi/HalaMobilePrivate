import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/models/seller_setup_models/orgdetail_model/orgdetail_model.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart' show DateFormat;
final companiesStateProvider = StateProvider<String>((ref) => "");
final dateStateProvider = StateProvider<DateTime?>((ref) => null);
final companiesDescriptionStateProvider = StateProvider<String>((ref) => "");
final phoneNumberStateProvider = StateProvider<String>((ref) => "");
final firstNameStateProvider = StateProvider<String>((ref) => "");
final lastNameStateProvider = StateProvider<String>((ref) => "");
class EditOrganizationDescritionPage extends HookWidget {
  const EditOrganizationDescritionPage();

  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title:  Text(
            "Edit Description",
            style: GoogleFonts.josefinSans(
                textStyle: TextStyle(
                    color: const Color(0xff3E3E3E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
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
        body: ProgressHUD(
          backgroundColor:const Color(0xff0000FF),
          indicatorColor: Colors.white,
          child: Builder(
            builder: (context){
              return Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height*0.04,),
                        Text("Organisation Details",style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: const Color(0xff29283C)))),
                        SizedBox(height: size.height*0.04,),
                        Column(
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
                                  if(val.toString().isEmpty) return "Field must not be empty";
                                  else
                                    return null;
                                },
                                onSaved: (value)=>context.read(companiesStateProvider).state=value!,
                                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Company Name",
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
                        SizedBox(height: 22,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Theme(
                              data: ThemeData.light().copyWith(splashColor: Colors.transparent,//selection color
                              ),
                              child: DateTimeField(
                                format: DateFormat("yyyy-MM-dd"),
                                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                onChanged: (val)=>context.read(dateStateProvider).state=val,
                                validator: (val){
                                  if(val==null) return "Field must not be empty";
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Date Founded",
                                  labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                  suffixIcon: ImageIcon(AssetImage("assets/images/calendar_icon.png"),color: const Color(0xff0000FF),size: 24,),
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
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
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
                              child: TextFormField(
                                autofocus: false,
                                keyboardType:
                                TextInputType.multiline,
                                validator: (val){
                                  if(val.toString().isEmpty) return "Field must not be empty";
                                  else
                                    return null;
                                },
                                onSaved: (val)=>context.read(companiesDescriptionStateProvider).state=val!,
                                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Description",
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
                                Spacer(),
                                Text("maximum of 250-300 words",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
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
                                  if(val.toString().isEmpty) return "Field must not be empty";
                                  else
                                    return null;
                                },
                                onSaved: (val)=>context.read(phoneNumberStateProvider).state=val!,
                                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Phone number",
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
                        SizedBox(height: 45,),
                        Text("Contact person",style: GoogleFonts.roboto(fontWeight:FontWeight.w700,textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                        SizedBox(width: 22,),
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
                                      TextInputType.text,
                                      validator: (val){
                                        if(val.toString().isEmpty) return "Field must not be empty";
                                        else
                                          return null;
                                      },
                                      onSaved: (val)=>context.read(firstNameStateProvider).state=val!,
                                      style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
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
                                        if(val.toString().isEmpty) return "Field must not be empty";
                                        else
                                          return null;
                                      },
                                      onSaved: (val)=>context.read(lastNameStateProvider).state=val!,
                                      style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
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
                        SizedBox(height: size.height*0.10,),
                        CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "UPDATE", buttonFontColor: Colors.white, onButtonPressed: () async{
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            final progress = ProgressHUD.of(context);
                            progress!.showWithText('Updating Description...');
                           OrgDetailModel orgDetailModel =  OrgDetailModel(
                                dateFounded: context.read(dateStateProvider).state!,
                                firstName: context.read(firstNameStateProvider).state,
                                lastName: context.read(lastNameStateProvider).state,
                                companiesDescription: context.read(companiesDescriptionStateProvider).state,
                                companiesName: context.read(companiesStateProvider).state,
                                companiesNumber: context.read(phoneNumberStateProvider).state
                            );
                          await context.read(userRepositoryProvider).updateUserDescription(orgDetailModel, null, true);
                          progress.dismiss();
                          await Fluttertoast.showToast(msg: "Description updated successfully",toastLength: Toast.LENGTH_LONG);
                          }
                        }, imageIcon: null,),
                        const SizedBox(height: 15,)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
