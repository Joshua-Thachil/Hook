import 'package:flutter/material.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/screens/Login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _authUser = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HomePage",
              style: TextStyle(
                fontSize: 50
              ),
            ),

            SizedBox(height: 25,),

            ElevatedButton(
                onPressed: () async{
                  await _authUser.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  "Sign out",
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
            )

          ],
        ),
      ),
    );
  }
}
