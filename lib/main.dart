import 'package:anime_ecommerce_app/screens/auth/login_screen.dart';
import 'package:anime_ecommerce_app/screens/auth/signup_screen.dart';
import 'package:anime_ecommerce_app/screens/profile/profile_without_login.dart';
import 'package:anime_ecommerce_app/screens/profile/widgets/edit_profile_screen.dart';
import 'package:anime_ecommerce_app/screens/profile/profile_with_login.dart';
import 'package:anime_ecommerce_app/screens/tabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        
        home: const TabsScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/tabs': (context) => const TabsScreen(),
          '/editprofile': (context) => const EditProfileScreen(),
        });
  }
}






