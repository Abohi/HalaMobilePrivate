import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:halawork/providers/change_notifier_providers/education_entry_list_provider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/CustomButtonSignupSvg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
class EditEducationPage extends HookWidget {
  const EditEducationPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final educationEntryListChangeNotifier = useProvider(educationEntryChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Edit Education",
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
        backgroundColor: const Color(0xff0000FF),
        indicatorColor:Colors.white,
        child:Builder(
          builder: (context){
            return  Container(
              width: size.width,
              height: size.height,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: size.height*0.04,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Text("Education",style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: const Color(0xff29283C)))),
                      ),
                      SizedBox(height: 12,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Text("Add schools attended",style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: const Color(0xff29283C)))),
                      ),
                      SizedBox(height: size.height*0.08,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: CustomButtonSignupSvg(isIconLeft: true,icon:Icon(Icons.add,color:Color(0xff0000FF),size: 24,),buttonBg: Colors.white, buttonTitle: "ADD EDUCATION", buttonFontColor: const Color(0xff0000FF),isBorder: true,onButtonPressed: (){
                          _modalBottomSheetMenu(context: context,onButtonPressed: (EducationEntryModel educationModel){
                            educationEntryListChangeNotifier.addEducationEntryModel(educationModel);
                          });
                        },),
                      ),
                    ]),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 30,),
                  ),
                  educationEntryListChangeNotifier.educationEntryModelList.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):SliverList(
                    delegate: SliverChildListDelegate(
                        educationEntryListChangeNotifier.educationEntryModelList.asMap().keys.map((index) => EducationItem(schoolName:  educationEntryListChangeNotifier.educationEntryModelList[index].schoolName!,dateString: "${DateFormat.MMMd().format( educationEntryListChangeNotifier.educationEntryModelList[index].dateAttended!)} - ${DateFormat.MMMd().format( educationEntryListChangeNotifier.educationEntryModelList[index].dateEnded!)}",
                          onButtonPressed: (){
                            educationEntryListChangeNotifier.removeEducationEntryModel(index);
                          },)).toList()
                    ),
                  ),
                  educationEntryListChangeNotifier.educationEntryModelList.isEmpty?SliverToBoxAdapter(child: SizedBox(height: size.height*0.15,)):SliverToBoxAdapter(child: SizedBox.shrink()),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 30,),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "UPDATE", buttonFontColor: Colors.white, onButtonPressed: ()async{
                        final progress = ProgressHUD.of(context);
                        progress!.showWithText('Updating Education...');
                        await context.read(userRepositoryProvider).updateEducation(educationEntryListChangeNotifier.educationEntryModelList);
                        progress.dismiss();
                      }, imageIcon: null,),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  void _modalBottomSheetMenu({required BuildContext context,required void onButtonPressed(EducationEntryModel educationModel)}){
    final format = DateFormat("yyyy-MM-dd");
    final _formKey = GlobalKey<FormState>();
    String? _schoolName,_areaOfStudy,_degree;
    DateTime? _dateAttended,_dateEnded;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder){
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          return Container(
            width: width,
            height: height,
            margin: MediaQuery.of(context).padding,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child:CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    title: Text(
                      "Add Education",
                      style: GoogleFonts.josefinSans(
                          textStyle: TextStyle(
                              color: const Color(0xff3E3E3E),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    pinned: true,
                    backgroundColor: Colors.white,
                    leading: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: const Color(0xff0000FF),
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SliverList(delegate: SliverChildListDelegate([
                    SizedBox(height: 30,),
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
                                  style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                  validator: (val){
                                    if(val!.isEmpty) return "Field must not be empty";
                                    else
                                      return null;
                                  },
                                  onChanged: (val){
                                    _schoolName = val;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "School Name",
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
                                data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                child: TextFormField(
                                  maxLines: 1,
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
                                    _areaOfStudy = val;
                                  },
                                  style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Area of study",
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
                                data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                child: TextFormField(
                                  maxLines: 1,
                                  obscureText: false,
                                  autofocus: false,
                                  keyboardType:
                                  TextInputType.text,
                                  readOnly: false,
                                  style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                  validator: (val){
                                    if(val!.isEmpty) return "Field must not be empty";
                                    else
                                      return null;
                                  },
                                  onChanged: (val){
                                    _degree = val;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Degree",
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
                                  Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14))),
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
                                data: ThemeData.light().copyWith(splashColor: Colors.transparent,//selection color
                                ),
                                child: DateTimeField(
                                  format: format,
                                  style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                  validator: (val){
                                    if(val.toString().isEmpty) return "Field must not be empty";
                                    else
                                      return null;
                                  },
                                  onChanged: (val){
                                    _dateAttended = val!;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Date attended from",
                                    labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                    suffixIcon: Icon(Icons.keyboard_arrow_down,size: 24,color: const Color(0xff0000FF),),
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
                                data: ThemeData.light().copyWith(splashColor: Colors.transparent,//selection color
                                ),
                                child: DateTimeField(
                                  format: format,
                                  style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                  validator: (val){
                                    if(val.toString().isEmpty) return "Field must not be empty";
                                    else
                                      return null;
                                  },
                                  onChanged: (val){
                                    _dateEnded = val!;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "To expected year of graduation",
                                    labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                    suffixIcon: Icon(Icons.keyboard_arrow_down,size: 24,color: const Color(0xff0000FF),),
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
                        ],
                      ),
                    ),
                    SizedBox(height: height*0.1,),
                    CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "SAVE", buttonFontColor: Colors.white, onButtonPressed: () async{
                      if(_formKey.currentState!.validate()){
                        EducationEntryModel educationModel = EducationEntryModel(schoolName: _schoolName,areaOfStudy: _areaOfStudy,degree: _degree,
                            dateAttended: _dateAttended,dateEnded: _dateEnded);
                        onButtonPressed(educationModel);
                        Navigator.of(context).pop();
                      }
                    }, imageIcon: null,),
                    SizedBox(height: 20,)
                  ]),)
                ],
              ),
            ),
          );
        }
    );
  }
}
class EducationItem extends StatelessWidget {
  final String schoolName,dateString;
  final Function onButtonPressed;
  const EducationItem({required this.schoolName,required this.dateString,required this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height:size.height*0.15,
      width: size.width,
      decoration: BoxDecoration(color:const Color(0xffE6E6E6),borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.only(left:30,right:17),
      margin: EdgeInsets.only(bottom:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(schoolName,style: GoogleFonts.roboto(textStyle:TextStyle(color:const Color(0xff29283C),fontWeight: FontWeight.w700,fontSize: 14)),),
              SizedBox(height: 8,),
              Text(dateString,style: GoogleFonts.roboto(textStyle:TextStyle(color:const Color(0xff555555),fontWeight: FontWeight.normal,fontSize: 12)),),
            ],
          ),
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Icon(Icons.edit,
                      color: const Color(0xff5A5AFC), size: 12),
                ),
              ),
              SizedBox(
                width: 11,
              ),
              GestureDetector(
                onTap: (){
                  onButtonPressed();
                },
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: const Color(0xff5A5AFC),
                      size: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
