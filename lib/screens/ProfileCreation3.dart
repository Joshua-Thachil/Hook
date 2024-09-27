import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/repositories/MusiciansCollection.dart';
import '../components/Globals.dart';
import 'ProfileCreation4.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCreation3 extends StatefulWidget {
  const ProfileCreation3({super.key});

  @override
  State<ProfileCreation3> createState() => _ProfileCreation3State();
}

class _ProfileCreation3State extends State<ProfileCreation3> with TickerProviderStateMixin{

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

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

  List<String>? storedInstruments = []; // Final Instrument list to be sent to Back End

  bool _isButton = true; //for the transition animation
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _widthAnimation; //potential width animation

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

  //method to add a new instrument
  void _addInstrument() {
    final newInstrument = instrumentcontroller.text.trim();
    if (newInstrument.isNotEmpty && !instrument_list.contains(newInstrument)) {
      setState(() {
        instrument_list.add(newInstrument);
        selectedInstruments.add(true); // Add new selection state
        instrumentcontroller.clear(); // Clear the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Center(
            child: ListView(
              children: [
                SegmentedProgressBar(totalSteps: 5, currentStep: 3),
                SizedBox(height: 80.h),
                Text(
                  "Pick the instruments you play",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30.h),
                StaggeredGrid.count(
                  crossAxisCount: 3,  // Number of columns
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
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
                SizedBox(height: 50.h,),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isButton
                      ? Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 60.h,
                      width: 90.h,
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
                          borderRadius: BorderRadius.circular(20.r),
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
                      suffix: IconButton(
                        onPressed: _addInstrument,
                        icon: Icon(Icons.add, size: 50, color: palette.primary_text,),
                        color: palette.accent,
                        alignment: Alignment.centerRight,
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(palette.accent),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            )
                          )
                        ),
                      ),
                    )
                  ),
                ),
                SizedBox(height: 50.h,),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.only(bottom: 20.h, right: 30.w),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NextButton(
                text: "Next",
                icon: Icons.arrow_forward,
                onPressed: () async {

                  for(int i = 0; i < selectedInstruments.length; i++){
                    if(selectedInstruments[i] == true){
                      storedInstruments?.add(instrument_list[i]);
                    }
                  }

                  DocumentSnapshot snap = await Musician().getDocument;
                  await Musician().editInstruments(storedInstruments, snap);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCreation4()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
