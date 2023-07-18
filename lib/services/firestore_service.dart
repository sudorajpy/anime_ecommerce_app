import 'package:anime_ecommerce_app/data/lists.dart';

import '../constants/firebase_consts.dart';

class FireStoreServices {

//get users data
  static getUser(uid){
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }


//get products data
  static getProducts(){
    return firestore.collection(productsCollection).where('category',isEqualTo: categoryNameList).snapshots();
  }
}