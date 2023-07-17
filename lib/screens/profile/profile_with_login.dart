import 'package:anime_ecommerce_app/constants/colors.dart';
import 'package:anime_ecommerce_app/constants/firebase_consts.dart';
import 'package:anime_ecommerce_app/screens/profile/widgets/bgwidget.dart';
import 'package:anime_ecommerce_app/screens/profile/widgets/buttons.dart';
import 'package:anime_ecommerce_app/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../../controllers/profile_controller.dart';
import '../../widgets/common_button.dart';

class ProfileWithLogin extends StatefulWidget {
  const ProfileWithLogin({super.key});

  @override
  State<ProfileWithLogin> createState() => _ProfileWithLoginState();
}

class _ProfileWithLoginState extends State<ProfileWithLogin> {
  String name = "Ace";
  var controller = Get.put(ProfileController());

  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    // final ProfileController controller = Get.put(ProfileController());

    return BGWidget(
      color: backgroundColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/editprofile');
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        backgroundColor: Colors.transparent,
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: currentUser != null
              ? FireStoreServices.getUser(currentUser!.uid)
              : null,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              var data = snapshot.data!.docs[0].data() as Map<String, dynamic>;

              return Center(
                child: Column(
                  children: [
                    (context.screenHeight * 0.01).heightBox,
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/ace.png"),
                    ),
                    20.heightBox,
                    Text(
                      '${data['name']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.red,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.diamond_outlined,
                            color: Colors.white,
                          ),
                          10.widthBox,
                          const Text(
                            'Gold Member',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    (context.screenHeight * 0.1).heightBox,
                    Expanded(
                        child: Container(
                      width: context.screenWidth,
                      height: context.screenHeight,
                      color: textWhiteColor,
                      child: Column(
                        children: [
                          10.heightBox,
                          Row(
                            children: [
                              const Text(
                                'Transaction Details',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'View All',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonsWidget(),
                              ButtonsWidget(),
                              ButtonsWidget(),
                              ButtonsWidget(),
                            ],
                          ),
                          20.heightBox,
                          const ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            title: Text(
                              'My Wallet',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            title: Text(
                              'Member Status',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            title: Text(
                              'Voucher',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            title: Text(
                              'Help',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              );
            }else {
      // Handle the case when the snapshot doesn't have data or docs list is empty
      return const Text('No data available');
    }
          },
          
        ),
      ),
    );
  }
}
