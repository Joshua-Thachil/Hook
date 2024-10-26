import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/repositories/EventsCollection.dart';
import 'EventCreation5.dart';
import 'package:intl/intl.dart';

class EventCreation4 extends StatefulWidget {
  const EventCreation4({super.key});

  @override
  State<EventCreation4> createState() => _EventCreation4State();
}

class _EventCreation4State extends State<EventCreation4> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;
  String date = "Set Date";
  String time = "Set Time";

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
                "Last few steps...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 0.5,
                    child: PrimaryButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2050));

                        if(pickedDate != null)
                        {
                          setState(() {
                            date = DateFormat('E, MMM d').format(pickedDate);
                          });
                        }
                      },
                      text: date,
                      text_color: Palette.hint_text,
                      button_color: Palette.secondary_bg,
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 0.5,
                    child: PrimaryButton(
                      onPressed: () async {
                        final pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());


                        if(pickedTime != null){

                          // Converting Time to DateTime for conversion
                          DateTime castedDate = DateTime(
                            0,
                            0,
                            0,
                            pickedTime.hour,
                            pickedTime.minute
                          );

                          setState(() {
                            time = DateFormat('h:mm a').format(castedDate);
                          });
                        }
                      },
                      text: time,
                      text_color: Palette.hint_text,
                      button_color: Palette.secondary_bg,
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 0.5,
                    child: PrimaryButton(
                      onPressed: (){},
                      text: 'set location',
                      text_color: Palette.hint_text,
                      button_color: Palette.secondary_bg,
                    ),
                  ),
                ],
              ),
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
                await Event().editDateTime(date, time, snap);
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventCreation5(),));
              },
            )
          ],
        ),
      ),
    );
  }
}
