import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:anime_ecommerce_app/data/lists.dart';
import 'package:anime_ecommerce_app/screens/home/widgets/appbar.dart';
import 'package:anime_ecommerce_app/screens/home/widgets/category_list.dart';
import 'package:anime_ecommerce_app/screens/home/widgets/header.dart';
import 'package:anime_ecommerce_app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import 'dart:ui';

import '../../widgets/swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        flexibleSpace: const AppBarNav(),
      ),
      body: SingleChildScrollView(
        child: Container(
          
          width: double.infinity,
          child: Column(children: [
            const HeaderWidget(),
            20.heightBox,
            Swiper(imagePath: firstSwiper,isEnlarged: true,color: Vx.green200,width: 300,0),
            20.heightBox,
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            CategoryList(),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Row(
              children: [
                Image.asset('assets/images/titan_1.png',height: 300,),
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Center(child: Text("I'm Little Shy To Come Outside",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)))
              ],
            ),
            
            10.heightBox,
            Swiper(imagePath: firstSwiper,isEnlarged: false,color: Vx.purple300,width: double.infinity,10),
            10.heightBox,
            Row(
      children: [
        
        const Text('Hurry I will Deliver \n   your order', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: textWhiteColor),),
        const SizedBox(width: 40,),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width*0.4,
          child: Lottie.asset('assets/animations/json/delivery_animation.json'),
        ),
      ],
    )
          ]),
        ),
      ),
    );
  }
}
