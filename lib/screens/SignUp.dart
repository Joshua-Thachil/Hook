import 'package:flutter/material.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/screens/HomePage.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      print("User Created Successfully");
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      dispose();
    }
    else {
      print("User not Created");
    }
  }

  loginWithGoogle () async {
    final googleUser = _authClass.signInWithGoogle();

    if(googleUser != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
              const Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                          text: "Join the\n",
                          style: TextStyle(
                            fontSize: 57,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.25,
                          ),
                        ),
                        TextSpan(
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
                            color: Colors.white,
                            height: 1.25,
                          ),
                        ),
                      ]
                  )
              ),

              const SizedBox(height: 90,),

              ElevatedButton(
                  onPressed: () async {
                    await loginWithGoogle();
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

              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "email",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.3,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Color(0xff1E1E1E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                ),
              ), // Email text field

              const SizedBox(height: 15,),

              TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.3,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Color(0xff1E1E1E),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                ),
              ), // Password text field
              const SizedBox(height: 15,),

              const SizedBox(height: 15,),

              ElevatedButton(
                onPressed: () async{
                  await signUp();
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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}