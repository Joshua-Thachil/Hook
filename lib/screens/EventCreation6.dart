import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/screens/HomePage.dart';

class EventCreation6 extends StatefulWidget {
  const EventCreation6({super.key});

  @override
  State<EventCreation6> createState() => _EventCreation6State();
}

class _EventCreation6State extends State<EventCreation6> {
  
  final TextEditingController titlecontroller = TextEditingController(); //stores the added title

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
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Center(
          child: ListView(
            children: [
              SegmentedProgressBar(totalSteps: 5, currentStep: 5),
              const SizedBox(height: 80),
              const Text(
                "Finally add a title",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              InputField(
                InputController: titlecontroller,
                hint: 'Enter title',
                height: 1,
              )
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
              text: "Done",
              icon: Icons.arrow_forward,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              },
            )
          ],
        ),
      ),
    );
  }
}
