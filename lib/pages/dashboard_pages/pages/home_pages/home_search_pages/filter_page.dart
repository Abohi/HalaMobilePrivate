import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/models/states_model/states_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/addlocation_organization_entry_page.dart';
import 'package:halawork/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
final subserviceProvider = StateProvider<String?>((ref){
  return  null;
});
class FilterPage extends HookWidget {
  final List<String>subServices;
  const FilterPage({required this.subServices});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var subServiceState = useProvider(subserviceProvider);
    var selectedRadioRating=useState<int>(0);
    var selectedRadioType=useState<int>(0);
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          elevation: 0,
          title: Text(
            "Filters",
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
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("By Location", style: GoogleFonts.roboto(textStyle: TextStyle(
                        color: const Color(0xFF29283C),
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    ))),
                    const SizedBox(height: 15,),
                    DropdownSearch<StateModel>(
                      mode: Mode.BOTTOM_SHEET,
                      showSearchBox: true,
                      items: nigeria.map((e) => StateModel.fromJson(e)).toList(),
                      label: "Select your state",
                      itemAsString: (StateModel state) => state.state.toString(),
                      onChanged: (state)=>context.read(stateModelStateProvider).state=state,
                      selectedItem: context.read(stateModelStateProvider).state==null?StateModel(state: "Select your state", lgas: []):context.read(stateModelStateProvider).state,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: 20,),
              ),
              SliverToBoxAdapter(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("By Category", style: GoogleFonts.roboto(textStyle: TextStyle(
                        color: const Color(0xFF29283C),
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    ))),
                    const SizedBox(height: 15,),
                    DropdownSearch<String>(
                      mode: Mode.BOTTOM_SHEET,
                      showSearchBox: true,
                      items: subServices,
                      label: "Select Category",
                      itemAsString: (String item) => item,
                      onChanged: (state)=>subServiceState.state=state,
                      selectedItem: subServiceState.state==null?"Select Category":subServiceState.state,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20,)),
              SliverToBoxAdapter(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("By Rating", style:  GoogleFonts.roboto(textStyle: TextStyle(
                        color: Color(0xFF29283C),
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    ))),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadioRating.value,
                          onChanged: (int? val){
                            selectedRadioRating.value = val!;
                          },
                          autofocus: true,
                          activeColor: Color(0xff0000FF),
                        ),
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ), onRatingUpdate: (double value) {

                        },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedRadioRating.value,
                          onChanged: (int? val){
                            selectedRadioRating.value = val!;
                          },
                          autofocus: true,
                          activeColor: Color(0xff0000FF),
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ), onRatingUpdate: (double value) {

                        },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 3,
                          groupValue: selectedRadioRating.value,
                          onChanged: (int? val) {
                            selectedRadioRating.value = val!;
                          },
                          autofocus: true,
                          activeColor: Color(0xff0000FF),
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ), onRatingUpdate: (double value) {

                        },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 4,
                          groupValue: selectedRadioRating.value,
                          onChanged: (int? val) {
                            selectedRadioRating.value = val!;
                          },
                          autofocus: true,
                           activeColor: Color(0xff0000FF),
                        ),
                        RatingBar.builder(
                          initialRating: 2,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ), onRatingUpdate: (double value) {

                        },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 5,
                          groupValue: selectedRadioRating.value,
                          onChanged: (int? val) {
                            selectedRadioRating.value = val!;
                          },
                          autofocus: true,
                        activeColor: Color(0xff0000FF),
                        ),
                        RatingBar.builder(
                          initialRating: 1,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ), onRatingUpdate: (double value) {

                        },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20,)),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("By Freelancer Type", style: GoogleFonts.roboto(textStyle: TextStyle(
                        color: Color(0xFF29283C),
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadioType.value,
                          onChanged: (int? val) {
                            selectedRadioType.value = val!;
                          },
                          activeColor: Color(0xff0000FF),
                        ),
                        Text("Individual", style: GoogleFonts.roboto(textStyle: TextStyle(
                            color: Color(0xFF29283C),
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        ))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedRadioType.value,
                          onChanged: (int? val) {
                            selectedRadioType.value = val!;
                          },
                          activeColor: Color(0xff0000FF),
                        ),
                        Text("Company", style: GoogleFonts.roboto(textStyle: TextStyle(
                            color: Color(0xFF29283C),
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                        ))),
                      ],
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child:  SizedBox(height: size.height*0.1,),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomButtonOutLine(buttonLabel: "CLEAR",onButtonPressed: (){

                      },),
                    ),
                    SizedBox(width: 24,),
                    Expanded(
                      child: CustomButtonFilled(buttonLabel: "APPLY",onButtonPressed: (){

                      }),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child:  SizedBox(height: 15,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//message seller button
class CustomButtonOutLine extends StatelessWidget {
  final Function onButtonPressed;
  final String buttonLabel;
  const CustomButtonOutLine({required this.onButtonPressed,required this.buttonLabel});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width*0.43,
        height: size.height * 0.08,
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xff0000FF))),
        child: Center(
          child: Text(
            buttonLabel,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: const Color(0xff0000FF),
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}

//offer seller the work button
class CustomButtonFilled extends StatelessWidget {
  final Function onButtonPressed;
  final String buttonLabel;
  const CustomButtonFilled({required this.onButtonPressed,required this.buttonLabel});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width*0.43,
        height: size.height * 0.08,
        decoration: BoxDecoration(color: Color(0xff0000FF),
          borderRadius: BorderRadius.circular(4),),
        child: Center(
          child: Text(
            buttonLabel,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color:Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}


