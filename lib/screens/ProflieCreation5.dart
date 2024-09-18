import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/screens/HomePage.dart';


class ProfileCreation5 extends StatefulWidget {
  const ProfileCreation5({super.key});

  @override
  State<ProfileCreation5> createState() => _ProfileCreation5State();
}

class _ProfileCreation5State extends State<ProfileCreation5> {

  final Palette palette = Palette();
  final TextEditingController songsearchcontroller = TextEditingController();

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
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Center(
          child: ListView(
            children: [
              SegmentedProgressBar(currentStep: 5,totalSteps: 5,),
              SizedBox(height: 10,),
              const Text(
                "Make your Music bio",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              InputField(InputController: songsearchcontroller,height: 1,hint: "Search your favourite songs",),
              SizedBox(height: 50,),
              Container(
                  height: 300,
                  child: Image(image: AssetImage('assets/images/allen illus1.png')),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Create a small playlist to showcase your music taste",
                  style: TextStyle(color: palette.primary_text, fontSize: 16 ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: () {}, child: Text("Skip for now?",
            style: TextStyle(
              color: palette.primary_text, fontSize: 16
            ),)),
            NextButton(
              text: "Done",
              icon: Icons.arrow_forward,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
