import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/screens/EventCreation4.dart';

class EventCreation3 extends StatefulWidget {
  const EventCreation3({super.key});

  @override
  State<EventCreation3> createState() => _EventCreation3State();
}

class _EventCreation3State extends State<EventCreation3> {

  final Palette palette = Palette();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 35,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Center(
          child: ListView(
            children: [
              SegmentedProgressBar(totalSteps: 5, currentStep: 3),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(bottom: 20, right: 30),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            NextButton(
              text: "Next",
              icon: Icons.arrow_forward,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventCreation4(),));
              },
            )
          ],
        ),
      ),
    );
  }
}
