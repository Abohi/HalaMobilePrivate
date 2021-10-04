import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/states_model/states_model.dart';
import 'package:halawork/providers/change_notifier_providers/location_entrylist_provider.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/providers/state_providers/seller_setup_provider.dart';
import 'package:halawork/utils/constants.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/CustomButtonSignupSvg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
final stateModelStateProvider = StateProvider<StateModel?>((ref){
  return  null;
});
final lgaStateProvider = StateProvider<String?>((ref){
  return  null;
});
final streetAddressStateProvider = StateProvider<String?>((ref){
  return  null;
});

class AddLocationOrganizationEntryPage extends HookWidget {
  const AddLocationOrganizationEntryPage();

  @override
  Widget build(BuildContext context) {
    final locationEntryListChangeNotifier = useProvider(locationEntryChangeNotifierProvider);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title:Text(
            "Profile Setup",
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
        body: ProviderListener(
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
                            child: Text("What is your location?",style:
                            GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: const Color(0xff29283C)))),
                          ),
                          SizedBox(height: 12,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17),
                            child: Text("Please provide your location as this helps in matching you with the right request. Up to 12 location of physical branches if available",style:
                            GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: const Color(0xff29283C)))),
                          ),
                          SizedBox(height: size.height*0.08,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17),
                            child: CustomButtonSignupSvg(isIconLeft: true,icon:Icon(Icons.add,color:Color(0xff0000FF),size: 24,),buttonBg: Colors.white, buttonTitle: "ADD LOCATION", buttonFontColor: const Color(0xff0000FF),isBorder: true,onButtonPressed: (){
                              context.refresh(stateModelStateProvider);
                              context.refresh(lgaStateProvider);
                              context.refresh(streetAddressStateProvider);
                              _modalBottomSheetMenu(context: context,onButtonPressed: (LocationModel locationModel){
                                locationEntryListChangeNotifier.addLocationEntryModel(locationModel);
                              });
                            },),
                          ),
                        ]),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 30,),
                      ),
                      locationEntryListChangeNotifier.locationEntryModelList.isEmpty?SliverToBoxAdapter(child: SizedBox.shrink()):SliverList(
                        delegate: SliverChildListDelegate(
                            locationEntryListChangeNotifier.locationEntryModelList.asMap().keys.map((index) => LocationItem(streetAddress: locationEntryListChangeNotifier.locationEntryModelList[index].streetAddress,state:locationEntryListChangeNotifier.locationEntryModelList[index].state,localGovt:locationEntryListChangeNotifier.locationEntryModelList[index].localGovt ,
                              onButtonPressed: (){
                                locationEntryListChangeNotifier.removeLocationEntryModel(index);
                              },)).toList()
                        ),
                      ),
                      locationEntryListChangeNotifier.locationEntryModelList.isEmpty?SliverToBoxAdapter(child: SizedBox(height: size.height*0.15,)):SliverToBoxAdapter(child: SizedBox.shrink()),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 30,),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 28,)),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "NEXT  >", buttonFontColor: Colors.white, onButtonPressed: ()async{
                            final progress = ProgressHUD.of(context);
                            progress!.showWithText('Registering Seller...');

                            context.read(sellerSetupStateProvider).state = context.read(sellerSetupStateProvider).state!.copyWith(locationModel:locationEntryListChangeNotifier.locationEntryModelList);
                            await context.read(userControllerProvider.notifier).completeSellerProfileSetup(context.read(sellerSetupStateProvider).state!);
                            progress.dismiss();
                            if(context.read(exceptionMessageProvider).state==null){
                              await Fluttertoast.showToast(msg: "Seller Information saved successfully",toastLength: Toast.LENGTH_LONG);
                              context.router.navigate(SellerSetupCompleteRoute());
                            }else{
                              context.read(exceptionMessageProvider).state =null;
                            }
                          }, imageIcon: null,),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 30,),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  void _modalBottomSheetMenu({required BuildContext context,required void onButtonPressed(LocationModel locationModel)}){
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder){
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
         return Consumer(builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
           var stateModelState= watch(stateModelStateProvider);
           var lgaState = watch(lgaStateProvider);
           var streetAddressState = watch(streetAddressStateProvider);
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
                     title:  Text(
                       "ADD LOCATION",
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
                     Form(
                       key: _formKey,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(height: 30,),
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
                                 onChanged: (state)=>stateModelState.state=state,
                                 selectedItem: stateModelState.state==null?StateModel(state: "Select your state", lgas: []):stateModelState.state,
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
                             items: stateModelState.state!.lgas,
                             label: "Select your LGA",
                             itemAsString: (String lga) => lga,
                             onChanged: (state)=>lgaState.state=state,
                             selectedItem: lgaState.state==null?"Select your LGA":lgaState.state,
                           ),
                           const SizedBox(height: 22,),
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
                                     streetAddressState.state = val;
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
                           SizedBox(height: height*0.1,),
                           CustomButtonSignup(buttonBg: const Color(0xff0000FF), buttonTitle: "SAVE", buttonFontColor: Colors.white, onButtonPressed: () async{
                             if(_formKey.currentState!.validate()){
                               _formKey.currentState!.save();
                               LocationModel locationModel = LocationModel(streetAddress: streetAddressState.state!, state:stateModelState.state!.state!, localGovt: lgaState.state!,);
                               onButtonPressed(locationModel);
                               Navigator.of(context).pop();
                             }

                           }, imageIcon: null,),
                         ],
                       ),
                     ),
                     SizedBox(height: 20,)
                   ]),)
                 ],
               ),
             ),
           );
         },

         );
        }
    );
  }
}



class LocationItem extends StatelessWidget {
  final String streetAddress,state,localGovt;
  final Function onButtonPressed;
  const LocationItem({required this.streetAddress,required this.state,required this.localGovt,required this.onButtonPressed});
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
              Text(streetAddress,style: GoogleFonts.roboto(textStyle:TextStyle(color:const Color(0xff29283C),fontWeight: FontWeight.w700,fontSize: 14)),),
              SizedBox(height: 8,),
              Text("${localGovt}, ${state}",style: GoogleFonts.roboto(textStyle:TextStyle(color:const Color(0xff555555),fontWeight: FontWeight.normal,fontSize: 12)),),
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