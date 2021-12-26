import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global/widgets/event_card.dart';
import '../../models/event.dart';
import '../../providers/event_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<EventProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 47,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'Swipe right to register',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ),
        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream:
              _firestore.collection('events').orderBy('dateTime').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      'No events created yet. \nMake your own!',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            return Expanded(
              child: ListView(
                children: List.generate(
                  snapshot.data!.docs.length,
                  (index) {
                    Event toBuild =
                        Event.fromMap(snapshot.data!.docs[index].data());
                    if (eventProvider.filterEvent(toBuild)) {
                      return EventCard(
                        event: toBuild,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
