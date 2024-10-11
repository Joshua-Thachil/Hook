import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/repositories/MusiciansCollection.dart';
import 'package:musicapp/repositories/models/UserModel.dart';
import 'package:musicapp/screens/HomePage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp/screens/ProfileCreation1.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/Style/Palette.dart';

import '../components/Globals.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _authClass = AuthService();

  @override
  void dispose() {
    // function to dispose the controllers when user moves to another page

    emailController.dispose();
    passwordController.dispose();
    print("Sign up controllers Disposed Successfully");
    super.dispose();
  }

  Future<void> signUp() async {
    final user = await _authClass.makeUserWithEmailAndPassword(emailController.text, passwordController.text);
    if(user != null) {
      final userData = UserModel(email: emailController.text);
      await Musician().createUser(userData);
      print("User Created Successfully");
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation1()));
      dispose();
    }
    else {
      print("User not Created");
    }
  }

  loginWithGoogle () async {
    final googleUser = await _authClass.signInWithGoogle();

    if(googleUser != null) {
      String? email = AuthService.userData?.email;
      final userData = UserModel(email: email);
      await Musician().createUser(userData);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation1()));
      dispose();
      print("User Logged in Successfully");
    }
    else {
      print("Error with User Login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      appBar: AppBar(
        toolbarHeight: height * 0.13,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.075, right: width * 0.075),
          child: ListView(
            children: [
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                          text: "Join the\n",
                          style: TextStyle(
                            fontSize: 57,
                            fontWeight: FontWeight.bold,
                            color: Palette.primary_text,
                            height: 1.25,
                          ),
                        ),
                        const TextSpan(
                          text: "Jam,\n",
                          style: TextStyle(
                            fontSize: 57,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff80AC97),
                            height: 1.25,
                          ),
                        ),
                        TextSpan(
                          text: "Sign Up.",
                          style: TextStyle(
                            fontSize: 57,
                            fontWeight: FontWeight.bold,
                            color: Palette.primary_text,
                            height: 1.25,
                          ),
                        ),
                      ]
                  )
              ),

              SizedBox(height: height * 0.095,),

              ElevatedButton(
                  onPressed: () async {
                    await loginWithGoogle();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: const Size(366, 70),
                    backgroundColor: Palette.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icons8-google.svg',
                        width: 24,
                        height: 24,
                      ),
                      const Text.rich(
                          TextSpan(
                              children: [
                                TextSpan(
                                  text: "Continue With ",
                                  style: TextStyle(
                                    fontSize: 18.3,
                                    color: Color(0xff0F1512),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "Google",
                                  style: TextStyle(
                                    fontSize: 18.3,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]
                          )
                      ),
                    ],
                  )
              ),

              SizedBox(height: height * 0.023,),

              Align(
                alignment: Alignment.center,
                child: Text(
                  "or",
                  style: TextStyle(
                    color: Palette.primary_text,
                    fontSize: 22,
                  ),
                ),
              ),

              SizedBox(height: height * 0.023,),
              InputField(InputController: emailController, hint: "Email", height: 1,), // Email text field
              SizedBox(height: height * 0.015,),
              InputField(InputController: passwordController, hint: "Password", height: 1, obscureText: true,),// Password text field
              SizedBox(height: height * 0.015,),

              SizedBox(height: height * 0.015,),

              PrimaryButton(
                onPressed: () async{
                  await signUp();
                },
                text: "Sign Up",
              )
            ],
          ),
        ),
      ),
    );
  }
}