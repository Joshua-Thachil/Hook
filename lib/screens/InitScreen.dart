import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  List<Widget> carouselItems = [
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/band-performing-live-music.png')
        )
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: ListView(
            children: [
              
              CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    height: 500,
                    viewportFraction: 1
                  )
              ),
              
              ElevatedButton(
                onPressed: () {

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

              SizedBox(height: 35,),

              ElevatedButton(
                onPressed: () {

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
