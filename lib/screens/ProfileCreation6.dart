import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/screens/HomePage.dart';
import 'package:musicapp/screens/StartUpPage.dart';

import '../components/Buttons.dart';

class ProfileCreation6 extends StatefulWidget {
  final List<Map<String, String>> selectedSongs;

  const ProfileCreation6({super.key, required this.selectedSongs});

  @override
  State<ProfileCreation6> createState() => _ProfileCreation6State();
}

class _ProfileCreation6State extends State<ProfileCreation6> {

  final Palette palette = Palette();

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
      body: widget.selectedSongs.isEmpty
          ? const Center(
        child: Text('No songs selected.'),
      )
          : Padding(
            padding: const EdgeInsets.only(left: 26, right: 26),
            child: Center(
              child: Column(
                children: [
              SizedBox(height: 50),
              Text(
                "Like your list?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.selectedSongs.length,
                  itemBuilder: (context, index) {
                    final song = widget.selectedSongs[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: palette.secondary_bg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(8.0), // Padding around the content
                      margin: EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          // Cover art or icon
                          song['coverArt'] != null
                              ? Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0), // Optional border radius for the image
                              image: DecorationImage(
                                image: NetworkImage(song['coverArt']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                              : const Icon(Icons.music_note, size: 50, color: Colors.grey), // Fallback icon

                          const SizedBox(width: 10), // Space between image/icon and text

                          // Title and subtitle
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Song title
                                Text(
                                  song['title'] ?? 'Unknown Title',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                // Artist name
                                Text(
                                  song['artist'] ?? 'Unknown Artist',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );

                  },
                ),
              ),
                      ],
                    ),
            ),
          ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.only(bottom: 20, right: 30),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            NextButton(
              text: "Done",
              icon: Icons.arrow_forward,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StartUpPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
