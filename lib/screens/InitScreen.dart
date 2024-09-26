import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/screens/Login.dart';
import 'package:musicapp/screens/SignUp.dart';
import 'package:musicapp/Style/Palette.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;
  final Palette palette = Palette();

  List<Widget> carouselItems = [
    Container(
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
      backgroundColor: palette.bg,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.075, right: width * 0.075),
          child: ListView(
            children: [
              SizedBox(height: height * 0.055),
              CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    height: height * 0.55,
                    viewportFraction: 1,
                    autoPlay: true,
                  ),
              ),

              SizedBox(height: height * 0.11,),
              PrimaryButton(text: "Login", onPressed: LoginButtonPress), // Log in Button
              SizedBox(height: height * 0.02,),
              // Register Button
              PrimaryButton(
                text: "Register",
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                button_color: palette.secondary_bg,
                text_color: palette.primary_text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}