import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/seller_setup_model/seller_setup_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/widgets/choice_card_widget.dart';
import 'package:halawork/providers/state_providers/seller_setup_provider.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class SelectSellerTypePage extends HookWidget{
  const SelectSellerTypePage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final isIndividual=useState(false);
    final isOrganization = useState(false);
    final  isClicked = useState(false);
    final sellerSetUpState = useProvider(sellerSetupStateProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: ()async{
            context.popRoute();
            return true;
          },
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
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: const Color(0xff3E3E3E),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Text(
                      "1/10",
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
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: size.height*0.06,),
                    Text("How would you like us to help you?",style:
                    GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: const Color(0xff29283C)))),
                    SizedBox(height: size.height*0.06,),
                    ChoiceCard(choiceImage: "assets/images/indiv_icon.png", choiceTitle: "AS AN INDIVIDUAL", selected: isIndividual.value, onTap: (clicked) {
                      isIndividual.value = true;
                      isOrganization.value = false;
                      isClicked.value= clicked;
                    },),
                    SizedBox(height: size.height*0.10,),
                    ChoiceCard(choiceImage: "assets/images/org_icon.png", choiceTitle: "AS AN ORGANISATION", selected: isOrganization.value, onTap: (clicked) {
                      isIndividual.value = false;
                      isOrganization.value = true;
                      isClicked.value= clicked;
                    },),
                    SizedBox(height: size.height*0.08,),

                    isClicked.value?CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "NEXT  >", buttonFontColor: Colors.white, onButtonPressed: ()async{
                      if(isIndividual.value){
                        sellerSetUpState.state=SellerSetupModel(sellerType:"Individual" );
                        context.router.navigate(SellerBasicInfoEntryRoute());
                      }
                      else if(isOrganization.value){
                        sellerSetUpState.state=SellerSetupModel(sellerType:"Organization");
                        context.router.navigate(SelectServiceTypeRoute(isOrganization: true));
                      }
                    }, imageIcon: null,):CustomButtonSignup(buttonBg: const Color(0xffE6E6E6), buttonTitle: "NEXT  >", buttonFontColor: const Color(0xff555555), onButtonPressed: (){

                    }, imageIcon: null,),
                    SizedBox(height: size.height*0.04,)
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
