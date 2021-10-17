import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadTaskCardSeller extends HookWidget{
  final ValueNotifier<String?> filePath;
  final ValueNotifier<FileType?> fileType;
  const UploadTaskCardSeller({required this.filePath,required this.fileType});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String fileName = filePath.value!.split('/').last;
    return Container(
      width: size.width,
      height: size.height*0.34,
      decoration: BoxDecoration(border: Border.all(color: const Color(0xffC7C7C7)),borderRadius: BorderRadius.circular(17)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height*0.24,
            decoration: BoxDecoration(color: Colors.white),
            child: fileType.value==FileType.image?ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(17),topRight: Radius.circular(17)),
                child: Image.file(File(filePath.value!),width: size.width,height: size.height,fit: BoxFit.fill,)):Container(
              color: Colors.white,
            ),
          ),
          Container(
            height: size.height*0.09,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17),bottomRight: Radius.circular(17)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.9],
                    colors: [
                      Colors.white,
                      const Color(0xffC7C7C7)
                    ]
                )),
            padding: EdgeInsets.symmetric(horizontal: 33),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.download_rounded,color: Colors.white,size: 17,),
                    Text("")//Share Icon should be here
                  ],
                ),
                Text(fileName,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700)),)
              ],
            ),),
        ],
      ),
    );
  }
}