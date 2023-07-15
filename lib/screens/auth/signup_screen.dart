import 'package:anime_ecommerce_app/constants/firebase_consts.dart';
import 'package:anime_ecommerce_app/screens/home/home.dart';
import 'package:anime_ecommerce_app/screens/profile/profile_with_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/common_button.dart';

import '../../widgets/gradiant_button.dart';
import '../../widgets/custome_text_field.dart';
import '../../widgets/social_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  onTap() async {
    try {
      await controller
          .signupMethod(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        return controller.storeUserData(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        );
      }).then((value) {
        Get.to(() => const ProfileWithLogin());
        // Navigator.pushNamed(context, '/signup');
      });
    } catch (e) {
      auth.signOut();
      VxToast.show(context, msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(children: [
          Center(child: Image.asset('assets/images/kira.png')),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  // 54.heightBox,
                  Image.asset('assets/images/signin_balls.png'),
                  const Text('Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                          color: Colors.white)),
                  40.heightBox,
                  customeTextField(
                    hintText: 'Name',
                    keyboardType: TextInputType.name,
                    controller: nameController,
                  ),
                  20.heightBox,
                  customeTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  20.heightBox,
                  customeTextField(
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                  ),
                  30.heightBox,
                  GradientButton(
                    onPressed: onTap,
                    buttonText: 'Sign Up',
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SocialIconButton(
                        iconPath: 'assets/animations/svgs/g_logo.svg',
                      ),
                      50.widthBox,
                      const SocialIconButton(
                        iconPath: 'assets/animations/svgs/f_logo.svg',
                      ),
                    ],
                  ),
                  10.heightBox,
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Already have an account?',
                      style: TextStyle(color: textWhiteColor, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: CommonButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              color: const Color.fromARGB(255, 255, 176, 7),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.red,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}



// InkWell(
//                     onTap: () async {
//                       try {
//                         await controller
//                             .signupMethod(
//                           context: context,
//                           email: emailController.text,
//                           password: passwordController.text,
//                         )
//                             .then((value) {
//                           return controller.storeUserData(
//                             name: nameController.text,
//                             email: emailController.text,
//                             password: passwordController.text,
//                           );
//                         }).then((value) {
//                           Get.offAll(ProfileWithLogin());
//                         });
//                       } catch (e) {
//                         auth.signOut();
//                         VxToast.show(context, msg: e.toString());
//                       }
//                     },