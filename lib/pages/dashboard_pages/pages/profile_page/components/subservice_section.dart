import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
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
  const SubServiceSection();

  @override
  Widget build(BuildContext context) {
    var userModelState = useProvider(userControllerProvider);
    return userModelState==null?SliverToBoxAdapter(child: Text("")): SliverGrid.count(
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      childAspectRatio: 3/1,
      crossAxisCount:2,
      children: getGridItems(subService:userModelState.userModel.subServices!),
    );
  }
  List<Widget>getGridItems({required List<String> subService}){
    return subService.map((e) => GridItem(subService: e)).toList();
  }
}
