import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musicapp/auth/auth_service.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/Cards.dart';
import 'package:musicapp/main.dart';
import 'package:musicapp/screens/Login.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/screens/NotificationPage.dart';
import 'package:musicapp/screens/ProfilePage.dart';
import 'EventCreation1.dart';

//event class
class Event {
  final String title;
  final String description;
  final String username;
  final List<String> genres;
  final String dateTime;
  final String location;
  final List<IconData> icons;

  Event({
    required this.title,
    required this.description,
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
  final _authUser = AuthService();
  File? _image; // profile picture

  // Sample static events
  final List<Event> _events = [
    Event(
      title: 'Jam Session with friends',
      description: 'Hey music lovers! m hosting a laid-back jam session at my place (123 Harmony Lane). Bring your instruments, your voice, or just your vibe—everyonere a seasoned player or just want to hang out and enjoy some live tunes, come join the fun. Let' ,
      username: 'kunjumaya',
      genres: ['Carnatic', 'Rock', 'Pop'],
      dateTime: '5th Sep, 6 pm',
      location: '1.5 kms',
      icons: [Icons.favorite, Icons.star, Icons.thumb_up, Icons.cake],
    ),
    Event(
      title: 'Open Mic Night',
      description: 'Hey music lovers! m hosting a laibbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbd-back jam session at my place (123 Harmony Lane). Bring your instruments, your voice, or just your vibe—everyonere a seasoned player or just want to hang out and enjoy some live tunes, come join the fun. Let' ,
      username: 'musician_01',
      genres: ['Jazz', 'Blues'],
      dateTime: '10th Sep, 7 pm',
      location: 'MG Road',
      icons: [Icons.music_note, Icons.star_border, Icons.thumb_up],
    ),
    Event(
      title: 'Rock Concert',
      description: 'Hey just your vibe—everyonere tunes, come join the fun. Let' ,
      username: 'rockstar',
      genres: ['Rock', 'Metal'],
      dateTime: '15th Sep, 12.30 pm',
      location: '5 kms',
      icons: [Icons.favorite],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Palette.bg,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hook",
                      style: TextStyle(
                        fontSize: 45,
                        color: Palette.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage(),));
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
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
                    color: Palette.secondary_bg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    dividerColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                      color: Palette.primary,  // Background color of the pill
                      borderRadius: BorderRadius.circular(25.0), // Rounded corners for pill effect
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
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
                      Stack(
                        children: [
                          Center(
                            //list of cards
                            child: ListView.builder(
                              itemCount: _events.length,
                              itemBuilder: (context, index) {
                                final event = _events[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: EventCard(
                                    onPressed: () {
                                      // Show the dialog when the FAB is pressed
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          //pop-up
                                          return AlertDialog(
                                            backgroundColor: Palette.secondary_bg,
                                            title: Text(
                                              event.title ?? "Join Jam",
                                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                                            ),
                                            content: SingleChildScrollView(
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxHeight: MediaQuery.of(context).size.height * 0.5, // Limits the height to 50% of the screen
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min, // Ensures it takes only necessary space
                                                  children: [
                                                    SizedBox(height: 15),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          event.dateTime,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                                            decoration: BoxDecoration(
                                                              color: WidgetStateColor.transparent,
                                                              borderRadius: BorderRadius.circular(20),
                                                              border: Border.all(
                                                                color: Colors.white,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Icon(
                                                                  Icons.location_pin,
                                                                  size: 20,
                                                                  color: Colors.white,
                                                                ),
                                                                SizedBox(width: 10),
                                                                Text(
                                                                  event.location,
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 50),
                                                      ],
                                                    ),
                                                    SizedBox(height: 20),
                                                    Text(
                                                      event.description ?? "Would you like to join this jam session",
                                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              PrimaryButton(
                                                onPressed: () {
                                                  // Handle the join action here
                                                  Navigator.of(context).pop(); // Close the dialog
                                                },
                                                text: 'Join Now', // Join button
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(); // Close the dialog without joining
                                                },
                                                child: Text('Cancel', style: TextStyle(color: Colors.white)), // Cancel button
                                              ),
                                            ],
                                          );

                                        },
                                      );
                                    }, // Action when the card is tapped
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
                          //floating action button
                          Align(
                            alignment: Alignment.bottomRight, // Aligns the FAB to the bottom right
                            child: Padding(
                              padding: const EdgeInsets.all(16.0), // Adds padding for spacing
                              child: Transform.scale(
                                scale: 1.3,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EventCreation1()));
                                  },
                                  child: Icon(Icons.add, size: 40),
                                  backgroundColor: Palette.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                SizedBox(height: 5),

                //This section is temporary
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     ElevatedButton(
                //       style: ButtonStyle(
                //         backgroundColor: WidgetStatePropertyAll(Palette.primary),
                //       ),
                //       onPressed: () async {
                //         await _authUser.signOut();
                //         Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                //       },
                //       child: Text(
                //         "Sign out",
                //         style: TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //     SizedBox(width: 30),
                //     ElevatedButton(
                //       style: ButtonStyle(
                //         backgroundColor: WidgetStatePropertyAll(Palette.primary),
                //       ),
                //       onPressed: () {
                //         Navigator.push(context, MaterialPageRoute(builder: (context) => EventCreation1()));
                //       },
                //       child: Text(
                //         'Add Event',
                //         style: TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          // borderRadius: BorderRadius.vertical(
          //   top: Radius.circular(20.0), // Adjust the radius as per your need
          // ),
          child: BottomAppBar(
            shadowColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            color: Palette.bg, // Replace with Palette.bg if needed
            shape: CircularNotchedRectangle(
            ), // Adds notch if you want to use a FloatingActionButton
            notchMargin: 8.0, // Margin around the notch for the FAB (optional)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.mic, size: 30, color: Colors.white),
                      onPressed: () {
                        print('Home Pressed');
                      },
                    ),
                    Text(
                      'Recordings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search, size: 30, color: Colors.white),
                      onPressed: () {
                        print('Search Pressed');
                      },
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? ClipOval(
                      child: Image.asset(
                        'assets/images/image 9.png',
                        fit: BoxFit.cover,
                      ),
                    )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
