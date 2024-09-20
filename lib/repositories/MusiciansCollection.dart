
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicapp/auth/auth_service.dart';

import 'models/UserModel.dart';

class Musician {

  static CollectionReference Musicians = FirebaseFirestore.instance.collection("Musicians"); // Musicians Collection variable
  final userEmail = AuthService.userData?.email;
  var getDocument = Musicians.doc(AuthService.userID).get();

  // Create A user
  createUser(UserModel user) async {
    await Musicians.doc(AuthService.userID).set(user.toJson());
  }

  // Add Musician Name
  void addName(String username, DocumentSnapshot document) async
  {
    Musicians.doc(document.id).update({
      "email" : userEmail,
      "username" : username
    });
  }

  // Add Description
  void addDescription(String desc, DocumentSnapshot document) async
  {
    document
  }

}