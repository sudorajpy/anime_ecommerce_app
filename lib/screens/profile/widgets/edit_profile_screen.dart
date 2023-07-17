import 'dart:io';

import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:anime_ecommerce_app/widgets/custome_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../controllers/profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: textWhiteColor),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                // (context.screenHeight * 0.05).heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (context.screenWidth * 0.1).widthBox,
                    Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Colors.transparent),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: controller.profileImgPath.isEmpty
                              ? Image.asset(
                                  'assets/images/ace.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(controller.profileImgPath.value),
                                  fit: BoxFit.cover,
                                ),
                        )),

                    // CircleAvatar(
                    //   radius: 70,
                    //   backgroundImage: controller.profileImgPath.isEmpty
                    //       ? AssetImage('assets/images/ace.png')
                    //       : Image.file(File(controller.profileImgPath.value)),
                    // ),
                    //  CircleAvatar(
                    //   radius: 70,
                    //   foregroundImage:
                    //   controller.profileImgPath.isEmpty ?
                    //   AssetImage('assets/images/ace.png')
                    //   : Image.file(File(controller.profileImgPath.value)),
                    // ),
                    IconButton(
                        onPressed: () {
                          controller.changeImage(context);
                        },
                        icon: Icon(
                          Icons.edit_square,
                          color: Colors.white,
                        )),
                  ],
                ),
                (context.screenHeight * 0.05).heightBox,
                customeTextField(
                    hintText: "Name",
                    keyboardType: TextInputType.name,
                    icon: Icon(
                      Icons.person,
                      color: textWhiteColor,
                    ),
                    labelText: "Name"),
                (context.screenHeight * 0.05).heightBox,

                customeTextField(
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    icon: Icon(
                      Icons.email_outlined,
                      color: textWhiteColor,
                    ),
                    labelText: "Email"),
                (context.screenHeight * 0.05).heightBox,
                customeTextField(
                    hintText: "987543210",
                    keyboardType: TextInputType.phone,
                    icon: Icon(
                      Icons.person,
                      color: textWhiteColor,
                    ),
                    labelText: "Phone Number"),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(
            left: (context.screenWidth * 0.1),
            right: (context.screenWidth * 0.1),
            bottom: (context.screenHeight * 0.05)),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Save Changes",
            style: TextStyle(color: textWhiteColor),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red[900]),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(102)))),
        ),
      ),
    );
  }
}
