import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:anime_ecommerce_app/data/lists.dart';
import 'package:anime_ecommerce_app/screens/home/widgets/appbar.dart';
import 'package:anime_ecommerce_app/screens/home/widgets/category_list.dart';
import 'package:anime_ecommerce_app/screens/home/widgets/header.dart';
import 'package:anime_ecommerce_app/widgets/gridview_builder.dart';
import 'package:anime_ecommerce_app/widgets/swiper.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import 'dart:ui';

import 'widgets/swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // print(Colors.black.value);
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
            Image.asset(
              'assets/images/eyes.gif',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            20.heightBox,
            Swiper(
                imagePath: firstSwiper,
                isEnlarged: true,
                color: Vx.green200,
                width: 300,
                0),
            20.heightBox,
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const CategoryList(),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/titan_1.png',
                  height: 300,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Center(
                        child: Text(
                      "I'm Little Shy To Come Outside",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )))
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Swiper1(
              10,
              imagePath: firstSwiper,
              isEnlarged: false,
              width: double.infinity,
              color: Colors.deepPurple[200],
            ),
            50.heightBox,
            Center(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/akatsi.png',
                    height: 400,
                  ),
                  Image.asset('assets/images/obito2.png', height: 400)
                ],
              ),
            ),

            10.heightBox,
            // Swiper(imagePath: firstSwiper,isEnlarged: false,color: Vx.purple300,width: double.infinity,10),
            10.heightBox,
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset('assets/animations/json/hand_down.json'),
                  const Text(
                    'Popular T-Shirts',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textWhiteColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            20.heightBox,

            GridViewBuilder(
              scrollPhysics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
            ),
            Row(
              children: [
                const Text(
                  'Hurry I will Deliver \n   your order',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textWhiteColor),
                ),
                const SizedBox(
                  width: 40,
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Lottie.asset(
                      'assets/animations/json/delivery_animation.json'),
                ),
              ],
            ),
            10.heightBox,
          ]),
        ),
      ),
    );
  }
}
