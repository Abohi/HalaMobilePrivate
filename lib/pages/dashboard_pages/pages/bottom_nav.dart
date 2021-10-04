import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/providers/state_providers/navigation_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNav extends HookWidget {

  const BottomNav({required this.tabsRouter});
  final TabsRouter tabsRouter;
  @override
  Widget build(BuildContext context) {
    var navigationProvider = useProvider(navigationStateProvider);
    return BottomNavigationBar(
      items:  [
        BottomNavigationBarItem(
            icon: SizedBox(
                height: 20.0,
                width: 30.0,
                child: tabsRouter.activeIndex==0
                    ? Icon(Icons.home,color: const Color(0xff0000FF),)
                    : Icon(Icons.home,color: const Color(0xff7C7C7C),)),
            label:"Home"),
        BottomNavigationBarItem(
            icon: SizedBox(
                height: 20.0,
                width: 30.0,
                child: tabsRouter.activeIndex==1
                    ? Icon(Icons.markunread,color: const Color(0xff0000FF),)
                    : Icon(Icons.markunread,color: const Color(0xff7C7C7C),)),
            label: "Inbox"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xff0000FF),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff0000FF).withOpacity(0.4),
                          blurRadius: 6.0,
                          offset: Offset(0, 3))
                    ]),
                child: Center(
                    child: Icon(
                      Icons.add,
                      size: 30.41,
                      color: Colors.white,
                    )),
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: SizedBox(
                height: 20.0,
                width: 30.0,
                child: tabsRouter.activeIndex==3
                    ? Icon(Icons.archive,color: const Color(0xff0000FF),)
                    : Icon(Icons.archive,color: const Color(0xff7C7C7C),)),
            label:"Request"),
        BottomNavigationBarItem(
          icon: SizedBox(
              height: 20.0,
              width: 30.0,
              child: tabsRouter.activeIndex==4
                  ? Stack(children: [
                Icon(Icons.notifications,color: const Color(0xff0000FF)),
                Positioned(
                  right: 1,
                  top:1,
                  child: Text("3",style: TextStyle(color: Colors.red),),)
              ]): Stack(children: [
                Icon(Icons.notifications,color: const Color(0xff7C7C7C)),
                Positioned(
                  right: 1,
                  top:1,
                  child: Text("3",style: TextStyle(color: Colors.red),),)
              ])),
          label: "Alerts",),
      ],
      currentIndex: tabsRouter.activeIndex,//navigationProvider.state
      onTap: (int val){
        // navigationProvider.state=val;
        // tabsRouter.setActiveIndex(navigationProvider.state);
        tabsRouter.setActiveIndex(val);
      },

      selectedItemColor: Color(0xff0000FF),
      unselectedItemColor:const Color(0xff7C7C7C),
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle:
      GoogleFonts.roboto(fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
    );

  }
}

