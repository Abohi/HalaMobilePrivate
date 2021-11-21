import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_expertise_level_page.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:auto_route/auto_route.dart';
class EditServicePagePreferencePage extends HookWidget {
  const EditServicePagePreferencePage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final isEntryLevel=useState<bool>(false);
    final isIntermediateLevel = useState<bool>(false);
    final  isProLevel = useState<bool>(false);
    final  clicked = useState<bool>(false);
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          elevation: 0,
          title:Text(
            "Edit Expertise",
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
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child:  SingleChildScrollView(
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
                  context.router.navigate(EditServiceRoute(preference: levelHolder));
                }, imageIcon: null,):CustomButtonSignup(buttonBg: const Color(0xffE6E6E6), buttonTitle: "NEXT  >", buttonFontColor: const Color(0xff555555), onButtonPressed: (){
                }, imageIcon: null,),
                SizedBox(height: size.height*0.04,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




