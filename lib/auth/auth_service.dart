import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final _auth = FirebaseAuth.instance; // storing the firebase auth instance in _auth

  Future<User?> makeUserWithEmailAndPassword(String email, String password) async {

    try{
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credentials.user;
    }catch(e) {
      print("Error with creating user " + e.toString());
    }

    return null;
  }

  Future<User?> signWithEmailAndPassword(String email, String password) async {

    try{
      final credentials = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credentials.user;
    }catch(e) {
      print("Error with creating user");
    }

    return null;
  }

  Future<void> signOut() async {
    try{
      await _auth.signOut();
    } catch (e) {
      print("Error with Sign Out");
    }
  }
}