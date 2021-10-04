import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/active_servicemodel/active_service_model.dart';
import 'package:halawork/models/subservice_model/subservice_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/widget/user_tile.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sellersStreamProvider = StreamProvider.family<List<SubServiceModel>,List<String>>((ref,activeServiceModel) {
  return ref.read(userRepositoryProvider).getSellersUnderSubService(activeServiceModel[0], activeServiceModel[1]);
});
class SubservicePage extends HookWidget{
  final String subServiceName;
  final ActiveServiceModel activeServiceModel;
  const SubservicePage({required this.subServiceName,required this.activeServiceModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child:CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                pinned: true,
                elevation: 5,
                leading:IconButton(onPressed:(){
                  Navigator.of(context).pop();
                },icon: Icon(Icons.arrow_back,size: 24,color:const Color(0xff0000FF),)),
                title: Text(subServiceName, style: GoogleFonts.roboto(textStyle: TextStyle(
                    color: const Color(0xFF29283C),
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                ))),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 17),
                sliver:StreamBuilder<List<SubServiceModel>>(
                  stream: context.read(userRepositoryProvider).getSellersUnderSubService(subServiceName, activeServiceModel.serviceId!),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return SliverList(delegate: SliverChildListDelegate(snapshot.data!.map((e) => UserTile(subServiceModel: e, activeServiceModel: activeServiceModel)).toList()),);
                    }else if(snapshot.connectionState==ConnectionState.waiting){
                      return SliverToBoxAdapter(
                        child: Column(
                          children: [
                            SizedBox(height: size.height*0.4,),
                            Center(
                              child: CircularProgressIndicator(),
                            )
                          ],
                        ),
                      );
                    }else{
                      return SliverToBoxAdapter(
                        child: Text(""),
                      );
                    }
                  },
                ),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}
