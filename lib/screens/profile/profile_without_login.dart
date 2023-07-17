import 'package:anime_ecommerce_app/constants/firebase_consts.dart';
import 'package:anime_ecommerce_app/screens/auth/login_screen.dart';
import 'package:anime_ecommerce_app/screens/profile/profile_with_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class ProfileScreenWithoutLogin extends StatefulWidget {
  const ProfileScreenWithoutLogin({super.key});

  @override
  State<ProfileScreenWithoutLogin> createState() => _ProfileScreenWithoutLoginState();
}

class _ProfileScreenWithoutLoginState extends State<ProfileScreenWithoutLogin> {
  changeScreen(){
    // Future.delayed(const Duration(seconds: 0), () {

      auth.authStateChanges().listen((User? user) {
        if (user == null ) {
          Get.to(() => const LoginScreen());
        } else {
          
          Get.to(() => const ProfileWithLogin());
        }
      });

      
    
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Center(child: Image.asset('assets/images/ace.png')),
                Positioned(
                  left: 100,
                  right: 100,
                  top: 340,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text(
                      'Broo... You need to Login',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}






