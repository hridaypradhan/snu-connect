import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/global/constants/enums.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: getCategoryColor(event.category),
        elevation: 10,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    event.name,
                    style: const TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: getCodeColor(event.category),
                  ),
                  child: Text(
                    event.code.toString(),
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.MMMEd().format(event.dateTime),
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        DateFormat.jm().format(event.dateTime),
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        event.venue,
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${event.peopleCount} / ${event.maxPeople} ',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(width: 5.0),
                          const Icon(
                            Icons.people,
                            size: 15.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: getCodeColor(event.category),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          categoryToText(event.category),
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.18,
                    width: size.width * 0.5,
                    child: getCategoryImage(event.category),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
