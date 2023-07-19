import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Swiper1 extends StatelessWidget {
  Swiper1(
    this.margin,{
    super.key,
    required this.imagePath,
    required this.isEnlarged,
    this.color,
    required this.width,
  });

  final imagePath;
  final bool isEnlarged;
  final Color? color;
  final double width;
  double? margin;
  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: isEnlarged,
        scrollDirection: Axis.horizontal,
        itemCount: imagePath.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,),
            // height: 400,
            
            child: Image.asset(
              imagePath[index],
              height: 230,
            ),
          );
        });
  }
}





