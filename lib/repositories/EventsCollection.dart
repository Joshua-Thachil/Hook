import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicapp/auth/auth_service.dart';

class Event {

  static CollectionReference Events = FirebaseFirestore.instance.collection("Events");
  static var eventID; // global event variable holding ID of latest created event
  var getDocument =  Events.doc(eventID).get();

  // Create Event on Choosing Event Type
  createEvent(String type) async {

    // Create Document Reference
    DocumentReference eventRef = Events.doc();

    // Creating the referenced Document with "type" and "host" data
    await eventRef.set({
      "type" : type,
      "host" : AuthService.userID
    });

    eventID = eventRef.id; // assigning created event's ID to eventID variable
  }

  // Update Genres (Pick Your Vibe)
  Future<void> editGenres(List<String>? genres, DocumentSnapshot document) async
  {
    await Events.doc(document.id).update({
      "genres" : genres
    });
  }

}