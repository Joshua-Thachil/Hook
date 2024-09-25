import 'package:flutter/material.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/Style/Palette.dart';

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
              SizedBox(height: 50,),
              Align(
                child: Text("welcome to",
                  style: TextStyle(
                    fontSize: 48,
                    color: palette.primary_text,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Align(
                child: Text("Hook",
                  style: TextStyle(
                    fontSize: 48,
                    color: palette.primary_text,
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
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Align(
                            child: Text("Find jam sessions",
                              style: TextStyle(
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
                      color: Color(0xffAD80FF),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Align(
                            child: Text("Recording Sessions",
                              style: TextStyle(
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
                        color: palette.primary_text,
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Align(
                            child: Text("Book Jamrooms",
                              style: TextStyle(
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
                        color: Color(0xff82BA9F),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Align(
                            child: Text("Get Lessons",
                              style: TextStyle(
                                wordSpacing: 12,
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
                        color: Color(0xffFF4768),
                        borderRadius: BorderRadius.circular(20)
                    ),
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
