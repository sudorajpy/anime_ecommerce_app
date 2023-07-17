import 'package:anime_ecommerce_app/controllers/auth_controller.dart';
import 'package:anime_ecommerce_app/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import '../../widgets/common_button.dart';
import '../../widgets/gradiant_button.dart';

import '../../widgets/custome_text_field.dart';
import '../../widgets/social_button.dart';
import '../tabs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(AuthController());
  onTap() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(children: [
          Image.asset('assets/images/death_note.png'),
          SingleChildScrollView(
            child: Center(
              child: Obx(
                ()=> Column(
                  children: [
                    // 54.heightBox,
                    // Image.asset('assets/images/signin_balls.png'),
                    // const Text('Sign In',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 44,
                    //         color: Colors.green)),
                    200.heightBox,
                    const SocialButton(
                        iconPath: 'assets/animations/svgs/g_logo.svg',
                        label: 'Sign in with Google'),
                    20.heightBox,
                    const SocialButton(
                        iconPath: 'assets/animations/svgs/f_logo.svg',
                        label: 'Sign in with Facebook',
                        horizontalPadding: 50),
                    20.heightBox,
                    const Text('Or',
                        style: TextStyle(color: textWhiteColor, fontSize: 18)),
                    20.heightBox,
                    customeTextField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                    ),
                    20.heightBox,
                    customeTextField(
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.passwordController,
                    ),
                    30.heightBox,
                    controller.isLoading.value ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ) : GradientButton(
                      onPressed: () async {
                        controller.isLoading.value = true;
                        await controller
                            .loginMethod(context: context)
                            .then((value) {
                          if (value != null) {
                            Get.offAll(() => const TabsScreen());
                          }else{
                            controller.isLoading.value = false;
                          }
                        });
                      },
                      buttonText: 'Sign In',
                    ),
                    10.heightBox,
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot \nPassword?',
                                style: TextStyle(
                                    color: textWhiteColor, fontSize: 18),
                              )),
                          TextButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: const Text(
                              'Don\'t have \nan account?',
                              style:
                                  TextStyle(color: textWhiteColor, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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


