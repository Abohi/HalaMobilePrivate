
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/active_servicemodel/active_service_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/states_model/states_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/profile_description_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_service_type_page.dart';
import 'package:halawork/pages/dashboard_pages/widget/custom_drawer.dart';
import 'package:halawork/pages/dashboard_pages/widget/generic_response_dialog.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/providers/state_providers/navigation_provider.dart';
import 'package:halawork/providers/state_providers/tab_state_provider.dart';
import 'package:halawork/utils/constants.dart';
import 'package:halawork/utils/decimal_formatter.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:auto_route/auto_route.dart';
final stateModelStateProvider = StateProvider<StateModel?>((ref){
  return  null;
});
final lgaStateProvider = StateProvider<String?>((ref){
  return  null;
});
class CreateRequestPage extends HookWidget{
  const CreateRequestPage();

  @override
  Widget build(BuildContext context) {
    final userModelState = useProvider(userModelExtensionController);
    final serviceState = useProvider(serviceTypeControllerProvider);
    var tabRouteState = useProvider(tabRouteStateProvider);
    var budgetController = useTextEditingController();
    var stateModelState= useProvider(stateModelStateProvider);
    var lgaState = useProvider(lgaStateProvider);
    var selectedSubSevices = useState<List<String>?>([]);
    var  _subServices = useState<List<String>?>([]);
    var  _selectedService = useState<ActiveServiceModel?>(null);
    var _chipKey = useMemoized(() => GlobalKey<ChipsInputState>());
    var selectedSkills = useState<List<String>?>([]);
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final requestTitle = useState<String?>("");
    final requestDescription = useState<String?>("");
    var size = MediaQuery.of(context).size;
    var navigationProvider = useProvider(navigationStateProvider);
    return ProviderListener(
      provider: exceptionMessageProvider,
      onChange: (BuildContext context, StateController<CustomException?> customException,) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xff3E3E3E),
            content: Text(customException.state!.message!),
          ),
        );
      },
      child: ProgressHUD(
        backgroundColor:const Color(0xff0000FF),
        indicatorColor: Colors.white,
        child: Builder(
          builder:(BuildContext context){
            return Container(
              width: size.width,
              height: size.height,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 38,
                              ),
                              Theme(
                                data:
                                Theme.of(context).copyWith(splashColor: Colors.transparent),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  onSaved: (val)=>requestTitle.value=val,
                                  validator: (val){
                                    if(val!.isEmpty) return "Field must not be empty";
                                    else
                                      return null;
                                  },
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: const Color(0xff29283C), fontSize: 10)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Request title",
                                    labelStyle: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: const Color(0xff29283C), fontSize: 14)),
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: const Color(0xff0000FF), width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: const Color(0xffACACAC), width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 26,
                              ),
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
                                        onSaved: (val)=>requestDescription.value=val,
                                        validator: (val){
                                          if(val!.isEmpty) return "Field must not be empty";
                                          else
                                            return null;
                                        },
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xff29283C), fontSize: 10)),
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
                                      Spacer(),
                                      Text("maximum of 250-300 words",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: const Color(0xff29283C),
                                                  fontSize: 10))),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  DropdownSearch<StateModel>(
                                    mode: Mode.BOTTOM_SHEET,
                                    showSearchBox: true,
                                    hint: "Select your state",
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
                              SizedBox(height:26,),
                              stateModelState.state==null?SizedBox.shrink():DropdownSearch<String>(
                                mode: Mode.BOTTOM_SHEET,
                                showSearchBox: true,
                                items: stateModelState.state!.lgas,
                                label: "Select your LGA",
                                hint: "Select your LGA",
                                itemAsString: (String lga) => lga,
                                onChanged: (state)=>lgaState.state=state,
                                selectedItem: lgaState.state==null?"Select your LGA":lgaState.state,
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownSearch<ActiveServiceModel>(
                                    mode: Mode.BOTTOM_SHEET,
                                    showSearchBox: true,
                                    items: userModelState?.serviceList==null?[]:userModelState?.serviceList,
                                    label: "Select your main service",
                                    hint: "Select your main service",
                                    itemAsString: (ActiveServiceModel service) => service.service.toString(),
                                    onChanged: (value){

                                      _selectedService.value=value;
                                      _subServices.value =value?.subservices;
                                    },
                                    selectedItem: _selectedService.value==null?ActiveServiceModel(service: "Select your main service", isDefault: false, icon: "", subservices: []):userModelState?.serviceList?.firstWhere((element) => element.service==_selectedService.value?.service),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 22,
                                      ),
                                      Text("*Required",
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: const Color(0xff29283C),
                                                  fontSize: 10))),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top:26),
                                  child:Text("Select Sub category",style: TextStyle(fontSize: 12,color: const Color(0xff29283C),fontWeight: FontWeight.w700),)
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 5 / 2,
                      crossAxisCount: 2,
                      children: getGridItems(
                          subService: _subServices.value,
                          getIsCheckedValue: (
                              String subservice,
                              ValueNotifier<bool> picked,
                              ) {
                            print("SubService: $subservice, checked: $picked");
                            if (picked.value) {
                              selectedSubSevices.value?.add(subservice);
                            } else if (!picked.value) {
                              bool? subserviceExist =selectedSubSevices.value?.contains(subservice);
                              subserviceExist = subserviceExist??false;
                              if(subserviceExist){
                                selectedSubSevices.value?.remove(subservice);
                              }
                            }
                          }),
                    ),
                  ),
                  serviceState.when(data: (data){
                    return SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      sliver: SliverToBoxAdapter(
                        child: ChipsInput<String?>(
                          key: _chipKey,
                          keyboardAppearance: Brightness.dark,
                          textCapitalization: TextCapitalization.words,
                          enabled: true,
                          maxChips: data.skillModel!.skills.length,
                          textStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: const Color(0xff5A5AFC),
                                  fontSize: 14)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Start typing your skills",
                            labelStyle: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: const Color(0xff29283C),
                                    fontSize: 14)),
                            contentPadding: const EdgeInsets.only(
                                left: 9.0, bottom: 5.0, top: 7.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color(0xff0000FF),
                                  width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color(0xffACACAC),
                                  width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          findSuggestions: (String query) {
                            if (query.length != 0) {
                              var lowercaseQuery = query.toLowerCase();
                              return data.skillModel!.skills.where((skills) {
                                return skills!.toLowerCase().contains(query.toLowerCase());
                              }).toList(growable: false)
                                ..sort((a, b) => a!
                                    .toLowerCase()
                                    .indexOf(lowercaseQuery)
                                    .compareTo(b!.toLowerCase().indexOf(lowercaseQuery)));
                            } else {
                              return const <String>[];
                            }
                          },
                          onChanged: (data) {
                            for (int i = 0; i < data.length; i++) {
                              selectedSkills.value?.add(data[i]!);
                            }
                            selectedSkills.value?.toSet().toList();
                          },
                          chipBuilder: (context, state, skill) {
                            return InputChip(
                              key: ObjectKey(skill),
                              labelStyle: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff5A5AFC),
                                      fontSize: 10)),
                              deleteIcon: Icon(
                                Icons.clear,
                                color: const Color(0xff5A5AFC),
                                size: 16,
                              ),
                              backgroundColor: const Color(0xffEBEBFF),
                              label: Text(skill!),
                              onDeleted: () {
                                selectedSkills.value!.remove(skill);
                                return state.deleteChip(skill);
                              },
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                            );
                          },
                          suggestionBuilder: (context, state, skill) {
                            return ListTile(
                              key: ObjectKey(skill),
                              title: Text(skill!),
                              onTap: () => state.selectSuggestion(skill),
                            );
                          },
                        ),
                      ),
                    );
                  }, loading: (){
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }, error: (object,stacktrace){
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(stacktrace.toString()),
                      ),
                    );
                  }),
                  SliverPadding(
                      padding: EdgeInsets.only(top:26,left:17,right:17),
                      sliver:SliverToBoxAdapter(
                        child: Theme(
                          data:
                          Theme.of(context).copyWith(splashColor: Colors.transparent),
                          child: TextField(
                            controller: budgetController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [DecimalFormatter()],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: const Color(0xff29283C), fontSize: 10)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Enter your budget",
                              labelStyle: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: const Color(0xff29283C), fontSize: 14)),
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: const Color(0xff0000FF), width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: const Color(0xffACACAC), width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  SliverPadding(
                      padding: EdgeInsets.only(top:63,right:17,left:17),
                      sliver:SliverToBoxAdapter(
                        child:  CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                          buttonTitle: "SUBMIT REQUEST",
                          buttonFontColor: Colors.white,
                          onButtonPressed: () async{
                            if(budgetController.text.isEmpty){
                              return Fluttertoast.showToast(msg: "Fields cannot be empty",toastLength: Toast.LENGTH_LONG);
                            }

                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                             if(userModelState!.userModel.isSeller){
                               return Fluttertoast.showToast(msg: "To post a request you need to become a Buyer",toastLength: Toast.LENGTH_LONG);
                             }else{
                               final progress = ProgressHUD.of(context);
                               progress!.showWithText('Sending Request...');
                               CreateRequestModel createRequestModel = CreateRequestModel(service: _selectedService.value!.service!, subServices: selectedSubSevices.value!, skills: selectedSkills.value!, serviceId: _selectedService.value!.serviceId!, state: stateModelState.state!.state!, localGovt: lgaState.state!, userId: context.read(authControllerProvider)!.uid, requestStatus: true, title:requestTitle.value! , description: requestDescription.value!, budget: budgetController.text, date: DateTime.now().toString());
                               await context.read(userModelExtensionController.notifier).createRequest(createRequestModel);
                               if(context.read(exceptionMessageProvider).state!=null){
                                 progress.dismiss();
                                 context.read(exceptionMessageProvider).state=null;
                                 return "";
                               }
                               progress.dismiss();
                               await showGeneralDialog(
                                   context: context,
                                   barrierDismissible: true,
                                   barrierLabel: MaterialLocalizations.of(context)
                                       .modalBarrierDismissLabel,
                                   barrierColor: Colors.black45,
                                   transitionDuration: const Duration(milliseconds: 200),
                                   pageBuilder: (BuildContext buildContext,
                                       Animation animation,
                                       Animation secondaryAnimation) {
                                     return GenericResponseDialog(onBottonPressed: (){
                                       tabRouteState.state?.setActiveIndex(3);
                                       navigationProvider.state=3;
                                       Navigator.of(context).pop();
                                     },text1: "Request posted",text2: "Successfully",btnText: "MANAGE REQUEST",);
                                   });
                             }
                            }
                          }, imageIcon: null,),
                      )
                  ),
                  SliverToBoxAdapter(
                    child:SizedBox(height: size.height * 0.1),
                  )

                ],
              ),
            );
          }
        ),
      ),
    );
  }
  List<Widget> getGridItems(
      {required
      List<String>? subService,
        required
        void Function(String subservice, ValueNotifier<bool> picked) getIsCheckedValue}) {
    if(subService!=null){
      return subService
          .map((e) => GridItem(
          isChecked: (service, checkedValue) {
            print("isChecked: $checkedValue, SubService: $service");
            getIsCheckedValue(service, checkedValue);
          },
          subService: e))
          .toList();
    }
    return [];
  }
}





