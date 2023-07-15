import 'package:anime_ecommerce_app/constants/colors.dart';

import 'package:flutter/material.dart';

import '../../widgets/common_button.dart';

class ProfileWithLogin extends StatefulWidget {
  const ProfileWithLogin({super.key});

  @override
  State<ProfileWithLogin> createState() => _ProfileWithLoginState();
}

class _ProfileWithLoginState extends State<ProfileWithLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Image.asset('assets/images/ace.png'),
          Container(
            color: Color.fromARGB(255, 45, 61, 205).withOpacity(0.5),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.green.withOpacity(0.7),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 60,
                        child: Image.asset(
                          'assets/images/madara.png',
                        ),
                      ),
                      const Text(
                        'Your Name',
                        style: TextStyle(fontSize: 24, color: textWhiteColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // height: double.infinity,
                  width: double.infinity,
                  // color: Colors.green.shade100.withOpacity(0.5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 160,
                            child: ElevatedButton(
                          
                              style: ButtonStyle(
                                
                                elevation: const MaterialStatePropertyAll(4),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ))),
                              onPressed: () {},
                              child: const Text('Orders'),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(4),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ))),
                              onPressed: () {},
                              child: const Text('Coupons'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 160,
                            child: ElevatedButton(
                          
                              style: ButtonStyle(
                                
                                elevation: const MaterialStatePropertyAll(4),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ))),
                              onPressed: () {},
                              child: const Text('Wallet'),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(4),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ))),
                              onPressed: () {},
                              child: const Text('Help Center'),
                            ),
                          ),
                        ],
                      ),
                                  
                      const Divider(
                        thickness: 5,),
                        const Text('Account Settings',style: TextStyle(color: Color.fromARGB(255, 65, 19, 39),fontSize: 18),),
                      // const AccountSettingWidget()
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 15,
              right: 15,
              child: CommonButton(
                child: const Icon(Icons.settings),
              ),
              ),
        ],
      ),
    ));
  }
}
