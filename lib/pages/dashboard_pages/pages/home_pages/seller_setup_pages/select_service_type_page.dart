import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/providers/state_providers/seller_setup_provider.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/firebase_error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
List<String>addedSubServices=[];
class SelectServiceTypePage extends HookWidget {
  final bool isOrganization;
  const SelectServiceTypePage(this.isOrganization);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final selectedSkills = useState<List<String>?>([]);
    final  selectedSubSevices = useState<List<String>?>([]);
    final  _subServices = useState<List<String>?>([]);
    final  _selectedService = useState<ServiceModel?>(null);
    final serviceState = useProvider(serviceTypeControllerProvider);
    final _chipKey = useMemoized(() => GlobalKey<ChipsInputState>());
    return serviceState.when(
      data: (serviceTypeModel) =>
          Scaffold(body: SafeArea(
            child: WillPopScope(
              onWillPop: ()async{
                context.popRoute();
                return true;
              },
              child: Container(
                width: size.width,
                height: size.height,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      elevation: 0,
                      title: isOrganization?Text(
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
                            "3/10",
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
                        delegate: SliverChildListDelegate(
                          [
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Text("What work do you do?",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: const Color(0xff29283C)))),
                            SizedBox(
                              height: size.height * 0.08,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownSearch<ServiceModel>(
                                  mode: Mode.BOTTOM_SHEET,
                                  showSearchBox: true,
                                  items: serviceTypeModel.serviceModel,
                                  label: "Select your main service",
                                  emptyBuilder: (context,error){
                                    if(error!=null)
                                      return Center(
                                        child: Text("Invalid Selection",style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: const Color(0xff29283C),decoration:TextDecoration.none)),),
                                      );
                                    return Center(
                                      child: Text("Invalid Selection",style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: const Color(0xff29283C),decoration: TextDecoration.none)),),
                                    );
                                  },
                                  itemAsString: (ServiceModel service) => service.name.toString(),
                                  onChanged: (value){
                                    _selectedService.value=value;
                                    addedSubServices.clear();
                                    _subServices.value =value?.value;
                                  },
                                  selectedItem: _selectedService.value==null?ServiceModel(name: "Select your main service", isDafault: false, icon: "", value: []):serviceTypeModel.serviceModel?.firstWhere((element) => element.name==_selectedService.value?.name),
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
                            SizedBox(height: 42,),
                            Text(
                              "Select Sub category",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: const Color(0xff29283C),
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 20,)
                          ]
                        ),
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
                                addedSubServices.add(subservice);
                                selectedSubSevices.value=addedSubServices;
                              } else if (!picked.value) {
                                bool? subserviceExist =selectedSubSevices.value?.contains(subservice);
                                subserviceExist = subserviceExist??false;
                                if(subserviceExist){
                                  addedSubServices.remove(subservice);
                                  selectedSubSevices.value=addedSubServices;
                                }
                              }
                            }),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      sliver: SliverToBoxAdapter(
                        child: ChipsInput<String?>(
                          key: _chipKey,
                          keyboardAppearance: Brightness.dark,
                          textCapitalization: TextCapitalization.words,
                          enabled: true,
                          maxChips: serviceTypeModel.skillModel!.skills.length,
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
                              if(serviceTypeModel.skillModel!.skills.contains(query))
                                return ["invalid selection"];
                              return serviceTypeModel.skillModel!.skills.where((skills) {
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
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.15, bottom: 20, left: 17, right: 17),
                      sliver: SliverToBoxAdapter(
                        child: CustomButtonSignup(
                            buttonBg: const Color(0xff0000FF),
                            buttonTitle: "NEXT  >",
                            buttonFontColor: Colors.white,
                            onButtonPressed: () async {
                              var uniqueSkills = [
                                ...{...?selectedSkills.value}
                              ];
                              if(uniqueSkills.length<3){
                                await Fluttertoast.showToast(msg: "Please enter a minimum of 3 skills",toastLength: Toast.LENGTH_LONG);
                              }else{
                                context.read(sellerSetupStateProvider).state=context.read(sellerSetupStateProvider).state?.copyWith(saveSkills: uniqueSkills,
                                    saveService: _selectedService.value!.name,saveIcon:_selectedService.value!.icon ,saveServiceType:_selectedService.value!.isDafault,saveSubService: selectedSubSevices.value,serviceId:_selectedService.value?.serviceId);
                                context.router.navigate(SelectExpertiseLevelRoute());
                              }
                            }, imageIcon: null,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
      loading: () => Scaffold(body: Container(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)))),
      error: (error, _) => Center(
        child: FirebaseErrorWidget(
          message:
          error is CustomException ? error.message! : 'Something went wrong!',
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

class GridItem extends HookWidget{
  String subService;
  void Function(String subservice, ValueNotifier<bool> picked) isChecked;

  GridItem({required this.isChecked, required this.subService});

  @override
  Widget build(BuildContext context) {
    final value = useState<bool>(false);
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        value.value = !value.value;
        isChecked(subService, value);
      },
      child: Container(
        width: size.width,
        height: size.height * 0.5,
        padding: EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                activeColor: const Color(0xff0000FF),
                value: value.value,
                onChanged: (val) {

                }),
            SizedBox(
              width: size.width * 0.35,
              child: Text(
                subService,
                style: GoogleFonts.roboto(
                    textStyle:
                    TextStyle(fontSize: 12, color: const Color(0xff29283C))),
              ),
            )
          ],
        ),
      ),
    );
  }
}



