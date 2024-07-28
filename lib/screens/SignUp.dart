import 'package:flutter/material.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/screens/HomePage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      dispose();
    }
    else {
      print("User not Created");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            SizedBox(height: 150,),

            Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 50,),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: "Email",
                  label: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  )
              ),
            ),

            SizedBox(height: 25,),

            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: "Password",
                  label: Icon(Icons.password_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  )
              ),
            ),

            SizedBox(height: 25,),

            ElevatedButton(
              onPressed: () async {
                await signUp();
            },
              child: Text(
                "Signup",
              ),
            ),

          ],
        ),
      ),
    );
  }
}
