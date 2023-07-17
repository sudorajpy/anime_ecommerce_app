import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';


Widget BGWidget({Widget? child, Color? color}){
  return Container(
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