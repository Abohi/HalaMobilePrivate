import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/order_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class CustomDrawer extends HookWidget {
  const CustomDrawer();

  @override
  Widget build(BuildContext context) {
    var userModelState = useProvider(userModelExtensionController);
    var size = MediaQuery.of(context).size;
    return SafeArea(child: Material(
      color: const Color(0xffE6E6E6),
      child: Container(
        height: size.height,
        width: 275,
        color: const Color(0xffE6E6E6),
        padding: EdgeInsets.only(left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            userModelState?.userModel.profilePictureUrl==null?Padding(
        padding: const EdgeInsets.only(top: 46.0, bottom: 17.5,left: 17),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text("${userModelState?.userModel.email!.toUpperCase().substring(0,1)}",style: GoogleFonts.roboto(
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
                    ),
                    SizedBox(
                      width: 11.46,
                    ),
                    Text(
                     "${userModelState?.userModel.email!.toUpperCase().substring(0,userModelState.userModel.email!.indexOf("@"))}",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff29283C))),
                    )
                  ]),
            ):Padding(
              padding: const EdgeInsets.only(top: 46.0, bottom: 17.5,left: 17),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width:44,
                      height: 44,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(userModelState!.userModel.profilePictureUrl!),
                      ),
                    ),
                    SizedBox(
                      width: 11.46,
                    ),
                    Text(
                      userModelState.userModel.sellerType=="Organization"?"${userModelState.userModel.orgDetailModel!["firstName"]} ${userModelState.userModel.orgDetailModel!["lastName"]}":"${userModelState.userModel.firstName} ${userModelState.userModel.lastName}",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff29283C))),
                    )
                  ]),
            ),
            Divider(
              color: const Color(0xffC7C7C7),
              height: 1,
            ),
            SizedBox(
              width: 275,
              height: size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DrawerItems(
                    drawerIcon: Icons.person,
                    drawerItemTitle: "Profile",
                    onTap: (){
                      context.router.navigate(ProfileRoute());
                    },
                  ),
                  DrawerItems(
                    drawerIcon: Icons.gavel,
                    drawerItemTitle: "Dispute",
                    onTap: () {
                      context.router.navigate(DisputeRoute());
                    },
                  ),
                  userModelState!.userModel.isSeller?DrawerItems(
                    drawerIcon: Icons.payment,
                    drawerItemTitle: "Payment",
                    onTap: () {
                      context.router.navigate(const PaymentRoute());
                    },
                  ):SizedBox.shrink(),
                  DrawerItems(
                    drawerIcon: Icons.archive,
                    drawerItemTitle: "Orders",
                    onTap: () {
                      context.router.navigate(const OrderRoute());
                    },
                  ),
                  // DrawerItems(
                  //   drawerIcon: Icons.archive,
                  //   drawerItemTitle: "Modifications",
                  //   onTap: () {
                  //     context.router.navigate(const ModificationRoute());
                  //   },
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 33.5),
                    child: const Divider(
                      color: const Color(0xffC7C7C7),
                      height: 1,
                    ),
                  ),
                  DrawerItems(
                    drawerIcon: Icons.settings,
                    drawerItemTitle: "Settings",
                    onTap: () {
                      context.router.navigate(SettingsRoute());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 33.5),
                    child: Divider(
                      color: const Color(0xffC7C7C7),
                      height: 1,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: DrawerItems(
                      drawerIcon: Icons.system_update_alt,
                      drawerItemTitle: "Logout",
                      onTap: () {},
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
class DrawerItems extends StatelessWidget {
  final IconData drawerIcon;
  final String drawerItemTitle;
  final Function onTap;

  const DrawerItems(
      {required this.drawerIcon, required this.drawerItemTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTap();
      },
      child: Container(
        padding: const EdgeInsets.only(top: 33.5, left: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              drawerIcon,
              color: const Color(0xff5A5AFC),
              size: 16,
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              drawerItemTitle,
              style: GoogleFonts.roboto(
                  textStyle:
                  TextStyle(fontSize: 16, color: const Color(0xff29283C))),
            )
          ],
        ),
      ),
    );
  }
}