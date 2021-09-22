import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snu_connect/models/event.dart';

class CreatedEventCard extends StatelessWidget {
  final Event event;

  const CreatedEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5.0,
        color: Colors.orange[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              event.name.toString(),
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              DateFormat.MMMEd().format(event.dateTime),
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            Text(
              DateFormat.jm().format(event.dateTime),
              style: const TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
