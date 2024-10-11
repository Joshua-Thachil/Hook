import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musicapp/repositories/MusiciansCollection.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import '../components/Globals.dart';
import 'ProfileCreation2.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/Style/Palette.dart';


class ProfileCreation1 extends StatefulWidget {
  const ProfileCreation1({super.key});

  @override
  State<ProfileCreation1> createState() => _ProfileCreation1State();
}

class _ProfileCreation1State extends State<ProfileCreation1> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController usernamecontroller = TextEditingController();


  // Function to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.075, right: width * 0.075),
        child: ListView(
          children: [Center(
            child: Column(
              children: [
                SizedBox(height: height * 0.065,),
                SegmentedProgressBar(totalSteps: 5,currentStep:1,),
                SizedBox(height: height * 0.165,),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? ClipOval(child: Image.asset('assets/images/image 9.png', fit: BoxFit.cover, ))
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.edit,
                          size: 30,
                          color: Palette.secondary_text,
                        ),
                        label: const Text(""),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    color: Color(0xff1E1E1E),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  height: 110,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.camera_alt,
                                              size: 40,
                                              color: Palette.secondary,
                                            ),
                                            onPressed: () =>
                                                _pickImage(ImageSource.camera),
                                          ),
                                          Text(
                                            "Take a picture",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Palette.primary_text,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.photo_library,
                                                size: 40, color: Palette.secondary),
                                            onPressed: () =>
                                                _pickImage(ImageSource.gallery),
                                          ),
                                          Text(
                                            "Pick from gallery",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Palette.primary_text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        style: ButtonStyle(
                          elevation: WidgetStateProperty.all(0),
                          backgroundColor: WidgetStateProperty.all(Colors.transparent),
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.033),
                InputField(InputController: usernamecontroller, hint: 'Enter your username', height: 1,),
                SizedBox(height: height * 0.033),
              ],
            ),
          )],
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
                await Musician().editName(usernamecontroller.text, snap);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation2()));
              },
            )
          ],
        ),
      ),
    );
  }
}
