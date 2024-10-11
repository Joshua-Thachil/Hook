import 'package:flutter/material.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/Style/Palette.dart';
import 'HomePage.dart';

import '../components/Buttons.dart';

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {

  final Palette palette = Palette();

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 26, right: 26),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 50,),
              Align(
                child: Text("welcome to",
                  style: TextStyle(
                    fontSize: 48,
                    color: palette.primary_text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Align(
                child: Text("Hook",
                  style: TextStyle(
                    fontSize: 48,
                    color: palette.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Align(
                child: Text("Find all the music you'd ever need",
                  style: TextStyle(
                    fontSize: 24,
                    color: palette.primary_text,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 50,),
              GridView.count(
                crossAxisCount: 2,  // Number of columns
                crossAxisSpacing: 15,  // Spacing between columns
                mainAxisSpacing: 15,   // Spacing between rows
                shrinkWrap: true,  // Only take the space needed for the items
                children: [
                  SquareButton(
                    text: "Find Jams",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                  ),
                  SquareButton(
                    text: "Recording sesh with my friends and family and everyone",
                    onPressed: () {},
                    button_color: const Color(0xffFFFFFF),
                  ),
                  SquareButton(
                    text: "Find Jams",
                    onPressed: () {},
                    button_color: const Color(0xff82BA9F),
                  ),
                  SquareButton(
                    text: "Recording Sessions",
                    onPressed: () {},
                    button_color: const Color(0xffFF4768),
                  ),
                ],
              ),

              const SizedBox(height: 50,),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Or host your own activity and invite others to join",
                        style: TextStyle(
                          wordSpacing: 2,
                          fontSize: 24,
                          color: palette.primary_text,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xff3E6374),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
      backgroundColor: palette.bg,
    );
  }
}


