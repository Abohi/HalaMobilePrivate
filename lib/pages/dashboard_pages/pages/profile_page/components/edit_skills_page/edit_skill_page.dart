import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/firebase_error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class EditSkillPage extends HookWidget {
  const EditSkillPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final selectedSkills = useState<List<String>?>([]);
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
                            title: Text(
                              "Edit Skills",
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
                          SliverToBoxAdapter(
                            child: const SizedBox(height: 30,),
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
                                    final progress = ProgressHUD.of(context);
                                    progress!.showWithText('Updating Skills...');
                                    await context.read(userRepositoryProvider).addUserMap({
                                      "skills": FieldValue.arrayUnion(uniqueSkills)
                                    });
                                    await Fluttertoast.showToast(msg: "Skills updated successfully",toastLength: Toast.LENGTH_LONG);
                                    progress.dismiss();
                                  }

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
      error: (error, _) => Center(
        child: FirebaseErrorWidget(
          message:
          error is CustomException ? error.message! : 'Something went wrong!',
        ),
      ),
    );
  }
}
