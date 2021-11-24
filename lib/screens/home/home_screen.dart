import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/widgets/event_card.dart';
import 'package:snu_connect/models/event.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _firestore.collection('events').orderBy('dateTime').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No events created yet. \nMake your own!',
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView(
          children: List.generate(
            snapshot.data!.docs.length,
            (index) => EventCard(
              event: Event.fromMap(snapshot.data!.docs[index].data()),
            ),
          ),
        );
      },
    );
  }
}
