import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/components/Cards.dart';
import 'package:musicapp/main.dart';
import 'package:musicapp/screens/Login.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/Style/Palette.dart';
import 'EventCreation1.dart';

//event class
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = Globals.screenHeight;
  double width = Globals.screenWidth;
  final Palette palette = Palette();
  final _authUser = AuthService();
  File? _image; // profile picture

  // Sample static events
  final List<Event> _events = [
    Event(
      title: 'Jam Session with friends',
      username: 'kunjumaya',
      genres: ['Carnatic', 'Rock', 'Pop'],
      dateTime: '5th Sep, 6 pm',
      location: 'Jayanagar',
      icons: [Icons.favorite, Icons.star, Icons.thumb_up, Icons.cake],
    ),
    Event(
      title: 'Open Mic Night',
      username: 'musician_01',
      genres: ['Jazz', 'Blues'],
      dateTime: '10th Sep, 7 pm',
      location: 'MG Road',
      icons: [Icons.music_note, Icons.star_border, Icons.thumb_up],
    ),
    Event(
      title: 'Rock Concert',
      username: 'rockstar',
      genres: ['Rock', 'Metal'],
      dateTime: '15th Sep, 8 pm',
      location: 'Indiranagar',
      icons: [Icons.favorite, Icons.event],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: palette.bg,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  "Hook",
                  style: TextStyle(
                    fontSize: 45,
                    color: palette.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Beware of spiders and zombies",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 45),

                // Tab bar
                Container(
                  decoration: BoxDecoration(
                    color: palette.secondary_bg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    dividerColor: Colors.transparent,
                    labelColor: palette.primary,
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    tabs: [
                      Tab(text: 'For you'),
                      Tab(text: 'All'),
                      Tab(text: 'Jams'),
                      Tab(text: 'Recordings'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // First page - for you page
                      Center(
                        child: ListView.builder(
                          itemCount: _events.length,
                          itemBuilder: (context, index) {
                            final event = _events[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: EventCard(
                                onPressed: () {}, // Action when the card is tapped
                                title: event.title,
                                username: event.username,
                                genres: event.genres,
                                dateTime: event.dateTime,
                                location: event.location,
                                icons: event.icons,
                                onLocationPressed: () {
                                },
                              ),
                            );
                          },
                        ),
                      ),

                      // Second page
                      Center(
                        child: ListView(
                          children: [
                            Text(
                              "Some other stuff will come here",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Third page
                      Center(child: Text('Audiobooks List')),
                      // Fourth page
                      Center(child: Text('Audiobooks List')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(palette.primary),
                      ),
                      onPressed: () async {
                        await _authUser.signOut();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Sign out",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(palette.primary),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EventCreation1()));
                      },
                      child: Text(
                        'Add Event',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
