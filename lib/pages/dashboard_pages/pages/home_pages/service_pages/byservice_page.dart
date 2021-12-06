import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/widget/expandable_service_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ByServicePage extends HookWidget{
  const ByServicePage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userModelExtensionController);
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5,
        leading:IconButton(onPressed:(){
          Navigator.of(context).pop();
        },icon: Icon(Icons.arrow_back,size: 24,color:const Color(0xff0000FF),)),
        title: Text("Services", style: GoogleFonts.roboto(textStyle: TextStyle(
            color: Color(0xFF29283C),
            fontWeight: FontWeight.w700,
            fontSize: 20
        ))),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView(
          children:userModelState!.serviceList!.map((e) => ExpandableServiceTile(activeServiceModel: e)).toList(),
        ),
      ),
    );
  }
}
