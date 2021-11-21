import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/servicetype_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:halawork/widgets/firebase_error_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class AddPortfolioDescriptionPage extends HookWidget {
  const AddPortfolioDescriptionPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _textEditingController = useTextEditingController();
    final _chipKey = useMemoized(() => GlobalKey<ChipsInputState>());
    final serviceState = useProvider(serviceTypeControllerProvider);
    final selectedSkills = useState<List<String>?>([]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 5,
              title: Text(
                "Create A Portfolio",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: const Color(0xff3E3E3E),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
              centerTitle: true,
              pinned: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: const Color(0xff0000FF),
                  size: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal:17.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 40,),
                  Theme(
                    data:
                    Theme.of(context).copyWith(splashColor: Colors.transparent),
                    child: TextField(
                      controller: _textEditingController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: const Color(0xff29283C), fontSize: 10)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Project Name",
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
                  const SizedBox(height: 22,),
                serviceState.when(data: (serviceTypeModel){
                  return ChipsInput<String?>(
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
                  );
                }, loading: (){
                  return Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),));
                }, error:(error, _){
                  return Center(
                    child: FirebaseErrorWidget(
                      message:
                      error is CustomException ? error.message! : 'Something went wrong!',
                    ),
                  );
                }),
                  SizedBox(
                    width: size.width,
                    height: size.height*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Text(""),),
                        CustomButtonSignup(
                            buttonBg: const Color(0xff0000FF),
                            buttonTitle: "NEXT  >",
                            buttonFontColor: Colors.white,
                            isFullWidth: true,
                            onButtonPressed: ()async {
                              if(selectedSkills.value!.isNotEmpty && _textEditingController.text.isNotEmpty){
                                context.router.navigate(AddPortfolioPhotoRoute(projectName: _textEditingController.text.toString(), skills: selectedSkills.value!));
                              }else{
                               await Fluttertoast.showToast(msg: "Field must not be empty",toastLength: Toast.LENGTH_LONG);
                              }
                            }, imageIcon: null,)
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
