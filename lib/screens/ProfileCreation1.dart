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
      backgroundColor: const Color(0xff101010),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.075, right: width * 0.075),
        child: ListView(
          children: [Center(
            child: Column(
              children: [
                SizedBox(height: 60,),
                SegmentedProgressBar(totalSteps: 5,currentStep:1,),
                SizedBox(height: 160,),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: const Color(0xffCFE9DA),
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
                        icon: const Icon(
                          Icons.edit,
                          size: 30,
                          color: Colors.black,
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
                                            icon: const Icon(
                                              Icons.camera_alt,
                                              size: 40,
                                              color: Color(0xffCFE9DA),
                                            ),
                                            onPressed: () =>
                                                _pickImage(ImageSource.camera),
                                          ),
                                          const Text(
                                            "Take a picture",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.photo_library,
                                                size: 40, color: Color(0xffCFE9DA)),
                                            onPressed: () =>
                                                _pickImage(ImageSource.gallery),
                                          ),
                                          const Text(
                                            "Pick from gallery",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
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
                const SizedBox(height: 30),
                InputField(InputController: usernamecontroller, hint: 'Enter your username', height: 1,),
                const SizedBox(height: 30),
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
