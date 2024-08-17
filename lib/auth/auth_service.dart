import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


// class containing all authentication related functions(login, sign up, sign out etc.)
class AuthService{

  final _authInstance = FirebaseAuth.instance; // storing the firebase auth instance in _auth

  // Google Sign in
  signInWithGoogle() async {

    // begin sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // sign in
    return await _authInstance.signInWithCredential(credential);

  }

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
      print("Error with Logging user in");
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