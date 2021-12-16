import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:halawork/app_route/app_route.gr.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page/widgets/settings_item_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class SecurityPage extends HookWidget{
  const SecurityPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userModelState = useProvider(userModelExtensionController);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        title: Text(
          "Security",
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
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsItemCard(labelText: "Set Transaction Pin", onButtonPressed: (){
              context.router.navigate(CreatePinRoute());
            },),
            SettingsItemCard(labelText: "Change Transaction Pin", onButtonPressed: ()async{
              if(userModelState!.userModel.transactionPin==null)
                return await Fluttertoast.showToast(msg: "You have not created a pin yet",toastLength: Toast.LENGTH_LONG);

              context.router.navigate(ChangePinRoute());
            },)
          ],
        ),
      ),
    );
  }
}
