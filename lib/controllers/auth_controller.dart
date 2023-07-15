import 'package:anime_ecommerce_app/constants/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {

  //login method
  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  //register method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

//storing data method
storeUserData({name, password, email}) async {
  DocumentReference store = await firestore.collection(usersCollection).doc();
  store.set({
    'name': name,
    'email': email,
    'password': password,
    
    'imgUrl': '',
    
  });
}


  //signout method
  signoutMethod() async {
    await auth.signOut();
  }
}


