import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/home_search_pages/widgets/seller_searched_tile.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/widget/custom_chipinput.dart';
import 'package:halawork/pages/dashboard_pages/widget/custom_drawer.dart';
import 'package:halawork/providers/state_providers/searchedUsersProviders.dart';
import 'package:halawork/providers/state_providers/subServicesListProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class HomeSearchMainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final scafKey = useMemoized(() => GlobalKey<ScaffoldState>());
    var userModelState = useProvider(userModelExtensionController);
    var subservicesListProvider = useProvider(subServicesListProvider);
    final _chipKey = useMemoized(() => GlobalKey<ChipsInputState>());
    var chipsInputNode = useMemoized(()=>FocusNode());
    final selectedSubservices = useState<List<String>?>([]);
    var searchedUserState = useProvider(searchedUsersProvider);
    useEffect((){
      Future.microtask((){
        List<String> subServices =[];
        for(int i =0;i<userModelState!.serviceList!.length;i++){
          subServices.addAll(userModelState.serviceList![i].subservices!);
        }
        subservicesListProvider.state = subServices;
      });
      return null;
    },[]);
    return Scaffold(
      key: scafKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: SafeArea(
            child: Container(
              width: size.width,
              height: size.height,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    pinned: true,
                    elevation: 3,
                    leading: GestureDetector(
                      onTap: () {
                        scafKey.currentState!.openDrawer();
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: userModelState!.userModel.profilePictureUrl !=
                                null
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(userModelState
                                      .userModel.profilePictureUrl!),
                                ),
                              )
                            : Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    "${userModelState.userModel.email!.toUpperCase().substring(0, 1)}",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xff0000FF),
                                    shape: BoxShape.circle),
                              ),
                      ),
                    ),
                    title: Text("Sellers",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Color(0xFF29283C),
                                fontWeight: FontWeight.w700,
                                fontSize: 20))),
                  ),
                  SliverToBoxAdapter(
                    child: const SizedBox(height: 20,),
                  ),
                  subservicesListProvider.state==null?SliverToBoxAdapter(child: SizedBox.shrink()):SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    sliver: SliverToBoxAdapter(
                      child: ChipsInput<String?>(
                        key: _chipKey,
                        keyboardAppearance: Brightness.dark,
                        textCapitalization: TextCapitalization.words,
                        enabled: true,
                        maxChips: subservicesListProvider.state!.length,
                        textStyle: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff5A5AFC),
                                fontSize: 14)),
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                              onTap: (){
                                searchedUserState.state=[];
                                FocusScope.of(context).requestFocus(chipsInputNode);
                              },
                              child: Icon(Icons.search,color: const Color(0xff0000FF),)),
                          suffixIcon: GestureDetector(
                              onTap: ()async{
                                if(selectedSubservices.value==null || selectedSubservices.value!.isEmpty){
                                  await Fluttertoast.showToast(msg: "You have not made any search yet",toastLength: Toast.LENGTH_LONG);
                                }else{
                                  context.router.navigate(FilterRoute());
                                }
                              },
                              child: Icon(Icons.filter_list_sharp,color: const Color(0xff0000FF))),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "What are you looking for?",
                          hintStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: const Color(0xff29283C),
                                  fontSize: 14)),
                          contentPadding: const EdgeInsets.only(
                              left: 9.0, bottom: 5.0, top: 7.0),
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
                        findSuggestions: (String query) {
                          if (query.length != 0) {
                            var lowercaseQuery = query.toLowerCase();
                            return subservicesListProvider.state!.where((skills) {
                              return skills.toLowerCase().contains(query.toLowerCase());
                            }).toList(growable: false)
                              ..sort((a, b) => a
                                  .toLowerCase()
                                  .indexOf(lowercaseQuery)
                                  .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
                          } else {
                            return const <String>[];
                          }
                        },
                        onChanged: (data) {
                          List<String> subserv= [];
                          for (int i = 0; i < data.length; i++) {
                            subserv.add(data[i]!);
                          }
                          selectedSubservices.value=subserv;
                          selectedSubservices.value?.toSet().toList();
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
                              selectedSubservices.value!.remove(skill);
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
                  SliverToBoxAdapter(
                    child: const SizedBox(height: 21,),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: size.height * 0.04,
                      child: selectedSubservices.value==null?Text("You have not made any selection"):ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedSubservices.value?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomChipInput(
                                skillsList: selectedSubservices.value!.cast<String>(),
                                selected:true,
                                index: index,
                                onTap: () {},
                              ),
                            );
                          }),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: const SizedBox(height: 38,),
                  ),
                  searchedUserState.state.isEmpty &&(selectedSubservices.value==null || selectedSubservices.value!.isEmpty)?SliverToBoxAdapter(
                    child: Center(child: Text("No selection has been made")),
                  ):FilteredUserConditionalWidget(selectedSubservices: selectedSubservices)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class FilteredUserConditionalWidget extends HookWidget {
  final ValueNotifier selectedSubservices;
  const FilteredUserConditionalWidget({required this.selectedSubservices});

  @override
  Widget build(BuildContext context) {
    var searchedUserState = useProvider(searchedUsersProvider);
    return searchedUserState.state.isEmpty?
    StreamBuilder<List<UserModel>>(
      stream: context.read(userRepositoryProvider).getSearchedSellers(selectedSubservices.value!),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
              ],
            ),
          );
        }else if(snapshot.hasData){
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            searchedUserState.state=snapshot.data!;
          });
          return SliverPadding(
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                  snapshot.data!.map((e) => SellerSearchedTile(userModel: e,)).toList()
              ),
            ), padding: EdgeInsets.symmetric(horizontal: 17),
          );
        }else{
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("No record available")
              ],
            ),
          );
        }
      },
    ):
    SliverPadding(
      sliver: SliverList(
        delegate: SliverChildListDelegate(
            searchedUserState.state.map((e) => SellerSearchedTile(userModel: e,)).toList()
        ),
      ), padding: EdgeInsets.symmetric(horizontal: 17),
    );
  }
}
