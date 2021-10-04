import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firstHalfStateProvider = StateProvider<String>((ref){
  return  "";
});
final secondHalfStateProvider = StateProvider<String>((ref){
  return  "";
});
final flagStateProvider = StateProvider<bool>((ref){
  return  true;
});
class ExpandableTextView extends HookWidget {
  double? textSize;
  Color? textColor;

  ExpandableTextView(
      { required this.textColor, required this.textSize});


  @override
  Widget build(BuildContext context) {
    var firstHalfState = useProvider(firstHalfStateProvider);
    var secondHalfState = useProvider(secondHalfStateProvider);
    var flagState = useProvider(flagStateProvider);
    return Container(
      child: secondHalfState.state.isEmpty
          ? Text(firstHalfState.state,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: textColor ?? const Color(0xff0000FF),
                  fontSize: textSize ?? 14)))
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            flagState.state ? (firstHalfState.state + "...") : (firstHalfState.state + secondHalfState.state),
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: textColor ?? const Color(0xff0000FF),
                    fontSize: textSize ?? 14)),
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  flagState.state ? "View More" : "View Less",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: const Color(0xff0000FF), fontSize: 14)),
                ),
              ],
            ),
            onTap: () {
              flagState.state = !flagState.state;
            },
          ),
        ],
      ),
    );
  }
}