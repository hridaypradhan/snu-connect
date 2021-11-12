import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snu_connect/models/end_user.dart';

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> enterChat(EndUser otherUser) async {
    var users = [_auth.currentUser?.email, otherUser.email];
    users.sort();
    _firestore.collection('chats').add(
      {
        "users": users,
        "user2Photo": otherUser.photoUrl,
      },
    );
  }
}
