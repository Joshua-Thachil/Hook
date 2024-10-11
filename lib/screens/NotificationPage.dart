import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/Cards.dart';

class NotificationModel {
  final String notificationText;
  final String timeSent;

  NotificationModel({
    required this.notificationText,
    required this.timeSent,
  });
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<NotificationModel> notifications = [
    NotificationModel(
      notificationText: 'Your jam room booking for 3:00 PM today has been confirmed.',
      timeSent: '15 mins ago',
    ),
    NotificationModel(
      notificationText: 'Reminder: Guitar practice session with Sarah at 5:00 PM.',
      timeSent: '1 hr ago',
    ),
    NotificationModel(
      notificationText: 'Band rehearsal rescheduled to tomorrow at 7:00 PM.',
      timeSent: '2 hrs ago',
    ),
    NotificationModel(
      notificationText: 'New event: Live Jazz night at the community hall this Saturday.',
      timeSent: '4 hrs ago',
    ),
  ];
  List<NotificationModel> upcomingEvents = [
    NotificationModel(
      notificationText: 'Jam Room Booking - Drummers Club at 3:00 PM, Tomorrow.',
      timeSent: 'In 1 day',
    ),
    NotificationModel(
      notificationText: 'Live Performance: Jazz Quartet at The Rhythm House - 8:00 PM, Saturday.',
      timeSent: 'In 3 days',
    ),
    NotificationModel(
      notificationText: 'Band Rehearsal for Annual Music Fest - 6:00 PM, Monday.',
      timeSent: 'In 4 days',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Palette.bg,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(66),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: AppBar(
                centerTitle: true,
                title: Text(
                  'Updates',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: true,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),

                //tab bar
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
                      Tab(text: 'Events'),
                      Tab(text: 'Groups'),
                    ],
                  ),
                ),
                SizedBox(height: 30,),

                Expanded(
                  child: TabBarView(
                    children: [
                      //events tab
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            // Unread messages section
                            Theme(
                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedIconColor: Colors.white,   // Icon color when collapsed
                                iconColor: Palette.primary,            // Icon color when expanded
                                title: Text(
                                  'Unread',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                subtitle: Text(
                                  '${notifications.length} new messages',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  ListView.builder(
                                    shrinkWrap: true,  // To make sure ListView takes only necessary space
                                    physics: NeverScrollableScrollPhysics(),  // Disable ListView scrolling inside ExpansionTile
                                    itemCount: notifications.length,
                                    itemBuilder: (context, index) {
                                      final notification = notifications[index];
                                      return NotificationCard(
                                        notificationText: notification.notificationText,
                                        timeSent: notification.timeSent,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            // Upcoming Events section
                            Theme(
                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedIconColor: Colors.white,   // Icon color when collapsed
                                iconColor: Palette.primary,
                                title: Text(
                                  'Upcoming Events',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                subtitle: Text(
                                  '${upcomingEvents.length} new events',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  ListView.builder(
                                    shrinkWrap: true,  // To make sure ListView takes only necessary space
                                    physics: NeverScrollableScrollPhysics(),  // Disable ListView scrolling inside ExpansionTile
                                    itemCount: upcomingEvents.length,
                                    itemBuilder: (context, index) {
                                      final notification = upcomingEvents[index];
                                      return NotificationCard(
                                        notificationText: notification.notificationText,
                                        timeSent: notification.timeSent,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50,),
                          ],
                        ),
                      ),
                      //groups tab
                      Text(
                        "Something will come here",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
