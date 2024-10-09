import 'dart:async';
import 'package:musicapp/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Event {
  final String title;
  final String username;
  final List<String> genres;
  final String dateTime;
  final String location;
  final List<IconData> icons;

  Event({
    required this.title,
    required this.username,
    required this.genres,
    required this.dateTime,
    required this.location,
    required this.icons,
  });
}

class EventCard extends StatefulWidget {
  final File? image;
  final String title;
  final String username;
  final List<String> genres;
  final String dateTime;
  final String location;
  final Function() onPressed; // Card onPressed action
  final List<IconData> icons; // Make icons variable for different cards
  final Function() onLocationPressed; // Function for location button press

  EventCard({
    Key? key,
    this.image,
    required this.title,
    required this.username,
    required this.genres,
    required this.dateTime,
    required this.location,
    required this.onPressed,
    required this.icons, // Icons passed as parameter
    required this.onLocationPressed, // Location button press function
  }) : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  int _currentIndex = 0;
  Timer? _timer;
  final Palette palette = Palette();

  @override
  void initState() {
    super.initState();
    _startIconSwitch(); // Automatically start the icon switching when the component is initialized
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks when the widget is removed
    super.dispose();
  }

  void _startIconSwitch() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.icons.length; // Cycle through the passed icons list
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed, // Make the card clickable
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: palette.secondary_bg,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: widget.image != null ? FileImage(widget.image!) : null,
                  child: widget.image == null
                      ? ClipOval(
                    child: Image.asset(
                      'assets/images/image 9.png',
                      fit: BoxFit.cover,
                    ),
                  )
                      : null,
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        widget.username,
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(widget.genres.length * 2 - 1, (index) {
                if (index.isEven) {
                  return Text(
                    widget.genres[index ~/ 2],
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      '•',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              }),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.dateTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: widget.onLocationPressed, // Handle location button press
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(140, 10),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    side: BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    widget.location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: IconButton(
                    key: ValueKey<int>(_currentIndex),
                    icon: Icon(widget.icons[_currentIndex], size: 30, color: Colors.white),
                    onPressed: () {}, // Action on icon press
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
