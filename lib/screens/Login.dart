import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/screens/HomePage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/Globals.dart';
import 'ProfileCreation1.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

  final _auth = AuthService();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  login () async {
    final user = await _auth.signWithEmailAndPassword(loginEmailController.text, loginPasswordController.text);

    if(user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation1()));
      dispose();
      print("User Logged in Successfully");
    }
    else {
      print("Error with User Login");
    }
  }

  loginWithGoogle () async {
    final googleUser = _auth.signInWithGoogle();

    if(googleUser != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation1()));
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
      backgroundColor: const Color(0xff101010),
      appBar: AppBar(
        toolbarHeight: 120.0,
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
          padding: const EdgeInsets.only(left: 32, right: 32),
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

              const SizedBox(height: 90,),

              ElevatedButton( // Google Login Button
                onPressed: () async {
                  loginWithGoogle();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: const Size(366, 70),
                  backgroundColor: const Color(0xffEDFFF4),
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

              const SizedBox(height: 20,),

              const Align(
                alignment: Alignment.center,
                child: Text(
                  "or",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              InputField(InputController: loginEmailController, hint: "Email", height: 1,), // Email Text Field

              const SizedBox(height: 15,),

              InputField(InputController: loginPasswordController, hint: "Password", height: 1,), // Password Text Field

              const SizedBox(height: 15,),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){},
                  child: const Text(
                    "forgot password?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    )
                  ),
                ),
              ),

              const SizedBox(height: 15,),

              ElevatedButton( // Login Button
                  onPressed: () async{
                    await login();
                  },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xff90DAB9),
                  fixedSize: const Size(366, 61.6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                  child: const Text(
                      "Log In",
                    style: TextStyle(
                      fontSize: 18.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
              ),

              const SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}