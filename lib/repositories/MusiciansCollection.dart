
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

  // Edit Musician Name
  Future<void> editName(String username, DocumentSnapshot document) async
  {
    await Musicians.doc(document.id).update({
      "username" : username
    });

    name = username;
  }

  // Edit Description
  Future<void> editDescription(String desc, DocumentSnapshot document) async
  {
    await Musicians.doc(document.id).update({
      "description" : desc
    });

    description = desc;
  }

  // Edit Instruments
  Future<void> editInstruments(List<String>? instruments, DocumentSnapshot document) async
  {
    await Musicians.doc(document.id).update({
      "instruments" : instruments,
    });
  }

  // Add Genres
  Future<void> editGenres(List<String>? genres, DocumentSnapshot document) async
  {
    await Musicians.doc(document.id).update({
      "genres" : genres,
    });
  }

}