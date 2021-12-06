import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/requests_model/request_model2.dart';
import 'package:halawork/pages/dashboard_pages/widget/request_card.dart';
import 'package:halawork/providers/state_providers/navigation_provider.dart';
import 'package:halawork/providers/state_providers/tab_state_provider.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class RequestPage extends StatefulHookWidget {
  const RequestPage();
  @override
  _RequestPageState createState() => _RequestPageState();

}
class _RequestPageState extends State<RequestPage>{
  final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
      "getAvailableRequests"
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userModelExtensionController);
    var tabRouteState = useProvider(tabRouteStateProvider);
    var navigationProvider = useProvider(navigationStateProvider);
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: userModelState!.userModel.isSeller?FutureBuilder<HttpsCallableResult<List<dynamic>>>(
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
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: size.height * 0.03),
                ),
                SliverList(delegate: SliverChildListDelegate(snapshot.data!.data.asMap().keys.map((index) {
                  if(index==(snapshot.data!.data.length-1))
                    return SellerRequestCard(isLast:true,createRequestModel: CreateRequestModel2.fromMap(snapshot.data!.data[index]),btnLabel: "SEND OFFER",);
                  return SellerRequestCard(isLast:false,createRequestModel: CreateRequestModel2.fromMap(snapshot.data!.data[index]),btnLabel: "SEND OFFER",);
                }).toList())),
                SliverToBoxAdapter(
                  child: SizedBox(height: size.height * 0.05),
                ),
              ],
            );
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("No Available Request")
              ],
            );
          }
        },
          future: callable.call()
      ):

      StreamBuilder<List<CreateRequestModel>>(
        stream: context.read(userModelExtensionController.notifier).getRequests(),
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
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: size.height * 0.03),
                ),
                SliverList(delegate: SliverChildListDelegate(snapshot.data!.asMap().keys.map((index) {
                  if(index==(snapshot.data!.length-1))
                    return BuyerRequestCard(isLast:true,createRequestModel: snapshot.data![index],btnLabel: "VIEW OFFERS",);
                  return BuyerRequestCard(isLast:false,createRequestModel: snapshot.data![index],btnLabel: "VIEW OFFERS",);
                }).toList()),),
                SliverToBoxAdapter(
                  child: SizedBox(height: size.height * 0.20),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  sliver: SliverToBoxAdapter(
                    child: CustomButtonSignup(
                      buttonBg: const Color(0xff0000FF),
                      buttonTitle: "CREATE A REQUEST",
                      buttonFontColor: Colors.white,
                      onButtonPressed: () {
                        tabRouteState.state?.setActiveIndex(2);
                        navigationProvider.state=2;
                      }, imageIcon: null,),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: size.height * 0.05),
                ),
              ],
            );
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("No Available Request")
              ],
            );
          }
        },
      ),
    );
  }

}