import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/end_user.dart';
import 'package:snu_connect/screens/individual_chat/individual_chat_screen.dart';

class ConversationThread extends StatefulWidget {
  final EndUser otherUser;
  final bool unread;
  const ConversationThread({
    Key? key,
    required this.otherUser,
    required this.unread,
  }) : super(key: key);

  @override
  State<ConversationThread> createState() => _ConversationThreadState();
}

class _ConversationThreadState extends State<ConversationThread>
    with SingleTickerProviderStateMixin {
  Animation<Color?>? animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.transparent,
      end: lightPink,
    ).animate(controller)
      ..addListener(
        () {
          setState(() {});
        },
      );
  }

  void animateColor() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseAuth _auth = FirebaseAuth.instance;
    return GestureDetector(
      onTap: () {
        animateColor();
        Future.delayed(
          const Duration(
            milliseconds: 450,
          ),
          () {
            _firestore
                .collection('users')
                .doc(_auth.currentUser?.email)
                .collection('chats')
                .doc(widget.otherUser.email)
                .update(
              {
                'unread': false,
              },
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IndividualChatScreen(
                  otherUser: widget.otherUser,
                ),
              ),
            );
          },
        ).then(
          (value) => controller.reset(),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: animation?.value,
          border: Border.all(color: primaryPink, width: 2),
          borderRadius: BorderRadius.circular(35),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.otherUser.photoUrl.toString()),
          ),
          title: Text(
            widget.otherUser.name ?? 'Name',
            style: TextStyle(
              fontWeight: widget.unread ? FontWeight.bold : null,
            ),
          ),
          subtitle: FutureBuilder<QuerySnapshot>(
            future: _firestore
                .collection('users')
                .doc(_auth.currentUser?.email)
                .collection('chats')
                .doc(widget.otherUser.email)
                .collection('messages')
                .orderBy('timestamp')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String lastMessage = snapshot.data?.docs.last['text'];
                if (lastMessage.length >= 25) {
                  lastMessage = lastMessage.substring(0, 15);
                  lastMessage += '...';
                }
                return Text(lastMessage);
              } else {
                return const Text('Loading...');
              }
            },
          ),
          trailing: Icon(
            Icons.circle,
            size: 15.0,
            color: widget.unread ? primaryPink : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
