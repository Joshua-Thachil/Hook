import 'package:flutter/material.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/Style/Palette.dart';
import 'HomePage.dart';

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {

  final Palette palette = Palette();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 26, right: 26),
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

class SquareButton extends StatelessWidget {

  final String text;
  Color? text_color = Colors.black;
  Color? button_color;
  final VoidCallback onPressed;

  SquareButton({
    super.key,
    required this.text,
    this.text_color,
    this.button_color = const Color(0xffAD80FF),
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                child: Text(text,
                  style: TextStyle(
                    wordSpacing: 2,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 36,),
              Align(
                  child: Icon(Icons.arrow_forward,
                  size: 36,),
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ),
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          color: button_color,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
