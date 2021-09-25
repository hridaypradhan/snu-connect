import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/event.dart';

class MoreInfoScreen extends StatelessWidget {
  static const String id = 'more_info';
  final Event event;
  const MoreInfoScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: size.width * 0.95,
            height: size.height * 0.99,
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: getCategoryColor(event.category),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min, //what
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      )
                    ],
                  ),
                  Text(
                    event.name.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        DateFormat.MMMEd().format(event.dateTime),
                        //e.dateTime.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.jm().format(event.dateTime),
                        //e.dateTime.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event.venue.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${event.peopleCount} / ${event.maxPeople}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.people),
                    ],
                  ),
                  Card(
                    margin: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: getCodeColor(event.category),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Short Description ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            event.description.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: getCodeColor(event.category),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Organizer Contact Details",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            event.host.name,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            event.host.email,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            event.host.phone,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: getCategoryImage(event.category),
                    ),
                  ), //why
                  const SizedBox(
                    height: 5,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: const [
                  //     SizedBox(
                  //       width: 40,
                  //     ),
                  //     Text("Need partners? Team up!"),
                  //     Icon(Icons.add),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
