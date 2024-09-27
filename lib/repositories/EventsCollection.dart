import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicapp/auth/auth_service.dart';

class Event {

  static CollectionReference Events = FirebaseFirestore.instance.collection("Events");
  // var getDocument = Events.doc()

  // Create Event on Choosing Event Type
  createEvent(String type) async {
    await Events.doc().set({
      "type" : type,
      "host" : AuthService.userID
    });
  }

  // TODO Update Genres (Pick Your Vibe)
  Future<void> editGenres(List<String>? genres, DocumentSnapshot document) async
  {
    await Events.doc(document.id).update({
      "genres" : genres
    });
  }

}