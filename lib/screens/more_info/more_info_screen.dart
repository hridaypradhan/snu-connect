import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/end_user.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/screens/more_info/widgets/registered_user_card.dart';
import 'package:snu_connect/screens/individual_chat/individual_chat_screen.dart';

List<EndUser> dummyEndUsers = [
  EndUser(
    name: 'Shraddha',
    email: 'sa350',
    phone: '1234567890',
    photoUrl: 'photoUrl',
  ),
  EndUser(
    name: 'Mehak',
    email: 'ma350',
    phone: '1234567890',
    photoUrl: 'photoUrl',
  ),
  EndUser(
    name: 'Kritika',
    email: 'km224',
    phone: '1234567890',
    photoUrl: 'photoUrl',
  ),
  EndUser(
    name: 'Hriday',
    email: 'hp103',
    phone: '1234567890',
    photoUrl: 'photoUrl',
  ),
  EndUser(
    name: 'Narjis',
    email: 'nn782',
    phone: '1234567890',
    photoUrl: 'photoUrl',
  ),
];

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
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.jm().format(event.dateTime),
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
                  InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        builder: (context) => Column(
                          children: [
                            const Icon(Icons.drag_handle),
                            const SizedBox(height: 8.0),
                            const Text(
                              'Registrations',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: dummyEndUsers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return RegisteredUserCard(
                                    serialNumber: index + 1,
                                    name: dummyEndUsers[index].name ?? 'Name',
                                    email:
                                        dummyEndUsers[index].email ?? 'Email',
                                  );
                                },
                              ),
                            ),
                            // TODO Remove person option for the creator only
                          ],
                        ),
                      );
                    },
                    child: Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: getCodeColor(event.category),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
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
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: getCodeColor(event.category),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
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
                          const SizedBox(height: 5),
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
                      padding: const EdgeInsets.all(15.0),
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
                          const SizedBox(height: 5),
                          Text(
                            event.host.name ?? 'Name',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            event.host.email ?? 'Email',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            event.host.phone ?? 'Phone',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Chat Now",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.chat),
                              ],
                            ),
                            onTap: () {
                              if (FirebaseAuth.instance.currentUser?.email !=
                                  event.host.email) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IndividualChatScreen(
                                      otherUser: event.host,
                                    ),
                                  ),
                                );
                              }
                            },
                          )
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
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
