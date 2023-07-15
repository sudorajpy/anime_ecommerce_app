import 'package:anime_ecommerce_app/screens/auth/login_screen.dart';
import 'package:anime_ecommerce_app/screens/profile/profile_with_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class ProfileScreenWithoutLogin extends StatelessWidget {
  const ProfileScreenWithoutLogin({super.key});

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
