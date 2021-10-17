import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/inbox_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/conversation_model/conversation_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/providers/state_providers/buyerSellerIdsStateProvider.dart';
import 'package:halawork/providers/state_providers/unreadmessageStateProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:timeago/timeago.dart' as timeago;
class ConversationTile extends HookWidget {
  ConversationModel conversationModel;
  int messageCount=0;
  ConversationTile({required this.conversationModel });
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    messageCount = conversationModel.messageCount!-conversationModel.userMessageCount!;
    bool shouldShowTimeAgo = useProvider(userControllerProvider)!.userModel.email==conversationModel.recieverEmail;
    var buyerSellerIdState = useProvider(buyerSellerIdsStateProvider);
    // WidgetsBinding.instance!
    //     .addPostFrameCallback((_){
    //   buyerSellerIdState.state=[conversationModel.buyerId,conversationModel.sellerId];
    //   unreadmessageState.state=inboxState![0].messageCount! - inboxState[0].userMessageCount!;
    // });

    return GestureDetector(
      onTap: (){
        buyerSellerIdState.state=[conversationModel.buyerId!,conversationModel.sellerId!];
        context.router.navigate(InboxDetailRoute());
      },
      child: StreamBuilder<UserModel>(
        stream: context.read(userRepositoryProvider).getUserModel(conversationModel.conversationId!),
        builder: (context,snapshot){
          if(snapshot.hasData){
            bool exists = snapshot.data!.email!.contains("@");
            return Container(
              width:size.width,
              height: 66,
              padding: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(color: Colors.white,border: Border(bottom: BorderSide(color: const Color(0xffE6E6E6)))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  snapshot.data!.profilePictureUrl==null?Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Text("${snapshot.data!.email!.toUpperCase().substring(0,1)}",style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          )
                      ),),
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xff0000FF),
                        shape: BoxShape.circle
                    ),
                  ):SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(snapshot.data!.profilePictureUrl!),
                    ),
                  ),
                  SizedBox(width: 18,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      !exists?Text("${snapshot.data!.email!.toUpperCase()}",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14,fontWeight: FontWeight.w700)),):
                      Text("${snapshot.data!.email!.toUpperCase().substring(0,snapshot.data!.email!.indexOf("@"))}",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14,fontWeight: FontWeight.w700)),),
                      SizedBox(height: 3,),
                      Text("",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 12,fontWeight: FontWeight.w700)),),
                      SizedBox(height: 3,),
                      Text("",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 12,fontWeight: FontWeight.normal)),)
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     shouldShowTimeAgo? Text(timeago.format(conversationModel.createdAt!),style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 12,fontWeight: FontWeight.normal)),):SizedBox.shrink(),
                      SizedBox(height: 6,),
                      messageCount==0?SizedBox.shrink():Container(
                        width: 14,
                        height: 14,
                        child: Center(child: Text(messageCount.toString(),style: GoogleFonts.roboto(textStyle: TextStyle(color:Colors.white,fontSize: 10,fontWeight: FontWeight.normal)),),),
                        decoration: BoxDecoration(shape: BoxShape.circle,color: const Color(0xff0000FF)),
                      )
                    ],
                  )
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}