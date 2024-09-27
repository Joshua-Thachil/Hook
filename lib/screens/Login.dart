import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/screens/HomePage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp/screens/StartUpPage.dart';
import '../repositories/models/UserModel.dart';
import '../components/Globals.dart';
import 'ProfileCreation1.dart';
import 'package:musicapp/Style/Palette.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;
  final Palette palette = Palette();

  final _auth = AuthService();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  login () async {
    final user = await _auth.signWithEmailAndPassword(loginEmailController.text, loginPasswordController.text);

    if(user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const StartUpPage()));
      dispose();
      print("User Logged in Successfully");
    }
    else {
      print("Error with User Login");
    }
  }

  loginWithGoogle () async {
    final googleUser = await _auth.signInWithGoogle();

    if(googleUser != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const StartUpPage()));
      dispose();
      print("User Logged in Successfully");
    }
    else {
      print("Error with User Login");
    }
  }

  @override
  void dispose() {
    // function to dispose the controllers when user moves to another page
    loginEmailController.dispose();
    loginPasswordController.dispose();
    print("Login Controllers Disposed Successfully");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.bg,
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
              // SizedBox(height: 157,),

              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome\n",
                      style: TextStyle(
                        fontSize: 57,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.25,
                      ),
                    ),
                    TextSpan(
                      text: "Back,\n",
                      style: TextStyle(
                        fontSize: 57,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff80AC97),
                        height: 1.25,
                      ),
                    ),
                    TextSpan(
                      text: "Log In.",
                      style: TextStyle(
                        fontSize: 57,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.25,
                      ),
                    ),
                  ]
                )
              ),

              SizedBox(height: height * 0.095,),

              ElevatedButton( // Google Login Button
                onPressed: () async {
                  loginWithGoogle();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: const Size(366, 70),
                  backgroundColor: palette.secondary,
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
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Continue With ",
                            style: TextStyle(
                              fontSize: 18.3,
                              color: palette.secondary_text,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Google",
                            style: TextStyle(
                              fontSize: 18.3,
                              color: palette.secondary_text,
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
                    color: palette.primary_text,
                    fontSize: 22,
                  ),
                ),
              ),

              SizedBox(height: height * 0.023,),
              InputField(InputController: loginEmailController, hint: "Email", height: 1,), // Email Text Field
              SizedBox(height: height * 0.015,),
              InputField(InputController: loginPasswordController, hint: "Password", height: 1, obscureText: true,), // Password Text Field
              SizedBox(height: height * 0.015,),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){},
                  child: Text(
                    "forgot password?",
                    style: TextStyle(
                      fontSize: 16,
                      color: palette.primary_text,
                      fontWeight: FontWeight.w300,
                    )
                  ),
                ),
              ),

              SizedBox(height: height * 0.015,),
              PrimaryButton(
                onPressed: () async{
                  await login();
                },
                text: "Log In",
              ),
              SizedBox(height: height * 0.015,),
            ],
          ),
        ),
      ),
    );
  }
}