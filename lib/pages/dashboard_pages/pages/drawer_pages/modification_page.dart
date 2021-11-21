import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/models/modification_model/modification_model.dart';
import 'package:halawork/repositories/order_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'modification_pages/widgets/modification_tiles.dart';
class ModificationPage extends HookWidget {
  const ModificationPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          "Modification Page",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: const Color(0xff3E3E3E),
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
        centerTitle: true,
        backgroundColor:  const Color(0xffF8F8F8),
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
      backgroundColor:Colors.white,
      body: Container(
        width: size.width,
        height: size.height,

        padding: EdgeInsets.symmetric(horizontal: 17),
        child: StreamBuilder<List<ModificationModel>>(
          stream:context.read(orderRepositoryProvider).getModifications(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return  ListView(
                children:snapshot.data!.map((e) => ModificationTile(title: e.requestTitle, date: "Created: ${DateFormat.yMMMMd().format(e.createdDate!)}", onButtonPressed: (){
                  context.router.navigate(ModificationDetailRoute(modificationModel: e));
                })).toList(),
              );
            }else if(snapshot.connectionState==ConnectionState.waiting){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
                ],
              );
            }
            else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("No Modification Available")
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
