import 'package:firebase_auth/firebase_auth.dart';


// class containing all authentication related functions(login, sign up, sign out etc.)
class AuthService{

  final _authInstance = FirebaseAuth.instance; // storing the firebase auth instance in _auth

  Future<User?> makeUserWithEmailAndPassword(String email, String password) async {

    try{
      final credentials = await _authInstance.createUserWithEmailAndPassword(email: email, password: password);
      return credentials.user;
    }catch(e) {
      print("Error with creating user " + e.toString());
    }

    return null;
  }

  Future<User?> signWithEmailAndPassword(String email, String password) async {

    try{
      final credentials = await _authInstance.signInWithEmailAndPassword(email: email, password: password);
      return credentials.user;
    }catch(e) {
      print("Error with creating user");
    }

    return null;
  }

  Future<void> signOut() async {
    try{
      await _authInstance.signOut();
      print("User signed out successfully");
    } catch (e) {
      print("Error with Sign Out");
    }
  }
}