import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_service_type_page.dart';
import 'package:halawork/providers/general_providers/general_providers.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/utils/constants.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/firebase_error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class EditServicePage extends HookWidget {
  final String preference;
  const EditServicePage({required this.preference});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                          SliverAppBar(
                            elevation: 0,
                            title:Text(
                              "Edit Service",
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
                                          itemAsString: (ServiceModel service) => service.name.toString(),
                                          onChanged: (value){
                                            _selectedService.value=value;
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
                          SliverPadding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.15, bottom: 20, left: 17, right: 17),
                            sliver: SliverToBoxAdapter(
                              child: CustomButtonSignup(
                                buttonBg: const Color(0xff0000FF),
                                buttonTitle: "NEXT  >",
                                buttonFontColor: Colors.white,
                                onButtonPressed: () async {
                                  if(_selectedService.value==null ||selectedSubSevices.value==null){
                                    return await Fluttertoast.showToast(msg: "Please select a service and subservice",toastLength: Toast.LENGTH_LONG);
                                  }
                                  final progress = ProgressHUD.of(context);
                                  progress!.showWithText('Updating Service...');
                                  var firestoreReference = context.read(firebaseFirestoreProvider);
                                  UserModel userModel =  context.read(userControllerProvider)!.userModel;
                                  String previousOfferedServiceId = userModel.serviceId!;
                                  List<String> previousOfferedSubServices = userModel.subServices!;
                                  DocumentReference previousOfferedServiceRef = firestoreReference.collection(activeServiceCollection).doc(previousOfferedServiceId);
                                  for(int i=0;i<previousOfferedSubServices.length;i++){
                                    previousOfferedServiceRef.collection(previousOfferedSubServices[i]).doc(context.read(authControllerProvider)!.uid).delete();
                                  }
                                  DocumentReference currentlyOfferedServiceRef = context.read(firebaseFirestoreProvider).collection(activeServiceCollection).doc(_selectedService.value?.serviceId);
                                  var genericBatch = firestoreReference.batch();
                                  currentlyOfferedServiceRef.get().then((value) async{
                                    if(value.exists){
                                      await currentlyOfferedServiceRef.update({
                                        "subservices": FieldValue.arrayUnion(selectedSubSevices.value!)
                                      });

                                      selectedSubSevices.value!.forEach((element) {
                                        genericBatch.set(
                                            currentlyOfferedServiceRef.collection(element).doc(context.read(authControllerProvider)!.uid),
                                            {
                                              "userid": context.read(authControllerProvider)!.uid,
                                              "isActiveSubservice":true,
                                            },SetOptions(merge: true));
                                      });
                                    }else{
                                      await currentlyOfferedServiceRef.set({
                                        "service":_selectedService.value!.name,
                                        "isDefault": _selectedService.value!.isDafault,
                                        "icon":_selectedService.value!.icon,
                                        "subservices":
                                        FieldValue.arrayUnion(selectedSubSevices.value!)
                                      }, SetOptions(merge: true));
                                      selectedSubSevices.value!.forEach((element) {
                                        genericBatch.set(
                                            currentlyOfferedServiceRef.collection(element).doc(context.read(authControllerProvider)!.uid),
                                            {
                                              "userid": context.read(authControllerProvider)!.uid,
                                              "isActiveSubservice":true,
                                            },SetOptions(merge: true));
                                      });
                                    }
                                    await genericBatch.commit();
                                  });
                                  // String previousServiceName;
                                  await context.read(userRepositoryProvider).addUserMap({
                                    "service":_selectedService.value!.name,
                                    "serviceIcon":_selectedService.value!.icon,
                                    "serviceId":_selectedService.value?.serviceId,
                                    "isServiceDefault":_selectedService.value!.isDafault,
                                    "subServices":FieldValue.arrayUnion(selectedSubSevices.value!),
                                    "expertiseLevel":preference
                                  });
                                progress.dismiss();
                                }, imageIcon: null,),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )),
      loading: () => Scaffold(body: Container(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)))),
      error: (error, _) => Scaffold(
        body: Container(
          child: Center(
            child: FirebaseErrorWidget(
              message:
              error is CustomException ? error.message! : 'Something went wrong!',
            ),
          ),
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



