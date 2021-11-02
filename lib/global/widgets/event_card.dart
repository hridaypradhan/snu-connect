import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/screens/more_info/more_info_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Slidable(
      actionPane: const SlidableScrollActionPane(),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                FlutterClipboard.copy(event.code.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: lightPink,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0,
                    ),
                    content: const Text(
                      'EVENT CODE COPIED',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryPink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: getCodeColor(event.category),
                child: const Center(
                  child: Icon(
                    Icons.copy,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Copy Code",
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: lightPink,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0,
                    ),
                    content: const Text(
                      'REGISTERED!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryPink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: getCodeColor(event.category),
                child: const Center(
                  child: Icon(
                    Icons.app_registration,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Register",
            ),
          ],
        ),
      ],
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MoreInfoScreen(
                  event: event,
                );
              },
            ),
          );
        },
        child: Container(
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
                        event.name ?? '',
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
                            event.venue ?? '',
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
                        width: size.width * 0.4,
                        child: getCategoryImage(event.category),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
