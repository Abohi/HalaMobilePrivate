import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class GridItem extends HookWidget {
  final String subService;
  const GridItem({required this.subService});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.3,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
              activeColor:const Color(0xff0000FF),
              value: true,
              onChanged: (val){}),
          SizedBox(
            width: size.width*0.3,
            child: Text(subService,style: GoogleFonts.roboto(textStyle: TextStyle(
                fontSize: 12,color: const Color(0xff29283C)
            )),),
          )
        ],
      ),
    );
  }
}


class SubServiceSection extends HookWidget{
  final bool isProfileView;
  final UserModel? userModel;
  const SubServiceSection({required this.userModel,required this.isProfileView});

  @override
  Widget build(BuildContext context) {
    if(isProfileView){
      return userModel==null?SliverToBoxAdapter(child: Text("")): SliverGrid.count(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 3/1,
        crossAxisCount:2,
        children: getGridItems(subService:userModel!.subServices!),
      );
    }else{
      var userModelState = useProvider(userModelExtensionController);
      return userModelState==null?SliverToBoxAdapter(child: Text("")): SliverGrid.count(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 3/1,
        crossAxisCount:2,
        children: getGridItems(subService:userModelState.userModel.subServices!),
      );
    }

  }
  List<Widget>getGridItems({required List<String> subService}){
    return subService.map((e) => GridItem(subService: e)).toList();
  }
}
