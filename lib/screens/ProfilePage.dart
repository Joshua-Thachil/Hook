import 'dart:io';
import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/Cards.dart';

class ProfileEvent {
  final String title;
  final String organizer;
  final String date;
  final String location;

  ProfileEvent({
    required this.title,
    required this.organizer,
    required this.date,
    required this.location,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  //basic user details
  File? _image;
  String _events = '9';
  String _followers = '11';
  String _username = 'Arlene';
  String _karma = '651';
  String _description = 'I like music a little bit, I am also a little bit racist. Not many people would accept that about themselves but here I am telling the truth.';
  //events list
  List<ProfileEvent> upcomingevents = [
    ProfileEvent(
      title: 'Jam Session',
      organizer: 'hosegoat37',
      date: '5th Sept, 6pm',
      location: 'Jayanagar',
    ),
    ProfileEvent(
      title: 'Art Exhibition',
      organizer: 'artlover56',
      date: '10th Sept, 11am',
      location: 'MG Road',
    ),
    ProfileEvent(
      title: 'Coding Workshop',
      organizer: 'codewizard99',
      date: '15th Sept, 2pm',
      location: 'Koramangala',
    ),
  ];
  List<ProfileEvent> myevents = [
    ProfileEvent(
      title: 'My Jam Session',
      organizer: 'myself37',
      location: 'Indiranagar',
      date: '10th Sept, 4pm',
    ),
    ProfileEvent(
      title: 'Code Meetup',
      organizer: 'myself37',
      location: 'Koramangala',
      date: '12th Sept, 11am',
    ),
    ProfileEvent(
      title: 'Design Workshop',
      organizer: 'myself37',
      location: 'HSR Layout',
      date: '15th Sept, 2pm',
    ),
    ProfileEvent(
      title: 'Music Fest',
      organizer: 'myself37',
      location: 'Jayanagar',
      date: '20th Sept, 7pm',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      appBar: AppBar(
        backgroundColor: Palette.bg,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 35,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //profile picture
                CircleAvatar(
                  radius: 60,
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
                //events
                Column(
                  children: [
                    Text(
                      _events,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "events",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
                //followers
                Column(
                  children: [
                    Text(
                      _followers,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "followers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Palette.secondary_bg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.deepOrange,
                        size: 30,
                      ),
                      SizedBox(width:5,),
                      Text(
                        _karma,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            //Events section
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  //tabs
                  Container(
                    decoration: BoxDecoration(
                      color: Palette.bg,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    ),
                    child: TabBar(
                      labelStyle: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      dividerColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(
                        color: Colors.black87,  // Background color of the pill
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)), // Rounded corners for pill effect
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: 'Upcoming events'),
                        Tab(text: 'My events'),
                      ],
                    ),
                  ),
                  //tab views
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                    ),
                    height: 200,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal, // Makes the list horizontal
                          itemCount: upcomingevents.length, // Number of items in the list
                          itemBuilder: (context, index) {
                            // Get the event object from the list
                            final event = upcomingevents[index];

                            return ProfileEventCard(
                              onTap: () {
                                // Handle the tap event here
                              },
                              title: event.title,           // Use title from the event
                              organizer: event.organizer,   // Use organizer from the event
                              location: event.location,     // Use location from the event
                              date: event.date,             // Use date from the event
                            );
                          },
                        ),
                        ListView.builder(
                          scrollDirection: Axis.horizontal, // Makes the list horizontal
                          itemCount: myevents.length, // Number of items in the list
                          itemBuilder: (context, index) {
                            // Get the event object from the list
                            final event = myevents[index];

                            return ProfileEventCard(
                              onTap: () {
                                // Handle the tap event here
                              },
                              title: event.title,           // Use title from the event
                              organizer: event.organizer,   // Use organizer from the event
                              location: event.location,     // Use location from the event
                              date: event.date,             // Use date from the event
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text(
              'Update your music profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Palette.primary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: (){},
                    child: Text(
                      'Edit your Music Bio',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Palette.primary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: (){},
                    child: Text(
                      'Edit your Genres',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Palette.primary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: (){},
                    child: Text(
                      'Edit your Instruments',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text(
              'Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Palette.secondary_bg,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(15.0),
              child: Text(
                _description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      )
    );
  }
}
