// import 'package:anime_ecommerce_app/screens/auth/login_screen.dart';
// import 'package:anime_ecommerce_app/screens/auth/signup_screen.dart';
// import 'package:anime_ecommerce_app/screens/tabs.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//         title: 'Flutter Demo',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const TabsScreen(),
//         routes: {
//           '/login': (context) => const LoginScreen(),
//           '/signup': (context) => const SignUpScreen(),
//           '/tabs': (context) => const TabsScreen(),
//         });
//   }
// }






// import 'package:anime_ecommerce_app/constants/colors.dart';
// import 'package:anime_ecommerce_app/data/lists.dart';
// import 'package:anime_ecommerce_app/screens/home/widgets/appbar.dart';
// import 'package:anime_ecommerce_app/screens/home/widgets/category_list.dart';
// import 'package:anime_ecommerce_app/screens/home/widgets/header.dart';
// import 'package:anime_ecommerce_app/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:velocity_x/velocity_x.dart';

// import 'dart:ui';

// import '../../widgets/swiper.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         flexibleSpace: const AppBarNav(),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
          
//           width: double.infinity,
//           child: Column(children: [
//             const HeaderWidget(),
//             20.heightBox,
//             Swiper(imagePath: firstSwiper,isEnlarged: true,color: Vx.green200,width: 300,0),
//             20.heightBox,
//             Divider(
//               color: Colors.white,
//               thickness: 1,
//             ),
//             CategoryList(),
//             Divider(
//               color: Colors.white,
//               thickness: 1,
//             ),
//             Row(
//               children: [
//                 Image.asset('assets/images/titan_1.png',height: 300,),
//                 Container(
//                   width: MediaQuery.of(context).size.width*0.5,
//                   child: Center(child: Text("I'm Little Shy To Come Outside",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)))
//               ],
//             ),
            
//             10.heightBox,
//             Swiper(imagePath: firstSwiper,isEnlarged: false,color: Vx.purple300,width: double.infinity,10),
//             10.heightBox,
//             Row(
//       children: [
        
//         const Text('Hurry I will Deliver \n   your order', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: textWhiteColor),),
//         const SizedBox(width: 40,),
//         SizedBox(
//           height: 100,
//           width: MediaQuery.of(context).size.width*0.4,
//           child: Lottie.asset('assets/animations/json/delivery_animation.json'),
//         ),
//       ],
//     )
//           ]),
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';

// import '../constants/colors.dart';

//   Widget customeTextField({required String hintText, required TextInputType keyboardType,  controller}) {
//     return ConstrainedBox(
      
//       constraints: const BoxConstraints(maxWidth: 300),
//       child: TextFormField(
//         controller: controller,
//         style: const TextStyle(color: Colors.green, fontSize: 18),
//         keyboardType:keyboardType ,
//         decoration: InputDecoration(
//               border: OutlineInputBorder(
//                  borderSide: const BorderSide(color: gradient1),
//                  borderRadius: BorderRadius.circular(10),
//               ),
//               hintText: hintText,
//               hintStyle: const TextStyle(color: Colors.white),
              
//             ),
//       ),
//     );
//   }





  


// import 'package:flutter/material.dart';

// import '../constants/colors.dart';


// class GradientButton extends StatelessWidget {
//   final String buttonText;
//   const GradientButton({super.key,required this.buttonText, required this.onPressed});

//   final Function() onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
        
//         borderRadius: BorderRadius.circular(10),
//         gradient: const LinearGradient(
//           colors: [
//             gradient1,
//             gradient2,
//             gradient3
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight
//         )
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed, 
        
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)
//           ),
//           // maximumSize: const Size(400, 50)
//         ),
//         child: Text(buttonText, style: const TextStyle(color: textWhiteColor, fontSize: 18)),
//         ),
//     );
//   }
// }





// import 'package:anime_ecommerce_app/constants/firebase_consts.dart';
// import 'package:anime_ecommerce_app/screens/home/home.dart';
// import 'package:anime_ecommerce_app/screens/profile/profile_with_login.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/instance_manager.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../../constants/colors.dart';
// import '../../controllers/auth_controller.dart';
// import '../../widgets/common_button.dart';

// import '../../widgets/gradiant_button.dart';
// import '../../widgets/custome_text_field.dart';
// import '../../widgets/social_button.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   var controller = Get.put(AuthController());

//   //text controllers
//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

//   onTap() async {
//     try {
//       await controller
//           .signupMethod(
//         context: context,
//         email: emailController.text,
//         password: passwordController.text,
//       )
//           .then((value) {
//         return controller.storeUserData(
//           name: nameController.text,
//           email: emailController.text,
//           password: passwordController.text,
//         );
//       }).then((value) {
//         Get.to(() => const ProfileWithLogin());
//         // Navigator.pushNamed(context, '/signup');
//       });
//     } catch (e) {
//       auth.signOut();
//       VxToast.show(context, msg: e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: backgroundColor,
//         body: Stack(children: [
//           Center(child: Image.asset('assets/images/kira.png')),
//           SingleChildScrollView(
//             child: Center(
//               child: Column(
//                 children: [
//                   // 54.heightBox,
//                   Image.asset('assets/images/signin_balls.png'),
//                   const Text('Sign Up',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 44,
//                           color: Colors.white)),
//                   40.heightBox,
//                   customeTextField(
//                     hintText: 'Name',
//                     keyboardType: TextInputType.name,
//                     controller: nameController,
//                   ),
//                   20.heightBox,
//                   customeTextField(
//                     hintText: 'Email',
//                     keyboardType: TextInputType.emailAddress,
//                     controller: emailController,
//                   ),
//                   20.heightBox,
//                   customeTextField(
//                     hintText: 'Password',
//                     keyboardType: TextInputType.visiblePassword,
//                     controller: passwordController,
//                   ),
//                   30.heightBox,
//                   GradientButton(
//                     onPressed: onTap,
//                     buttonText: 'Sign Up',
//                   ),
//                   10.heightBox,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SocialIconButton(
//                         iconPath: 'assets/animations/svgs/g_logo.svg',
//                       ),
//                       50.widthBox,
//                       const SocialIconButton(
//                         iconPath: 'assets/animations/svgs/f_logo.svg',
//                       ),
//                     ],
//                   ),
//                   10.heightBox,
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Already have an account?',
//                       style: TextStyle(color: textWhiteColor, fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             left: 10,
//             top: 10,
//             child: CommonButton(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               color: const Color.fromARGB(255, 255, 176, 7),
//               child: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }





// import 'package:anime_ecommerce_app/constants/firebase_consts.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:velocity_x/velocity_x.dart';

// class AuthController extends GetxController {

//   //login method
//   Future<UserCredential?> loginMethod({email, password, context}) async {
//     UserCredential? userCredential;
//     try{
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch(e){
//       VxToast.show(context, msg: e.toString());
//     }

//     return userCredential;
//   }

//   //register method
//   Future<UserCredential?> signupMethod({email, password, context}) async {
//     UserCredential? userCredential;
//     try{
//       await auth.createUserWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch(e){
//       VxToast.show(context, msg: e.toString());
//     }

//     return userCredential;
//   }

// //storing data method
// storeUserData({name, password, email}) async {
//   DocumentReference store = await firestore.collection(usersCollection).doc();
//   store.set({
//     'name': name,
//     'email': email,
//     'password': password,
    
//     'imgUrl': '',
    
//   });
// }


//   //signout method
//   signoutMethod() async {
//     await auth.signOut();
//   }
// }







// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';


// FirebaseAuth auth = FirebaseAuth.instance;
// FirebaseFirestore firestore = FirebaseFirestore.instance;
// User? currentUser = auth.currentUser;

// const usersCollection = 'users';