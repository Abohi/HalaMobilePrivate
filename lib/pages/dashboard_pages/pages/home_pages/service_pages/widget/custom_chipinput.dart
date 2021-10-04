import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomChipInput extends HookWidget {
  final List<String> skillsList;
  final int index;
  final bool selected;
  final Function onTap;

  const CustomChipInput(
      {required this.skillsList, required this.index, required  this.onTap, required this.selected});


  @override
  Widget build(BuildContext context) {
    var _selected = useState<bool>(false);
    var isSelected = useState<bool>(false);
    isSelected.value = selected;
    return InputChip(
        selected: _selected.value,
        labelPadding: EdgeInsets.only(left: 0, top: -4, bottom: -4),
        label: Text(skillsList[index],
            style: GoogleFonts.roboto(
              textStyle:
              TextStyle(color: const Color(0xff5A5AFC), fontSize: 10),
            )),
        labelStyle: GoogleFonts.roboto(
            textStyle: TextStyle(color: const Color(0xffEBEBFF), fontSize: 10)),
        backgroundColor: const Color(0xffEBEBFF),
        onPressed: () {
          isSelected.value = !isSelected.value;
          _selected.value = !_selected.value;
          if (onTap != null) onTap();
        });
  }
}