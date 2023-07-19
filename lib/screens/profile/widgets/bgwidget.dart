import 'package:flutter/material.dart';


Widget BGWidget({Widget? child, Color? color, double? height}){
  return Container(
    height: height,
    decoration: BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage("assets/images/ace.png"),
      //   fit: BoxFit.fill,
      // ),
      color: color,
      
    ),
    child: child,
  );
}