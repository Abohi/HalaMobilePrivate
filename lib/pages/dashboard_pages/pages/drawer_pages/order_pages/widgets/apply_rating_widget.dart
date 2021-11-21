import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyRatingWidget extends HookWidget {
  final String ratingHeader;
  final Function(double ratingValue) onButtonPressed;
  final bool isIgnoreGesture;
  const ApplyRatingWidget({required this.ratingHeader,required this.onButtonPressed,required this.isIgnoreGesture});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ratingHeader,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: const Color(0xff555555))),),
        const SizedBox(height:11),
        Container(
          width: size.width*0.7,
          height: size.height*0.08,
          decoration: BoxDecoration(color: Colors.white,border: Border.all(color:const Color(0xffC7C7C7)),borderRadius: BorderRadius.circular(28)),
          child: Center(
            child: RatingBar.builder(
              minRating: 1,
              itemSize: 24,
              direction: Axis.horizontal,
              ignoreGestures: isIgnoreGesture,
              unratedColor: const Color(0xffC7C7C7),
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                onButtonPressed(rating);
                print("ratings ${rating}");
              },
            ),
          ),

        ),
      ],
    );
  }
}