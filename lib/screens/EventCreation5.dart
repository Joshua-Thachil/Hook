import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/repositories/EventsCollection.dart';

import 'EventCreation6.dart';

class EventCreation5 extends StatefulWidget {
  const EventCreation5({super.key});

  @override
  State<EventCreation5> createState() => _EventCreation5State();
}

class _EventCreation5State extends State<EventCreation5> {

  final TextEditingController descController = TextEditingController(); //stores the added title

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
                "Add a description",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              InputField(
                InputController: descController,
                hint: 'Enter description',
                height: 5,
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
              text: "Next",
              icon: Icons.arrow_forward,
              onPressed: () async{
                DocumentSnapshot snap = await Event().getDocument;
                Event().editDesc(descController.text, snap);
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventCreation6(),));
              },
            )
          ],
        ),
      ),
    );
  }
}
