import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/end_user.dart';
import 'package:snu_connect/models/event.dart';

List<EndUser> dummyEndUsers = [
  EndUser(name: 'Shraddha', email: 'sa350', phone: '1234567890'),
  EndUser(name: 'Mehak', email: 'ma350', phone: '1234567890'),
  EndUser(name: 'Kritika', email: 'km224', phone: '1234567890'),
  EndUser(name: 'Hriday', email: 'hp103', phone: '1234567890'),
  EndUser(name: 'Narjis', email: 'nn782', phone: '1234567890'),
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
                  InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.drag_handle),
                              // TODO Add heading and list of registered people here with name and email and option to start chat
                              const Text(
                                'Registrations',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: dummyEndUsers.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          color: lightPink,
                                          child: ListTile(
                                            leading: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text((index + 1).toString(),
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                    )),
                                              ],
                                            ),
                                            title:
                                                Text(dummyEndUsers[index].name),
                                            subtitle: Text(
                                                dummyEndUsers[index].email),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Icon(
                                                  Icons.message,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.black,
                                                )
                                              ],
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              // TODO Remove person option for the creator only
                            ],
                          ),
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
                            event.host.name,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            event.host.email,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            event.host.phone,
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
                              print("Hello");
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
