import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/repositories/MusiciansCollection.dart';
import 'ProfileCreation3.dart';

import '../components/Globals.dart';

class ProfileCreation2 extends StatefulWidget {
  const ProfileCreation2({super.key});

  @override
  State<ProfileCreation2> createState() => _ProfileCreation2State();
}

class _ProfileCreation2State extends State<ProfileCreation2> {

  final TextEditingController descriptioncontroller = TextEditingController();
  double height = Globals.screenHeight;
  double width = Globals.screenWidth;
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
        padding: EdgeInsets.only(left: width * 0.075, right: width * 0.075),
        child: Center(
          child: ListView(
            children: [
            Column(
              children: [
                SegmentedProgressBar(totalSteps: 5, currentStep: 2),
                const SizedBox(height: 80),
                const Text(
                  "Tell us about yourself",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                InputField(InputController: descriptioncontroller, hint: 'Enter description', height: 5,),
              ],
            ),
            ]
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
              onPressed: () async {
                DocumentSnapshot snap = await Musician().getDocument;
                await Musician().editDescription(descriptioncontroller.text, snap);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation3()));
              },
            )
          ],
        ),
      ),
    );
  }
}
