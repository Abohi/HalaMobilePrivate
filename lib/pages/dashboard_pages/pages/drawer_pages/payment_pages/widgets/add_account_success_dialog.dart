import 'package:flutter/material.dart';
import 'package:halawork/pages/dashboard_pages/widget/generic_response_dialog.dart';

void dialogWithDraw(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return GenericResponseDialog(
          onBottonPressed: () {
            // changeScreenReplacement(context: context, widget: Payment());
          },
          text1: "Successfully added",
          text2: "A bank account", btnText: '',
        );
      });
}