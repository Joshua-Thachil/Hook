import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/components/InputFields.dart';

class ListItem {
  final String text;
  bool isSelected;

  ListItem(this.text, {this.isSelected = false});
}

class EventCreation2 extends StatefulWidget {
  const EventCreation2({super.key});

  @override
  State<EventCreation2> createState() => _EventCreation2State();
}

class _EventCreation2State extends State<EventCreation2> with TickerProviderStateMixin{
  List<ListItem> genreList = [];
  final Palette palette = Palette();
  late Color currentBackgroundColor;
  late Color currentTextColor;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _isButton = true;
  final TextEditingController genrecontroller = TextEditingController();
  List<String>? storedGenres = [];

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

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
              SegmentedProgressBar(totalSteps: 5, currentStep: 4),
              const SizedBox(height: 80),
              const Text(
                "Pick your vibe",
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
                        ? palette.accent  // Selected state
                        : palette.secondary,
                    textColor: item.isSelected
                        ? palette.primary_text  // Selected state
                        : palette.secondary_text,
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
                        color: palette.primary_text,
                        size: 50,
                      ),
                      backgroundColor: palette.accent,
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
                        icon: Icon(Icons.add, size: 50, color: palette.primary_text,),
                        color: palette.accent,
                        alignment: Alignment.centerRight,
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(palette.accent),
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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
