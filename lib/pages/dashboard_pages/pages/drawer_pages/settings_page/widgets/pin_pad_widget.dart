import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class KeyPadPage extends StatelessWidget{
  double buttonSize = 60.0;
  final TextEditingController pinController;
  final String? inputLabel;
  final Function onSubmit;
  final int pinLength;
  final void Function(String val) onChange;

  KeyPadPage({ required this.onSubmit,required this.onChange, required this.pinController,this.inputLabel,required this.pinLength});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          SizedBox(height: size.height*0.04,),
          Text(inputLabel!,style: TextStyle(color: Colors.black,fontSize: 18),),
          SizedBox(height: 10,),
          PinCodeTextField(
            appContext: context,
            controller: pinController,
            length: pinLength,
            enableActiveFill: true,
            obscuringCharacter: "*",
            pinTheme: PinTheme(activeColor: const Color(0xff0000FF),
              inactiveColor: const Color(0xffF4F4F4),
              selectedColor: const Color(0xff0000FF) ,
              selectedFillColor: const Color(0xff0000FF) ,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 43,
              fieldWidth: 43,
              activeFillColor: const Color(0xff0000FF),
              inactiveFillColor: Color(0xffF4F4F4),

            ),
            onChanged:onChange,
            obscureText: true,
            animationType: AnimationType.fade,
            animationDuration: const Duration(milliseconds: 300),
          ),
          SizedBox(height: size.height*0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget('1',pinController: pinController,pinLenght: pinLength,),
              SizedBox(height: 90,),
              ButtonWidget('2',pinController: pinController,pinLenght: pinLength),
              SizedBox(height: 90,),
              ButtonWidget('3',pinController: pinController,pinLenght: pinLength),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget('4', pinController: pinController,pinLenght: pinLength),
              SizedBox(height: 90,),
              ButtonWidget('5',pinController: pinController,pinLenght: pinLength),
              SizedBox(height: 90,),
              ButtonWidget('6',pinController: pinController,pinLenght: pinLength),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget('7',pinController: pinController,pinLenght: pinLength),
              SizedBox(height: 90,),
              ButtonWidget('8',pinController: pinController,pinLenght: pinLength),
              SizedBox(height: 90,),
              ButtonWidget('9',pinController: pinController,pinLenght: pinLength),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButtonWidget(Icons.backspace, () {
                if (pinController.text.length > 0) {
                  
                  pinController.text = pinController.text
                      .substring(0, pinController.text.length - 1);
                }
                if (pinController.text.length > pinLength) {
                  pinController.text = pinController.text.substring(0, pinLength);
                }

              }),
              SizedBox(height: 90,),
              ButtonWidget('0', pinController: pinController,pinLenght: pinLength),
              SizedBox(height: 90,),
                  iconButtonWidget(Icons.check_circle, () {
                    if (pinController.text.length > pinLength) {
                      pinController.text = pinController.text.substring(0, pinLength);
                    }
                    onSubmit(pinController.text);
              }),
            ],
          ),
        ],
      ),
    );
  }



  iconButtonWidget(IconData icon, void Function() function) {
    return Container(
      height: buttonSize,
      width: buttonSize,
      child: ElevatedButton(
        style:ButtonStyle(
            shadowColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.3)),
            elevation:MaterialStateProperty.all(4),
            overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                return states.contains(MaterialState.pressed)
                    ? const Color(0xffD1FFFF)
                    : null;
              },
            ),
            backgroundColor:MaterialStateProperty.all(Colors.white),
            shape:  MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonSize / 2)))
        ),
        onPressed: () {
          function();
        },

        child: Center(
          child: Icon(icon,
            size: 30,
            color:const Color(0xff287D7D),
          ),
        ),
      ),
    );
  }
}
class ButtonWidget extends StatefulWidget {
  final String buttonText;
  final TextEditingController pinController;
  final int pinLenght;
  const ButtonWidget(this.buttonText,{required this.pinController,required this.pinLenght});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  double buttonSize = 60.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonSize,
      width: buttonSize,
      child: ElevatedButton(
        style:ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.3)),
          elevation:MaterialStateProperty.all(4),
          overlayColor: MaterialStateProperty.resolveWith(
                (states) {
              return states.contains(MaterialState.pressed)
                  ? const Color(0xffD1FFFF)
                  : null;
            },
          ),
          backgroundColor:MaterialStateProperty.all(Colors.white),
        shape:  MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonSize / 2)))
        ),
        onPressed: () {
          if (widget.pinController.text.length <= widget.pinLenght) {
            widget.pinController.text = widget.pinController.text + widget.buttonText;
          }


        },

        child: Center(
          child: Text(
            widget.buttonText,
            style:Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold,color: const Color(0xff287D7D),fontSize: 18
            ),
          ),
        ),
      ),
    );
  }

}

// Padding(
// padding: EdgeInsets.only(left:50, right:50, bottom: 15),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: Color(0xffE5C242),
// border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.5)),
// child: Padding(
// padding: EdgeInsets.only(left: 15),
// child: TextField(
// obscureText: true,
// controller: pinController,
// readOnly: true,
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black,
// fontSize: 26,
// // fontWeight: FontWeight.bold
// // fontFamily: AppTextStyle.robotoBold
// ),
// decoration: InputDecoration(
// border: InputBorder.none,
// hintText:"",
// ),
// // controller: userDisplayName,
// ),
// ),
// ),
// )

// ElevatedButton.styleFrom(

//

//
// )
