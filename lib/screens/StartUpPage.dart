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
        padding: EdgeInsets.only(left: 26, right: 26),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 90,),
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
                    color: palette.primary_text,
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
              SizedBox(height: 44,),
              Row(
                children: [
                  SquareButton(
                    text: "Find Jams",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    },
                  ),
                  SizedBox(width: 20,),
                  SquareButton(
                    text: "Recording Sessions",
                    onPressed: () {},
                    button_color: Color(0xffFFFFFF),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SquareButton(
                    text: "Find Jams",
                    onPressed: () {},
                    button_color: Color(0xff82BA9F),
                  ),
                  SizedBox(width: 20,),
                  SquareButton(
                    text: "Recording Sessions",
                    onPressed: () {},
                    button_color: Color(0xffFF4768),
                  ),
                ],
              ),
              SizedBox(height: 50,),
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
                height: 124,
                width: 380,
                decoration: BoxDecoration(
                    color: Color(0xff3E6374),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: palette.bg,
    );
  }
}


