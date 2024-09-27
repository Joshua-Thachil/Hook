import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/components/Buttons.dart';
import 'EventCreation5.dart';

class EventCreation4 extends StatefulWidget {
  const EventCreation4({super.key});

  @override
  State<EventCreation4> createState() => _EventCreation4State();
}

class _EventCreation4State extends State<EventCreation4> {
  final Palette palette = Palette();

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

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
                      onPressed: (){},
                      text: 'set date',
                      text_color: palette.hint_text,
                      button_color: palette.secondary_bg,
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 0.5,
                    child: PrimaryButton(
                      onPressed: (){},
                      text: 'set time',
                      text_color: palette.hint_text,
                      button_color: palette.secondary_bg,
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 0.5,
                    child: PrimaryButton(
                      onPressed: (){},
                      text: 'set location',
                      text_color: palette.hint_text,
                      button_color: palette.secondary_bg,
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
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventCreation5(),));
              },
            )
          ],
        ),
      ),
    );
  }
}
