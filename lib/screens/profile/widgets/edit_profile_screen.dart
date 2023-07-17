import 'dart:io';

import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:anime_ecommerce_app/widgets/custome_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../controllers/profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, this.data});

  final dynamic data;

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
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Colors.transparent),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: widget.data['imgUrl'] == '' &&
                                  controller.profileImgPath.isEmpty
                              ? Image.asset(
                                  'assets/images/ace.png',
                                  fit: BoxFit.cover,
                                )
                              : widget.data['imgUrl'] != '' &&
                                      controller.profileImgPath.isEmpty
                                  ? Image.network(
                                      widget.data['imgUrl'],
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
                        icon: const Icon(
                          Icons.edit_square,
                          color: Colors.white,
                        )),
                  ],
                ),
                (context.screenHeight * 0.05).heightBox,
                customeTextField(
                    controller: controller.nameController,
                    hintText: "Name",
                    keyboardType: TextInputType.name,
                    icon: const Icon(
                      Icons.person,
                      color: textWhiteColor,
                    ),
                    labelText: "Name"),
                (context.screenHeight * 0.03).heightBox,

                customeTextField(
                    controller: controller.oldPassController,
                    hintText: "*********",
                    keyboardType: TextInputType.visiblePassword,
                    icon: const Icon(
                      Icons.password_outlined,
                      color: textWhiteColor,
                    ),
                    labelText: "Old Password"),
                (context.screenHeight * 0.03).heightBox,
                customeTextField(
                    controller: controller.newPassController,
                    hintText: "*********",
                    keyboardType: TextInputType.visiblePassword,
                    icon: const Icon(
                      Icons.password_outlined,
                      color: textWhiteColor,
                    ),
                    labelText: "New Password"),
                (context.screenHeight * 0.03).heightBox,
                customeTextField(
                    controller: controller.phoneNumController,
                    hintText: "987543210",
                    keyboardType: TextInputType.phone,
                    icon: const Icon(
                      Icons.person,
                      color: textWhiteColor,
                    ),
                    labelText: "Phone Number"),
                (context.screenHeight * 0.05).heightBox,
                controller.isloading.value
                    ? const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.redAccent),
                      )
                    : Container(
                        width: double.infinity,
                        height: 60,
                        margin: EdgeInsets.only(
                            left: (context.screenWidth * 0.1),
                            right: (context.screenWidth * 0.1),
                            bottom: (context.screenHeight * 0.05)),
                        child: ElevatedButton(
                          onPressed: () async {
                            controller.isloading(true);

                            //if image is not selected
                            if (controller.profileImgPath.value.isNotEmpty) {
                              await controller.uploadProfileImg();
                            } else {
                              controller.profileImgUrl = widget.data['imgUrl'];
                            }

                            //if new password match with old password
                            if (widget.data['password'] ==
                                controller.oldPassController.text) {
                              await controller.changeAuthPass(
                                email: widget.data['email'],
                                password: controller.oldPassController.text,
                                newpassword: controller.newPassController.text,
                              );

                            await controller.updateProfile(
                                  imgUrl: controller.profileImgUrl,
                                  name: controller.nameController.text,
                                  phone: controller.phoneNumController.text,
                                  password: controller.newPassController.text);
                              Navigator.of(context).pop();
                              
                            } 
                            
                            // else if(controller.oldPassController == '' && controller.newPassController == ''){
                            //   await controller.updateProfile(
                            //       imgUrl: controller.profileImgUrl,
                            //       name: controller.nameController.text,
                            //       phone: controller.phoneNumController.text,
                            //       password: controller.newPassController.text);
                            //   Navigator.of(context).pop();
                            // }
                            
                            
                            
                            else {
                              //if new password not match with old password
                              Get.snackbar('Error', 'Old Password Not Match',colorText:Color.fromARGB(255, 0, 0, 0),backgroundColor:  Color.fromARGB(22, 248, 245, 245));
                              controller.isloading(false);
                            }
                          },
                          child: const Text(
                            "Save Changes",
                            style: TextStyle(color: textWhiteColor),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red[900]),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(102)))),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
