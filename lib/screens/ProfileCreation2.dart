import 'package:flutter/material.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/components/Buttons.dart';

class ProfileCreation2 extends StatefulWidget {
  const ProfileCreation2({super.key});

  @override
  State<ProfileCreation2> createState() => _ProfileCreation2State();
}

class _ProfileCreation2State extends State<ProfileCreation2> {
  final TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      appBar: AppBar(
        backgroundColor: WidgetStateColor.transparent,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 35,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Center(
          child: Column(
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
              InputField(InputController: descriptioncontroller, hint: 'Enter description'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(bottom: 20, right: 30),
        color: WidgetStateColor.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            NextButton(
              text: "Next",
              icon: Icons.arrow_forward,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation2()));
              },
            )
          ],
        ),
      ),
    );
  }
}
