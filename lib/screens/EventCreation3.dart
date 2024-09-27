import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/repositories/MusiciansCollection.dart';
import '../components/Globals.dart';
import '../repositories/EventsCollection.dart';
import 'EventCreation4.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCreation3 extends StatefulWidget {
  const EventCreation3({super.key});

  @override
  State<EventCreation3> createState() => _EventCreation3State();
}

class _EventCreation3State extends State<EventCreation3>
    with TickerProviderStateMixin {
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

  List<int> instrument_count = [];

  //color palette declaration
  final Palette palette = Palette();
  late Color currentBackgroundColor;
  late Color currentTextColor;

  // List<bool> selectedInstruments = []; //track if pressed or not
  //
  // List<String>? storedInstruments =
  //     []; // Final Instrument list to be sent to Back End

  bool _isButton = true; //for the transition animation
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _widthAnimation; //potential width animation

  Map<String, int> InstMap = {}; //Map that has instrument name and count for backend

  //controller for the instrument text
  final TextEditingController instrumentcontroller = TextEditingController();

  //initialize
  @override
  void initState() {
    super.initState();
    instrument_count =
        List.generate(instrument_list.length, (index) => 0);
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
        instrument_count.add(1); // Add new selection state
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
                  "Pick instruments you need",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30.h),
                StaggeredGrid.count(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  children: [
                    for (int index = 0; index < instrument_list.length; index++)
                      GestureDetector(
                        onTap: () {
                          instrument_count[index]++;
                          setState(() {

                          });
                        },

                        onLongPress: () {
                          HapticFeedback.lightImpact();
                          instrument_count[index]=0;
                          setState(() {

                          });
                        },
                        child: StaggeredGridTile.count(
                            crossAxisCellCount:
                                1, // Span two columns for 'Digeridoo'
                            mainAxisCellCount: 0.6, // Height of the tile
                            child: InstrumentPicker(
                              counter: instrument_count[index],
                                palette: palette,
                                instrument: instrument_list[index])),
                      ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
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
                              icon: Icon(
                                Icons.add,
                                size: 50,
                                color: palette.primary_text,
                              ),
                              color: palette.accent,
                              alignment: Alignment.centerRight,
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(palette.accent),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ))),
                            ),
                          )),
                ),
                SizedBox(
                  height: 50.h,
                ),
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
                  for (int i = 0; i < instrument_list.length; i++) {
                    if (instrument_count[i] > 0) {
                      InstMap[instrument_list[i]]=instrument_count[i];
                    }
                  }

                  DocumentSnapshot snap = await Event().getDocument;
                  await Event().editInstrument(InstMap, snap);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventCreation4()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InstrumentPicker extends StatefulWidget {
  final String instrument;
  int counter;


  InstrumentPicker({
    super.key,
    required this.counter,
    required this.palette,
    required this.instrument,
  });

  final Palette palette;

  @override
  State<InstrumentPicker> createState() => _InstrumentPickerState();
}

class _InstrumentPickerState extends State<InstrumentPicker> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom:0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: (count!=0)?true:false,
              child: Text(
                widget.counter.toString(),
                  style: TextStyle(
                  fontSize: 48,
                  color: widget.palette.primary_text,
                )
              ),
              //     child: TextField(
              //       readOnly: ,
              //       onChanged: (value) {
              //         count=value as int;
              //         print(count);
              //       },
              //       style: TextStyle(
              //         fontSize: 32,
              //         color: Colors.white,
              //       ),
              //       textAlign: TextAlign.center,
              //       decoration: InputDecoration(
              //
              //         border: InputBorder.none,
              //         hintText: "$count",
              //         hintStyle: TextStyle(
              //           fontSize: 32,
              //           color: Colors.white,
              //         )
              //       ),
              //
              //   // style: TextStyle(
              //   //   fontSize: 48,
              //   //   color: widget.palette.primary_text,
              //   // ),
              // )
              ),
          Text(
            widget.instrument,
            style: TextStyle(
              fontSize: 20,
              color: widget.palette.primary_text,
            ),
          ),
        ]),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 2,
          )),
    );
  }
}
