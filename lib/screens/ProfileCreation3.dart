import 'package:flutter/material.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/Style/Palette.dart';

class ProfileCreation3 extends StatefulWidget {
  const ProfileCreation3({super.key});

  @override
  State<ProfileCreation3> createState() => _ProfileCreation3State();
}

class _ProfileCreation3State extends State<ProfileCreation3> with TickerProviderStateMixin{
  final List<String> instrument_list = [
    'Guitar',
    'Keys',
    'Drums',
    'Vocals',
    'Bass',
    'Violin',
    'ClapBox',
    'Flute',
  ];

  //color palette declaration
  final Palette palette = Palette();
  late Color currentBackgroundColor;
  late Color currentTextColor;

  List<bool> selectedInstruments = []; //track if pressed or not

  bool _isButton = true; //for the transition animation
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  //controller for the instrument text
  final TextEditingController instrumentcontroller = TextEditingController();

  //initialize
  @override
  void initState() {
    super.initState();
    selectedInstruments =
        List.generate(instrument_list.length, (index) => false);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
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
              SegmentedProgressBar(totalSteps: 5, currentStep: 3),
              const SizedBox(height: 80),
              const Text(
                "Pick the instruments you play",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              StaggeredGrid.count(
                crossAxisCount: 3,  // Number of columns
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 20.0,
                children: [
                  for (int index = 0; index < instrument_list.length; index++)
                    StaggeredGridTile.count(
                      crossAxisCellCount: instrument_list[index].length > 6 ? 2 : 1,  // Span two columns for 'Digeridoo'
                      mainAxisCellCount: 0.6, // Height of the tile
                      child: GridButton(
                        backgroundColor: selectedInstruments[index]
                            ? palette.accent  // Selected state
                            : palette.secondary,  // Unselected state
                        text: instrument_list[index],
                        textColor: selectedInstruments[index]
                            ? palette.primary_text  // Selected state
                            : palette.secondary_text,  // Unselected state
                        onPressed: () {
                          setState(() {
                            // Toggle the selected state of the button
                            selectedInstruments[index] = !selectedInstruments[index];
                          });
                        },
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20,),
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
                    hint: "Add your instrument",
                    InputController: instrumentcontroller,
                    height: 1,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
