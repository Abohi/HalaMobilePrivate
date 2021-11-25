import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/models/seller_setup_models/achievement_entry_model/achievement_entry_model.dart';
import 'package:halawork/providers/change_notifier_providers/achievement_entry_list_provider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/CustomButtonSignupSvg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class EditAchievementPage extends HookWidget {
  const EditAchievementPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final achievementEntryListChangeNotifier = useProvider(achievementEntryChangeNotifierProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Edit Achievement",
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
        backgroundColor: Colors.white,
        body: ProgressHUD(
          backgroundColor: const Color(0xff0000FF),
          indicatorColor:Colors.white,
          child: Builder(
            builder: (context){
              return Container(
                width: size.width,
                height: size.height,
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(height: size.height*0.04,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: Text("Achievements",style:
                          GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: const Color(0xff29283C)))),
                        ),
                        SizedBox(height: 12,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: Text("Add any achievements merited over the years of working or studying",style:
                          GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: const Color(0xff29283C)))),
                        ),
                        SizedBox(height: size.height*0.08,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: CustomButtonSignupSvg(isIconLeft: true,icon:Icon(Icons.add,color:Color(0xff0000FF),size: 24,),buttonBg: Colors.white, buttonTitle: "ADD ACHIEVEMENTS", buttonFontColor: const Color(0xff0000FF),isBorder: true,onButtonPressed: (){
                            _modalBottomSheetMenu(context: context,onButtonPressed: (AchievementEntryModel entryModel){
                              achievementEntryListChangeNotifier.addAchievementEntryModel(entryModel);
                            });
                          },),
                        ),
                      ]),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 30,),
                    ),
                    achievementEntryListChangeNotifier.achievementEntryModelList.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):SliverList(
                      delegate: SliverChildListDelegate(
                          achievementEntryListChangeNotifier.achievementEntryModelList.asMap().keys.map((index) => EducationItem(schoolName:  "${achievementEntryListChangeNotifier.achievementEntryModelList[index].achievementName}",dateString: "${achievementEntryListChangeNotifier.achievementEntryModelList[index].achievementDescription}",
                            onButtonPressed: (){
                              achievementEntryListChangeNotifier.removeAchievementEntryModel(index);
                            },)).toList()
                      ),
                    ),
                    achievementEntryListChangeNotifier.achievementEntryModelList.isEmpty?SliverToBoxAdapter(child: SizedBox(height: size.height*0.15,)):SliverToBoxAdapter(child: SizedBox.shrink()),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 30,),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "UPDATE", buttonFontColor: Colors.white, onButtonPressed: ()async{
                          final progress = ProgressHUD.of(context);
                          progress!.showWithText('Updating Achievement...');
                          await context.read(userRepositoryProvider).updateAchievement(achievementEntryListChangeNotifier.achievementEntryModelList);
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
      ),
    );
  }
  void _modalBottomSheetMenu({required BuildContext context,required void onButtonPressed(AchievementEntryModel achievementModel)}){
    var size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    String? _nameAchievement,_achievementDescription;
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
                      "Add Achievement",
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
                                  style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10)),
                                  validator: (val){
                                    if(val!.isEmpty) return "Field must not be empty";
                                    else
                                      return null;
                                  },
                                  onChanged: (val){
                                    _nameAchievement = val;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Name Achievement",
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
                                      _achievementDescription = val;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: "Achievement description",
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
                        ],
                      ),
                    ),
                    SizedBox(height: height*0.10,),
                    CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "SAVE", buttonFontColor: Colors.white, onButtonPressed: () async{
                      if(_formKey.currentState!.validate()){
                        AchievementEntryModel achievementModel= AchievementEntryModel(achievementName: _nameAchievement,achievementDescription: _achievementDescription);
                        onButtonPressed(achievementModel);
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
