import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/providers/state_providers/seller_setup_provider.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class SelectExpertiseLevelPage extends HookWidget {
  const SelectExpertiseLevelPage();

  @override
  Widget build(BuildContext context) {
    final isEntryLevel=useState<bool>(false);
    final isIntermediateLevel = useState<bool>(false);
    final  isProLevel = useState<bool>(false);
    final  clicked = useState<bool>(false);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          context.popRoute();
          return false;
        },
        child: Scaffold(
          appBar:AppBar(
            elevation: 0,
            title: context.read(sellerSetupStateProvider).state!.sellerType=="Organization"?Text(
              "Profile Setup",
              style: GoogleFonts.josefinSans(
                  textStyle: TextStyle(
                      color: const Color(0xff3E3E3E),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ):Row(
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
                  "4/10",
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
          body: WillPopScope(
            onWillPop: ()async{
              context.popRoute();
              return false;
            },
            child: Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height*0.04,),
                    Text("What is your expertise level?",style:
                    GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: const Color(0xff29283C)))),
                    SizedBox(height: size.height*0.05,),
                    ChoiceCard(choiceTitle2: "Experience level from 1-2 years", choiceTitle: "ENTRY LEVEL", selected: isEntryLevel.value, onTap: (isClicked) {
                      isEntryLevel.value = true;
                      isIntermediateLevel.value = false;
                      isProLevel.value = false;
                      clicked.value = isClicked;

                    },),
                    SizedBox(height:21,),
                    ChoiceCard(choiceTitle2: "Experience level from 3-7 years", choiceTitle: "INTERMEDIATE LEVEL", selected: isIntermediateLevel.value, onTap: (isClicked) {
                      isEntryLevel.value = false;
                      isIntermediateLevel.value = true;
                      isProLevel.value = false;
                      clicked.value = isClicked;

                    },),
                    SizedBox(height:21,),
                    ChoiceCard(choiceTitle2: "Experience level from 7 years and over", choiceTitle: "PRO LEVEL", selected: isProLevel.value, onTap: (isClicked) {
                      isEntryLevel.value = false;
                      isIntermediateLevel.value = false;
                      isProLevel.value = true;
                      clicked.value = isClicked;
                      print("pro level");
                    },),
                    SizedBox(height: size.height*0.08,),

                    clicked.value?CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "NEXT  >", buttonFontColor: Colors.white, onButtonPressed: (){
                      String levelHolder="";
                      if(isEntryLevel.value){
                        levelHolder = "ENTRY LEVEL";
                      }else if(isIntermediateLevel.value){
                        levelHolder = "INTERMEDIATE LEVEL";
                      }else if(isProLevel.value){
                        levelHolder = "PRO LEVEL";
                      }
                      context.read(sellerSetupStateProvider).state = context.read(sellerSetupStateProvider).state!.copyWith(saveExpertiseType: levelHolder);
                      if(context.read(sellerSetupStateProvider).state!.sellerType=="Organization"){
                        context.router.navigate(OrgDetailsEntryFormRoute());
                      }else{
                        context.router.navigate(EducationEntryRoute());
                      }

                    }, imageIcon: null,):CustomButtonSignup(buttonBg: const Color(0xffE6E6E6), buttonTitle: "NEXT  >", buttonFontColor: const Color(0xff555555), onButtonPressed: (){

                    }, imageIcon: null,),
                    SizedBox(height: size.height*0.04,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class ChoiceCard extends HookWidget {
   String choiceTitle,choiceTitle2;
  Function(bool isClicked) onTap;
   bool selected;
 ChoiceCard({required this.choiceTitle2, required this.choiceTitle,required this.onTap,required this.selected });
  var isSelected = useState(false);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    isSelected.value = selected;
    return GestureDetector(
      onTap: (){
        isSelected.value = !isSelected.value;
        if (onTap != null) onTap(true);
      },
      child: Container(
        width: width,
        height: height*0.20,
        decoration: BoxDecoration(color: selected?const Color(0xff9393FF):const Color(0xffE6E6E6),borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: height*0.03,),
            Center(child: Text(choiceTitle,style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color:selected?Colors.white: const Color(0xff555555))),),),
            SizedBox(height: 9,),
            Center(child: Text(choiceTitle2,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,color:selected?Colors.white: const Color(0xff555555))),),),
            SizedBox(height: height*0.03,),
          ],
        ),
      ),
    );
  }
}