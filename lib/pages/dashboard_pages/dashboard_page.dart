import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/widget/bottom_nav.dart';
import 'package:halawork/pages/dashboard_pages/widget/custom_drawer.dart';
import 'package:halawork/providers/state_providers/navigation_provider.dart';
import 'package:halawork/providers/state_providers/tab_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashBoardPage extends HookWidget {
  const DashBoardPage();

  @override
  Widget build(BuildContext context) {
    final scafKey = useMemoized(() => GlobalKey<ScaffoldState>());
    var navigationProvider = useProvider(navigationStateProvider);
    var tabRouteState = useProvider(tabRouteStateProvider);
    var userModelState = useProvider(userControllerProvider);
    return Scaffold(
      body: AutoTabsRouter(
        routes: [const HomeRoute(),const InboxRoute(),const CreateRequestRoute(),const RequestRoute(),const NotificationRoute()],
        duration: const Duration(milliseconds: 400),
        builder: (context, child, animation) {
          final tabsRouter = context.tabsRouter;
          WidgetsBinding.instance!
              .addPostFrameCallback((_){
                if(tabRouteState.state==null){
                  tabRouteState.state = tabsRouter;
                }
          });
          return Scaffold(
            drawer: CustomDrawer(),
            key: scafKey,
            appBar: AppBar(elevation: 0,title: Text(_getAppBarTile(navigationProvider.state,userModelState),style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xff29283C)
            ),),leading: GestureDetector(
              onTap: (){
                scafKey.currentState?.openDrawer();
              },
              child: userModelState==null?SizedBox.shrink():userModelState.profilePictureUrl==null?Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text("${userModelState.email!.toUpperCase().substring(0,1)}",style: GoogleFonts.roboto(
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
              ):Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(userModelState.profilePictureUrl!),
                ),
              ),
            ),
              backgroundColor:Colors.white,centerTitle: true,),
            body: FadeTransition(child: child, opacity: animation),
            bottomNavigationBar: BottomNav(tabsRouter: tabsRouter,),
          );
        },
      ),
    );
  }

  String _getAppBarTile(int? index,UserModel? userModel){
    switch(index){
      case 0:
        return "Home";
      case 1:
        return "Inbox";
      case 2:
        return "Create Request";
      case 3:
        return userModel?.isSeller==null?"Manage request":userModel!.isSeller?"Manage requests":"Manage Offers";
      case 4:
        return "Alerts";
      default:
        return "Home";
    }
  }
}
