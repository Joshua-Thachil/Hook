import 'package:flutter/material.dart';
import 'package:musicapp/Style/Palette.dart';
import 'package:musicapp/components/InputFields.dart';
import 'package:musicapp/components/Buttons.dart';
import 'package:musicapp/components/SegmentedProgressBar.dart';
import 'package:musicapp/screens/HomePage.dart';
import 'package:musicapp/screens/StartUpPage.dart';
import '../components/Globals.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//api integration functions

// Function to get the access token
Future<String?> getAccessToken() async {
  final String clientId = '98ed7d1ae90b4076aff911cb23f20048'; // Replace with your Client ID
  final String clientSecret = '221079e8a0f14332b606f2748a3ede27'; // Replace with your Client Secret

  final response = await http.post(
    Uri.parse('https://accounts.spotify.com/api/token'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret')),
    },
    body: {
      'grant_type': 'client_credentials',
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse['access_token'];
  } else {
    print('Failed to get access token: ${response.body}');
    return null;
  }
}
// Function to use the access token to fetch the song details on search
Future<List<Map<String, String>>> searchSongs(String query) async {
  String? token = await getAccessToken();
  if (token == null) return [];

  final response = await http.get(
    Uri.parse('https://api.spotify.com/v1/search?q=$query&type=track'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    List<Map<String, String>> songs = [];
    for (var item in jsonResponse['tracks']['items']) {
      songs.add({
        'title': item['name'],
        'artist': item['artists'][0]['name'],
        'coverArt': item['album']['images'][0]['url'],
      });
    }
    return songs;
  } else {
    print('Failed to search songs: ${response.body}');
    return [];
  }
}

class ProfileCreation5 extends StatefulWidget {
  const ProfileCreation5({super.key});
  @override
  State<ProfileCreation5> createState() => _ProfileCreation5State();
}

class _ProfileCreation5State extends State<ProfileCreation5> {

  double height = Globals.screenHeight;
  double width = Globals.screenWidth;

  final Palette palette = Palette();
  final TextEditingController songsearchcontroller = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool isSearchFocused = false;

  List<Map<String, String>> _songs = []; //contains the spotify database of songs
  List<Map<String, String>> selectedSongs = []; //contains the user selected songs

  @override
  void initState() {
    super.initState();
    // Add listener to focus node to rebuild the widget when focus changes
    searchFocusNode.addListener(() {
      setState(() {
        isSearchFocused = searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  // Function to handle real-time search
  void _onSearchChanged(String query) async {
    List<Map<String, String>> results = await searchSongs(query);
    setState(() {
      _songs = results; // Update the state with search results
    });
  }

  // Function to add the selected song to the top of the list
  void _onSongSelected(Map<String, String> song) {
    setState(() {
      // Remove the song from _songs and _selectedSongs (if already selected)
      _songs.remove(song);
      selectedSongs.remove(song);

      // Add the song to the selected list (appears at the top)
      selectedSongs.add(song);
    });
  }

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Unfocus when tapping outside
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: ListView(
              children: [
                Visibility(
                  visible: !isSearchFocused && _songs.isEmpty, // Hide progress bar when search is focused
                  child: SegmentedProgressBar(currentStep: 5, totalSteps: 5),
                ),
                SizedBox(height: 10,),
                Visibility(
                  visible: !isSearchFocused && _songs.isEmpty, // Hide title when search is focused
                  child: const Text(
                    "Make your Music bio",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                //this is the search bar
                InputField(
                  InputController: songsearchcontroller,
                  height: 1,
                  hint: "Search your favourite songs",
                  searchFocusNode: searchFocusNode, // Attach the focus node
                  onChanged: _onSearchChanged,
                ),
                SizedBox(height: 30,),
                selectedSongs.isEmpty
                    ? Container()
                    : Column(
                  children: selectedSongs.map((song) {
                    return Card(
                      color: palette.primary,
                      child: ListTile(
                        leading: Image.network(song['coverArt']!),
                        title: Text(song['title']!, style: TextStyle(color: palette.secondary_text, fontWeight: FontWeight.w500)),
                        subtitle: Text(song['artist']!, style: TextStyle(color: palette.secondary_bg)),
                        trailing: IconButton(
                          icon: Icon(Icons.remove, color: Colors.black), // Change to minus icon
                          onPressed: () {
                            setState(() {
                              selectedSongs.remove(song); // Remove song from the selected list
                            });
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),

                if (_songs.isEmpty) ...[
                  // Only display this section when no songs are found (initial state)
                  Visibility(
                    visible: !isSearchFocused, // Hide image when search is focused
                    child: Container(
                      height: 300,
                      child: const Image(
                        image: AssetImage('assets/images/allen illus1.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: !isSearchFocused, // Hide body text when search is focused
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Create a small playlist to showcase your music taste",
                        style: TextStyle(
                          color: palette.primary_text,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  // Display search results when available
                  Container(
                    height: 600,
                    child: ListView.builder(
                      itemCount: _songs.length,
                      itemBuilder: (context, index) {
                        final song = _songs[index];
                        // Check if the song is already in the selectedSongs list
                        if (selectedSongs.contains(song)) {
                          return SizedBox.shrink(); // Return an empty widget if the song is selected
                        }
                        return Container(
                          // color: palette.secondary_bg,
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: ListTile(
                            leading: Image.network(song['coverArt']!),
                            title: Text(song['title']!, style: TextStyle(color: Colors.white,),),
                            subtitle: Text(song['artist']!, style: TextStyle(color: Colors.grey),),
                            trailing: IconButton(
                              icon: Icon(Icons.add, color: Colors.white),
                              onPressed: () {
                                _onSongSelected(song); // Move song to top of the list
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StartUpPage()));
            },
              child: Text("Skip for now?",
                style: TextStyle(
                  color: palette.primary_text, fontSize: 18, fontWeight: FontWeight.bold
                ),
              ),
            ),
            NextButton(
              text: "Done",
              icon: Icons.arrow_forward,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StartUpPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
