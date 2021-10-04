import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/seller_setup_models/profile_description_entry_model/profile_description_entry_model.dart';
import 'package:halawork/providers/state_providers/seller_setup_provider.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
final titleStateProvider = StateProvider<String?>((ref){
  return  null;
});

final descriptionStateProvider = StateProvider<String?>((ref){
  return  null;
});
class ProfileDescriptionEntryPage extends HookWidget {
  const ProfileDescriptionEntryPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    return SafeArea(child: Scaffold(appBar: AppBar(
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
            "8/10",
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
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Profile overview",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16,color: const Color(0xff29283C),fontWeight: FontWeight.w700)),),
            SizedBox(height: 12,),
            Text("Please provide a short description on your expertise and experience to showcase your skillset.",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,color: const Color(0xff29283C),fontWeight: FontWeight.normal)),),
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
                      Theme(
                        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                        child: TextFormField(
                          maxLines: 1,
                          obscureText: false,
                          autofocus: false,
                          keyboardType:
                          TextInputType.text,
                          readOnly: false,
                          style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10)),
                          validator: (val){
                            if(val!.isEmpty) return "Field must not be empty";
                            else
                              return null;
                          },
                          onChanged: (val){
                            context.read(titleStateProvider).state = val;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Title",
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
                      )
                    ],
                  ),
                  SizedBox(height: 22,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: Container(
                          width: size.width,
                          height: size.height * 0.3,
                          child: TextFormField(
                            autofocus: false,
                            maxLines: 300,
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.top,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: const Color(0xff29283C), fontSize: 10)),
                            validator: (val){
                              if(val!.isEmpty) return "Field must not be empty";
                              else
                                return null;
                            },
                            onChanged: (val){
                              context.read(descriptionStateProvider).state = val;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Description",
                              labelStyle: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff29283C),
                                      fontSize: 14)),
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 22,),
                          Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height:size.height*0.2,),
                  CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "NEXT  >", buttonFontColor: Colors.white, onButtonPressed: (){
                    if(_formKey.currentState!.validate()){
                      ProfileDescEntryModel profileDescModel = ProfileDescEntryModel(title: context.read(titleStateProvider).state,description:context.read(descriptionStateProvider).state);
                      context.read(sellerSetupStateProvider).state = context.read(sellerSetupStateProvider).state!.copyWith(saveProfileDescModel: profileDescModel);
                      context.router.navigate(ProfilePictureEntryRoute());
                    }
                  }, imageIcon: null,),
                  SizedBox(height:20,),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
