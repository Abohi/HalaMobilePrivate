import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page/widgets/pin_pad_widget.dart';
import 'package:halawork/repositories/auth_repository.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:halawork/widgets/CustomButtonSignup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
class CreatePinPage extends HookWidget{
  const CreatePinPage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isNewPin = useState<bool>(true);
    var isConfirmPin =useState<bool>(false);
    var pinTextEditingController= useTextEditingController();
    var confirmPinTextEditingController= useTextEditingController();
    var newPinText = useState<String>("");
    var confirmText = useState<String>("");
    var isContinue=useState(false);
    return SafeArea(
      child: ProgressHUD(
        backgroundColor:const Color(0xff0000FF),
        indicatorColor: Colors.white,
        child: Builder(
          builder: (context){
            return Scaffold(
              appBar: AppBar(
                elevation: 5,
                title: Text(
                  "Create Pin",
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
              backgroundColor: Colors.white,
              body: Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height*0.2,),
                      Visibility(
                        visible: isNewPin.value,
                        child: KeyPadPage(pinLength: 4,
                          inputLabel: "ENTER PIN",
                          pinController: pinTextEditingController,
                          onSubmit: (String pin) {
                            isNewPin.value = false;
                            isConfirmPin.value = true;
                            newPinText.value=pin;
                          }, onChange: (String val) {

                          },
                        ),
                      ),
                      Visibility(
                        visible: isConfirmPin.value,
                        child: KeyPadPage(pinLength: 4,
                          inputLabel: "CONFIRM PIN",
                          pinController: confirmPinTextEditingController,
                          onSubmit: (String pin) {
                            confirmText.value=pin;
                            if(newPinText.value!=confirmText.value)
                              return Fluttertoast.showToast(msg: "Pin do not match",toastLength: Toast.LENGTH_LONG);
                            isContinue.value = true;
                          }, onChange: (String val) {

                          },
                        ),
                      ),
                      const SizedBox(height: 30,),

                      Visibility(
                        visible: isContinue.value,
                        child:  CustomButtonSignup(buttonBg: const Color(0xff0000FF),
                          buttonTitle: "CREATE PIN",
                          buttonFontColor: Colors.white,
                          onButtonPressed: () async{
                            final progress = ProgressHUD.of(context);
                            progress!.showWithText('Creating Pin...');
                            await context.read(userRepositoryProvider).addUserMap({"transactionPin":newPinText.value});
                            progress.dismiss();
                            await Fluttertoast.showToast(msg: "Pin created successfully",toastLength: Toast.LENGTH_LONG);
                            context.popRoute();
                          }, imageIcon: null,),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
