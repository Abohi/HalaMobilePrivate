import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/models/conversation_model/conversation_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/providers/state_providers/buyerSellerIdsStateProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'inbox_pages/widget/conversation_tile.dart';
import 'inbox_pages/widget/inbox_data_search_delegate.dart';

class InboxPage extends HookWidget {
  const InboxPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var buyerSellerIdState = useProvider(buyerSellerIdsStateProvider);
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: StreamBuilder<List<ConversationModel>>(
        stream: context.read(userRepositoryProvider).getConversationModel(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff0000FF)),)),
              ],
            );
          }else if(snapshot.hasData){
            if(snapshot.data!=null){
              if(snapshot.data!.length==0){
                return Container(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset("assets/images/message_empty.svg"),
                    SizedBox(height: 51.27,),
                    Text("No messages",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,color: const Color(0xff29283C))),)
                  ],
                ),);
              }
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: TextFormField(
                        autofocus: false,
                        keyboardType:
                        TextInputType.text,
                        onTap: ()async{
                          await showSearch(context: context,delegate: DataSearch( conversationalModels:snapshot.data));
                        },
                        style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10)),
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.search,color: const Color(0xff0000FF),size: 16.17,),
                          fillColor: Colors.white,
                          hintText: "What are you looking for?",
                          hintStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xffACACAC),fontSize: 14)),
                          contentPadding:
                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                        snapshot.data!.map((e) => ConversationTile(conversationModel: e)).toList()
                    ),
                  )
                ],
              );
            }else{
              return SizedBox.shrink();
            }
          }else{
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

