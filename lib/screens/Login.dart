import 'package:flutter/material.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/screens/HomePage.dart';
import 'package:musicapp/screens/SignUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _auth = AuthService();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  login () async {
    final user = await _auth.signWithEmailAndPassword(loginEmailController.text, loginPasswordController.text);

    if(user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              SizedBox(height: 150,),

              Text(
                "Login",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 50,),

              TextField(
                controller: loginEmailController,
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
                controller: loginPasswordController,
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
                  onPressed: () async{
                    await login();
                  },
                  child: Text(
                      "Login",
                  ),
              ),

              SizedBox(height: 15,),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text(
                  "Signup",
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
