import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/inbox_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/models/inbox_model/inbox_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/widget/tab_bar_decorator.dart';
import 'package:halawork/providers/state_providers/buyerSellerIdsStateProvider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:auto_route/auto_route.dart';
import 'package:timeago/timeago.dart' as timeago;
final currentItem = ScopedProvider<InboxModel>((_) => throw UnimplementedError());
class InboxDetailPage extends HookWidget{

 const InboxDetailPage();

  @override
  Widget build(BuildContext context) {
     var _tabController = useTabController(initialLength: 2);
     var _textEditingController = useTextEditingController();
     var inboxModelState = useProvider(inboxControllerProvider);
     var buyerSellerIdState = useProvider(buyerSellerIdsStateProvider);
     final String buyerId= buyerSellerIdState.state![0];
     final String sellerId = buyerSellerIdState.state![1];
     var receiverId = useState<String>("");
     if(buyerId!=context.read(authControllerProvider)!.uid){
       receiverId.value = buyerId;
     }else{
       receiverId.value = sellerId;
     }
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 5,
              title: StreamBuilder<UserModel>(
                stream: context.read(userRepositoryProvider).getUserModel(receiverId.value),
                builder:(context,snapshot){
                  if(snapshot.hasData){
                    bool exists = snapshot.data!.email!.contains("@");
                    if(snapshot.data!.profilePictureUrl!=null){
                      return Text(
                        "${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: const Color(0xff3E3E3E),
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      );
                    }
                    return !exists?Text("${snapshot.data!.email!.toUpperCase()}",style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff3E3E3E),
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),):
                    Text("${snapshot.data!.email!.toUpperCase().substring(0,snapshot.data!.email!.indexOf("@"))}",style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff3E3E3E),
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),);
                  }
                  return Text(
                    "",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: const Color(0xff3E3E3E),
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  );
                },
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
                  context.popRoute();
                  // Navigator.pop(context);
                },
              ),
            ),
            SliverAppBar(
                titleSpacing: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
                backgroundColor: const Color(0xffF8F8F8),
                pinned: true,
                centerTitle: false,
                bottom: DecoratedTabBar(tabBar: _getTabBar(_tabController), decoration: BoxDecoration(border:  Border(
                  bottom: BorderSide(
                    color: const Color(0xffF8F8F8),
                    width: 4.0,
                  ),
                )))
            ),
            SliverFillRemaining(
              child: _getTabBarView(<Widget>[
                inboxModelState==null?
                SizedBox.shrink():
                GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:17.0),
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: inboxModelState.length,
                      itemBuilder: (BuildContext context, int index){
                        final InboxModel message = inboxModelState[index];
                       return  ProviderScope(
                          overrides: [currentItem.overrideWithValue(message)],
                          child: MessageTile(receiverId.value,inboxModelState.length),
                        );
                      },
                    ),
                  ),
                ),
                inboxModelState==null?SizedBox.shrink():GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:17.0),
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: inboxModelState.length,
                      itemBuilder: (BuildContext context, int index) {
                        final InboxModel message = inboxModelState[index];
                        return  ProviderScope(
                          overrides: [currentItem.overrideWithValue(message)],
                          child: MessageTile(receiverId.value,inboxModelState.length),
                        );
                      },
                    ),
                  ),
                ),

              ],_tabController),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: _buildMessageComposer(receiverId.value,context,_textEditingController,sellerId,buyerId),
      ),
    );
  }
  _buildMessageComposer(String receiverId,BuildContext context,TextEditingController _textEditingController,String sellerId,String buyerId) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                autofocus: false,
                keyboardType:
                TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                controller: _textEditingController,
                style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type your message',
                  hintStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                  suffixIcon: Icon(Icons.attachment,size: 24,color: const Color(0xffACACAC),),
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                    borderRadius: BorderRadius.circular(23),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12,),
          Container(
            decoration: BoxDecoration(color: Color(0xff0000FF),shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.send),
                iconSize: 18.0,
                color: Colors.white,
                onPressed:()async {
                  FocusScope.of(context).unfocus();
                  if(_textEditingController.text.isNotEmpty){
                    await context.read(userControllerProvider.notifier).uploadMessage(_textEditingController.text,sellerId: sellerId,buyerId: buyerId,receiverId: receiverId);
                  }else{
                    await Fluttertoast.showToast(msg: "Field cannot be empty",toastLength: Toast.LENGTH_LONG);
                  }
                  _textEditingController.clear();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  TabBarView _getTabBarView(List<Widget>tabs,TabController _tabController){
    return TabBarView(
      children: tabs,
      controller: _tabController,);
  }

  TabBar _getTabBar(TabController _tabController){
    return TabBar(
      labelColor: const Color(0xff0000FF),
      indicatorColor: const Color(0xff0000FF),
      unselectedLabelColor: const Color(0xff555555),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: const Color(0xff0000FF), width: 5.0),
      ),
      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
      unselectedLabelStyle:TextStyle(fontSize: 12,fontWeight: FontWeight.normal) ,
      tabs:[
        Tab(text:"Message"),
        Tab(text:"Order Message",),
      ],
      controller: _tabController,
    );
  }
}
class MessageTile extends HookWidget {
  final String receiverId;
  final int documentLength;
  const MessageTile(this.receiverId,this.documentLength);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    final item = useProvider(currentItem);
    final bool isMe = item.messageRecepientId == context.read(authControllerProvider)!.uid;
    return isMe? Container(
      width:size.width*0.7,
      margin:EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
      ),
      padding: EdgeInsets.only(left: 13),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius:BorderRadius.only(
            topLeft: Radius.circular(11.0),
            bottomLeft: Radius.circular(11.0),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(11.0)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              item.message!,
              style: GoogleFonts.roboto(textStyle: TextStyle(
                color: const Color(0xff29283C),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:10.0,bottom:7,top:8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  timeago.format(item.createdAt!),
                  style: GoogleFonts.roboto(textStyle: TextStyle(
                    color: const Color(0xff7C7C7C),
                    fontSize: 10.0,
                    fontWeight: FontWeight.normal,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    ):
    FutureBuilder(
      future:context.read(userRepositoryProvider).updateMessage(item.sellerId!, item.buyerId!, item.messageId!, documentLength),
      builder: (context,snapshot){
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder<UserModel>(
              stream: context.read(userRepositoryProvider).getUserModel(receiverId),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  if(snapshot.data!.profilePictureUrl==null){
                    return Container(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Text("${snapshot.data!.email!.substring(0,1)}",style: GoogleFonts.roboto(
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
                    );
                  }
                  return SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(snapshot.data!.profilePictureUrl!),
                    ),
                  );
                }else{
                  return SizedBox.shrink();
                }
              },
            ),
            SizedBox(width: 15,),
            Container(
              width:size.width*0.7,
              margin:EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              padding: EdgeInsets.only(left: 13),
              decoration: BoxDecoration(
                color: isMe?Colors.grey:
                const Color(0xffE6E6E6),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(11.0),
                    topRight: Radius.circular(11.0),
                    bottomRight: Radius.circular(11.0)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      item.message!,
                      style: GoogleFonts.roboto(textStyle: TextStyle(
                        color: const Color(0xff29283C),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10.0,bottom:7,top:8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          timeago.format(item.createdAt!),
                          style: GoogleFonts.roboto(textStyle: TextStyle(
                            color: const Color(0xff7C7C7C),
                            fontSize: 10.0,
                            fontWeight: FontWeight.normal,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// FutureBuilder<void>(
// future:context.read(userRepositoryProvider).updateMessage(item.sellerId, item.buyerId, item.messageId!, documentLength),
// builder: (context,snapshot){
// if(snapshot.hasData){
// return isMe? Container(
// width:size.width*0.7,
// margin:EdgeInsets.only(
// top: 8.0,
// bottom: 8.0,
// left: 80.0,
// ),
// padding: EdgeInsets.only(left: 13),
// decoration: BoxDecoration(
// color: Colors.grey,
// borderRadius:BorderRadius.only(
// topLeft: Radius.circular(11.0),
// bottomLeft: Radius.circular(11.0),
// topRight: Radius.circular(0),
// bottomRight: Radius.circular(11.0)
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.symmetric(vertical: 12),
// child: Text(
// item.message,
// style: GoogleFonts.roboto(textStyle: TextStyle(
// color: const Color(0xff29283C),
// fontSize: 14.0,
// fontWeight: FontWeight.normal,
// )),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(right:10.0,bottom:7,top:8),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Spacer(),
// Text(
// DateFormat.Hms()
//     .format(item.createdAt!),
// style: GoogleFonts.roboto(textStyle: TextStyle(
// color: const Color(0xff7C7C7C),
// fontSize: 10.0,
// fontWeight: FontWeight.normal,
// )),
// ),
// ],
// ),
// ),
// ],
// ),
// ):Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// StreamBuilder<UserModel>(
// stream: context.read(userRepositoryProvider).getUserModel(receiverId),
// builder: (context,snapshot){
// if(snapshot.hasData){
// if(snapshot.data!.profilePictureUrl==null){
// return Container(
// width: 40,
// height: 40,
// child: Center(
// child: Text("${snapshot.data!.firstName!.substring(0,1)}${snapshot.data!.lastName!.substring(0,1)}",style: GoogleFonts.roboto(
// textStyle: TextStyle(
// color: Colors.white,
// fontSize: 15,
// fontWeight: FontWeight.bold
// )
// ),),
// ),
// decoration: BoxDecoration(
// color: const Color(0xff0000FF),
// shape: BoxShape.circle
// ),
// );
// }
// return SizedBox(
// width: 40,
// height: 40,
// child: CircleAvatar(
// radius: 28,
// backgroundImage: NetworkImage(snapshot.data!.profilePictureUrl!),
// ),
// );
// }else{
// return SizedBox.shrink();
// }
// },
// ),
// SizedBox(width: 15,),
// Container(
// width:size.width*0.7,
// margin:EdgeInsets.only(
// top: 8.0,
// bottom: 8.0,
// ),
// padding: EdgeInsets.only(left: 13),
// decoration: BoxDecoration(
// color: isMe?Colors.grey:
// const Color(0xffE6E6E6),
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(0),
// bottomLeft: Radius.circular(11.0),
// topRight: Radius.circular(11.0),
// bottomRight: Radius.circular(11.0)
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.symmetric(vertical: 12),
// child: Text(
// item.message,
// style: GoogleFonts.roboto(textStyle: TextStyle(
// color: const Color(0xff29283C),
// fontSize: 14.0,
// fontWeight: FontWeight.normal,
// )),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(right:10.0,bottom:7,top:8),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Spacer(),
// Text(
// DateFormat.Hms()
//     .format(item.createdAt!),
// style: GoogleFonts.roboto(textStyle: TextStyle(
// color: const Color(0xff7C7C7C),
// fontSize: 10.0,
// fontWeight: FontWeight.normal,
// )),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// );
// }
// return isMe? Container(
// width:size.width*0.7,
// margin:EdgeInsets.only(
// top: 8.0,
// bottom: 8.0,
// left: 80.0,
// ),
// padding: EdgeInsets.only(left: 13),
// decoration: BoxDecoration(
// color: Colors.grey,
// borderRadius:BorderRadius.only(
// topLeft: Radius.circular(11.0),
// bottomLeft: Radius.circular(11.0),
// topRight: Radius.circular(0),
// bottomRight: Radius.circular(11.0)
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.symmetric(vertical: 12),
// child: Text(
// item.message,
// style: GoogleFonts.roboto(textStyle: TextStyle(
// color: const Color(0xff29283C),
// fontSize: 14.0,
// fontWeight: FontWeight.normal,
// )),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(right:10.0,bottom:7,top:8),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Spacer(),
// Text(
// DateFormat.Hms()
//     .format(item.createdAt!),
// style: GoogleFonts.roboto(textStyle: TextStyle(
// color: const Color(0xff7C7C7C),
// fontSize: 10.0,
// fontWeight: FontWeight.normal,
// )),
// ),
// ],
// ),
// ),
// ],
// ),
// ):Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// StreamBuilder<UserModel>(
// stream: context.read(userRepositoryProvider).getUserModel(receiverId),
// builder: (context,snapshot){
// if(snapshot.hasData){
// if(snapshot.data!.profilePictureUrl==null){
// return Container(
// width: 40,
// height: 40,
// child: Center(
// child: Text("${snapshot.data!.firstName!.substring(0,1)}${snapshot.data!.lastName!.substring(0,1)}",style: GoogleFonts.roboto(
// textStyle: TextStyle(
// color: Colors.white,
// fontSize: 15,
// fontWeight: FontWeight.bold
// )
// ),),
// ),
// decoration: BoxDecoration(
// color: const Color(0xff0000FF),
// shape: BoxShape.circle
// ),
// );
// }
// return SizedBox(
// width: 40,
// height: 40,
// child: CircleAvatar(
// radius: 28,
// backgroundImage: NetworkImage(snapshot.data!.profilePictureUrl!),
// ),
// );
// }else{
// return SizedBox.shrink();
// }
// },
// ),
// SizedBox(width: 15,),
// Container(
// width:size.width*0.7,
// margin:EdgeInsets.only(
// top: 8.0,
// bottom: 8.0,
// ),
// padding: EdgeInsets.only(left: 13),
// decoration: BoxDecoration(
// color: isMe?Colors.grey:
// const Color(0xffE6E6E6),
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(0),
// bottomLeft: Radius.circular(11.0),
// topRight: Radius.circular(11.0),
// bottomRight: Radius.circular(11.0)
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.symmetric(vertical: 12),
// child: Text(
// item.message,
// style: GoogleFonts.roboto(textStyle: TextStyle(
// color: const Color(0xff29283C),
// fontSize: 14.0,
// fontWeight: FontWeight.normal,
// )),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(right:10.0,bottom:7,top:8),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Spacer(),
// Text(
// DateFormat.Hms()
//     .format(item.createdAt!),
// style: GoogleFonts.roboto(textStyle: TextStyle(
// color: const Color(0xff7C7C7C),
// fontSize: 10.0,
// fontWeight: FontWeight.normal,
// )),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// );
// },);