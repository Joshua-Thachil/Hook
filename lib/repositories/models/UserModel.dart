

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel
{
  String? username;
  final String? email;
  String? description;
  List<String>? instruments;
  List<String>? genres;

  UserModel({
    this.username,
    required this.email,
    this.description,
    this.instruments,
    this.genres,
  });

  toJson() {
    return {
      "username" : username,
      "email" : email,
      "description" : description,
      "instruments" : instruments,
      "genres" : genres,
    };
  }

  // Mapping User data from firebase to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document)
  {
    final data = document.data()!;

    return UserModel(
      username: data["username"],
      email: data["email"],
      description: data["description"],
      instruments: data["instruments"],
      genres: data['genres']
    );
  }

}