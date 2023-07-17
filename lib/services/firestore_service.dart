import '../constants/firebase_consts.dart';

class FireStoreServices {

//get users data
  static getUser(uid){
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }
}