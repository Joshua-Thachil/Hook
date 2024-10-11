import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/repositories/MusiciansCollection.dart';
import '../components/Globals.dart';
import 'ProflieCreation5.dart';

class ListItem {
  final String text;
  bool isSelected;

  ListItem(this.text, {this.isSelected = false});
}

class ProfileCreation4 extends StatefulWidget {
  const ProfileCreation4({super.key});

  @override
  State<ProfileCreation4> createState() => _ProfileCreation4State();
}

class _ProfileCreation4State extends State<ProfileCreation4> with TickerProviderStateMixin{

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

  List<ListItem> genreList = [];
  late Color currentBackgroundColor;
  late Color currentTextColor;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _isButton = true;
  final TextEditingController genrecontroller = TextEditingController();
  List<String>? storedGenres = [];

  //initialize
  void initState() {
    super.initState();
    // Initialize the items with only the text value
    genreList = [
      ListItem('Pop'),
      ListItem('HipHop'),
      ListItem('Indie'),
      ListItem('Classical'),
      ListItem('Funk'),
      ListItem('Acapella'),
      ListItem('Metal'),
      ListItem('Rock'),
      ListItem('Indian Classical'),
      ListItem('Choral'),
      ListItem('Jazz'),
      ListItem('Progressive'),
      // Add more items as needed
    ];

    // Initialize all isSelected to false
    setState(() {
      for (var item in genreList) {
        item.isSelected = false;
      }
    });
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  //dispose
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //addgenre
  void _addGenre() {
    final newGenre = genrecontroller.text.trim();
    if (newGenre.isNotEmpty && !genreList.any((item) => item.text == newGenre)) {
      setState(() {
        genreList.add(ListItem(newGenre, isSelected: true)); // Add new item with text and default isSelected as false
        genrecontroller.clear(); // Clear the text field
      });
    }
  }

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
          child: ListView(
            children: [
              SegmentedProgressBar(totalSteps: 5, currentStep: 4),
              const SizedBox(height: 80),
              const Text(
                "Choose your favorite genres",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // Horizontal space between buttons
                runSpacing: 8.0, // Vertical space between rows
                children: genreList.map((item){
                  return GridButton(
                    onPressed: (){
                      setState(() {
                        // Toggle the selected state of the button
                        item.isSelected = !item.isSelected;
                      });
                    },
                    backgroundColor: item.isSelected
                        ? Palette.accent  // Selected state
                        : Palette.secondary,
                    textColor: item.isSelected
                        ? Palette.primary_text  // Selected state
                        : Palette.secondary_text,
                    text: item.text,
                  );
                }).toList(),
              ),
              SizedBox(height: 50,),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _isButton
                    ? Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 60,
                    width: 90,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          _isButton = false;
                          _animationController.forward();
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Palette.primary_text,
                        size: 50,
                      ),
                      backgroundColor: Palette.accent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                )
                    : SlideTransition(
                    position: _slideAnimation,
                    child: InputField(
                      hint: "Add your genre",
                      InputController: genrecontroller,
                      height: 1,
                      suffix: IconButton(
                        onPressed: _addGenre,
                        icon: Icon(Icons.add, size: 50, color: Palette.primary_text,),
                        color: Palette.accent,
                        alignment: Alignment.centerRight,
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Palette.accent),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                            )
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(height: 50,),
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
              onPressed: () async {

                for(int i = 0; i < genreList.length; i++){
                  if(genreList[i].isSelected){
                    storedGenres?.add(genreList[i].text);
                  }
                }

                DocumentSnapshot snap = await Musician().getDocument;
                Musician().editGenres(storedGenres, snap);

                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation5()));
              },
            )
          ],
        ),
      ),
    );
  }
}
