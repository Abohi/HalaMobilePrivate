import 'package:flutter/material.dart';

double presenceResponsiveHeight(BuildContext context){
  var size= MediaQuery.of(context).size;
  if(size.height<=569) return (size.height*0.90);
  if(size.height>569) return (size.height*0.8);
  return (size.height*0.8);
}