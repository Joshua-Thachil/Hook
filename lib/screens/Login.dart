import 'package:flutter/material.dart';
import 'package:musicapp/screens/SignUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // function to dispose the controllers when user moves to another page
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
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
                  onPressed: () {},
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
