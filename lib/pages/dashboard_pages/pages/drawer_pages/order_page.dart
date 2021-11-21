import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/order_controller.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/widgets/order_tile.dart';
import 'package:halawork/pages/dashboard_pages/widget/tab_bar_decorator.dart';
import 'package:halawork/repositories/order_repository.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderPage extends HookWidget {
  const OrderPage();

  @override
  Widget build(BuildContext context) {
    var tabController = useTabController(initialLength: 3);
    var orderState = useProvider(orderControllerProvider);
    var size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
    appBar: AppBar(
      elevation: 5,
      title: Text(
        "Order",
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: const Color(0xff3E3E3E),
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: const Color(0xff0000FF),
          size: 24,
        ),
        onPressed: () {
          context.popRoute();
        },
      ),
    ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                titleSpacing: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
                backgroundColor: const Color(0xffF8F8F8),
                pinned: true,
                centerTitle: false,
                bottom: DecoratedTabBar(tabBar: _getTabBar(tabController), decoration: BoxDecoration(border:  Border(
                  bottom: BorderSide(
                    color: const Color(0xffF8F8F8),
                    width: 4.0,
                  ),
                )))
            ),
            // StreamBuilder<List<OrderModel>>(
            // stream: context.read(orderRepositoryProvider).orderStream(),
            //     builder: (context,snapshot){
            //   if(snapshot.hasData){
            //     return SliverList(
            //       delegate: SliverChildListDelegate(
            //         snapshot.data!.map((e) => Text(e.orderStatus)).toList()
            //       ),
            //     );
            //   }else{
            //     return SliverToBoxAdapter(
            //       child: Text("empty"),
            //     );
            //   }
            // })
            SliverFillRemaining(
              child: _getTabBarView(<Widget>[
                context.read(orderControllerProvider.notifier).fetchByOrderType("completed")==null?Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("No order available yet")
                  ],
                ):
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:17.0),
                  child: ListView.builder(itemBuilder: (context,index){
                    return  OrderCard(orderModel: context.read(orderControllerProvider.notifier).fetchByOrderType("completed")![index],onButtonPressed: (){
                      context.router.navigate(CompletedOrderDetailRoute(orderModel: context.read(orderControllerProvider.notifier).fetchByOrderType("completed")![index]));
                    },);
                  },itemCount: context.read(orderControllerProvider.notifier).fetchByOrderType("completed")?.length,),
                ),

                context.read(orderControllerProvider.notifier).fetchByOrderType("ongoing")==null?Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("No order available yet")
                  ],
                ):
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:17.0),
                  child: ListView.builder(itemBuilder: (context,index){
                    return  OrderCard(orderModel: context.read(orderControllerProvider.notifier).fetchByOrderType("ongoing")![index],onButtonPressed: (){
                      context.router.navigate(OngoingOrderDetailRoute(orderModel: context.read(orderControllerProvider.notifier).fetchByOrderType("ongoing")![index]));
                    },);
                  },itemCount: context.read(orderControllerProvider.notifier).fetchByOrderType("ongoing")?.length,),
                ),

                context.read(orderControllerProvider.notifier).fetchByOrderType("pending")==null?Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("No order available yet")
                  ],
                ):
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:17.0),
                  child: ListView.builder(itemBuilder: (context,index){
                    return  OrderCard(orderModel: context.read(orderControllerProvider.notifier).fetchByOrderType("pending")![index],onButtonPressed: (){
                      context.router.navigate(PendingOrderDetailRoute(orderModel: context.read(orderControllerProvider.notifier).fetchByOrderType("pending")![index]));
                    },);
                  },itemCount: context.read(orderControllerProvider.notifier).fetchByOrderType("pending")?.length,),
                ),
              ],tabController),
            )
          ],
        )));
  }

  //tabs widget
  TabBarView _getTabBarView(List<Widget>tabs,TabController tabController){
    return TabBarView(
      children: tabs,
      controller: tabController,);
  }
  TabBar _getTabBar(TabController tabController){
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
        Tab(text:"Completed"),
        Tab(text:"Ongoing",),
        Tab(text:"Pending",)
      ],
      controller: tabController,
    );
  }
}





