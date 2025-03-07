import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/repositories/EventsCollection.dart';
import 'EventCreation2.dart';

class EventCreation1 extends StatefulWidget {
  const EventCreation1({super.key});

  @override
  State<EventCreation1> createState() => _EventCreation1State();
}

class _EventCreation1State extends State<EventCreation1> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 35,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.075, right: width * 0.075),
        child: Center(
          child: Column(
            children: [
              SegmentedProgressBar(totalSteps: 5, currentStep: 1),
              const SizedBox(height: 80),
              const Text(
                "Pick one of these",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () async{
                  await Event().createEvent("Find band members");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EventCreation2(),));
                },
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Card(
                  color: Palette.secondary_bg,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/rock-band-concept-illustration.png'),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Find band members",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Card(
                  color: Palette.secondary_bg,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/allen illus1.png'),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Jam Sessions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Card(
                  color: Palette.secondary_bg,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/podcast-concept-illustration.png'),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Recording Music",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Card(
                  color: Palette.secondary_bg,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/band-performing-live-music.png'),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Shows and Gigs",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
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
