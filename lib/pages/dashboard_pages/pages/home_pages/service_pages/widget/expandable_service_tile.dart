
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/active_servicemodel/active_service_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/widget/subservice_item_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

final isShowArrowUpStateProvider = StateProvider<bool>((ref){
  return  false;
});
class ExpandableServiceTile extends HookWidget {
   final ActiveServiceModel activeServiceModel;
  const ExpandableServiceTile({required this.activeServiceModel});

  @override
  Widget build(BuildContext context) {
    var isShowArrowUpState = useProvider(isShowArrowUpStateProvider);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: size.width,maxHeight:size.height*0.4 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: (){
                isShowArrowUpState.state=!isShowArrowUpState.state;
              },
              child: Container(
                color: const Color(0xffF8F8F8),
                width: size.width,
                height:size.height*0.15,
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: size.width*0.2,
                        height: size.height*0.2,
                        decoration:BoxDecoration(color: const Color(0xffEBEBFF),shape: BoxShape.circle),
                        child: Center(child: SizedBox(
                            width: size.width*0.1,
                            height: size.height*0.1,
                            child: SvgPicture.asset(activeServiceModel.icon!)))),
                    Text(activeServiceModel.service!, style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,color: const Color(0xff555555),fontWeight: FontWeight.w700))),
                    Offstage(child: Icon(Icons.keyboard_arrow_up, color:const Color(0xff0000FF),
                      size: 24,),offstage:  context.read(isShowArrowUpStateProvider).state,),
                    Offstage(child: Icon(Icons.keyboard_arrow_down, color:const Color(0xff0000FF),
                      size: 24,),offstage: !context.read(isShowArrowUpStateProvider).state,),
                  ],
                ),
              ),
            ),
            isShowArrowUpState.state?ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width,maxHeight:size.height*0.25 ),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return SubServiceItemTile(subServiceName: activeServiceModel.subservices![index],voidButtonPressed: (){
                    context.router.navigate(SubserviceRoute(subServiceName: activeServiceModel.subservices![index], activeServiceModel: activeServiceModel));
                  },);

                },itemCount:activeServiceModel.subservices!.length ,),
            ):Text("")
          ],
        ),
      ),
    );
  }
}
