import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/screens/Login.dart';
import 'package:musicapp/screens/SignUp.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

  List<Widget> carouselItems = [
    Container(
      height: 500,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/allen illus1.png'),
        ),
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Find musicians near you and collaborate with ease',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      )
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/podcast-concept-illustration.png'),
        )
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Book jam rooms with a click',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/rock-band-concept-illustration.png'),
            )
        ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Connect and build your network',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/woman-headphones-singing-recording-studio.png'),
            )
        ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Showcase your skill to the world',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ];

  void LoginButtonPress()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: ListView(
            children: [
              SizedBox(height: 50),
              CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    height: 500,
                    viewportFraction: 1,
                    autoPlay: true,
                  ),
              ),

              SizedBox(height: 100,),
              
              PrimaryButton(text: "Login", onPressed: LoginButtonPress), // Log in Button

              SizedBox(height: 25,),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xff1E1E1E),
                  fixedSize: const Size(366, 61.6),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18.3,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffF4FDF6),
                  ),
                ),
              ), // Register Button
            ],
          ),
        ),
      ),
    );
  }
}