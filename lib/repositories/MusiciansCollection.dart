
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicapp/auth/auth_service.dart';

import 'models/UserModel.dart';

class Musician {

  static CollectionReference Musicians = FirebaseFirestore.instance.collection("Musicians"); // Musicians Collection variable
  var getDocument = Musicians.doc(AuthService.userID).get();

  // User Info Variables
  final userEmail = AuthService.userData?.email;
  static String? name;
  static String? description;

  // Create A user
  createUser(UserModel user) async {
    await Musicians.doc(AuthService.userID).set(user.toJson());
  }

  // Add Musician Name
  Future<void> addName(String username, DocumentSnapshot document) async
  {
    await Musicians.doc(document.id).update({
      "username" : username
    });

    name = username;
  }

  // Add Description
  Future<void> addDescription(String desc, DocumentSnapshot document) async
  {
    await Musicians.doc(document.id).update({
      "description" : desc
    });

    description = desc;
  }

  // Add Instruments TODO
  Future<void> addInstruments(List<String>? instruments, DocumentSnapshot document) async
  {
    await Musicians.doc(document.id).update({
      "instruments" : instruments,
    });
  }

}