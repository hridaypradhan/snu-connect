import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/widgets/alert_popup.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/screens/more_info/more_info_screen.dart';
import 'package:snu_connect/services/registration_service.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final bool isPreview;
  const EventCard({
    Key? key,
    required this.event,
    this.isPreview = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Slidable(
      actionPane: const SlidableScrollActionPane(),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: !isPreview
                  ? () {
                      TextEditingController reportController =
                          TextEditingController();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          title: const Icon(
                            Icons.report,
                            size: 40.0,
                            color: primaryPink,
                          ),
                          actions: [
                            TextButton(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: primaryPink,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: const Text(
                                'Report',
                                style: TextStyle(
                                  color: primaryPink,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                var toReport = event.toMap();
                                toReport.addAll(
                                  {
                                    'reason': reportController.text,
                                    'reporterName': FirebaseAuth
                                        .instance.currentUser?.displayName,
                                    'reporterEmail': FirebaseAuth
                                        .instance.currentUser?.email,
                                    'reportTime': DateTime.now(),
                                  },
                                );
                                _firestore
                                    .collection('reportedEvents')
                                    .doc(event.code)
                                    .set(toReport)
                                    .then(
                                  (value) {
                                    Navigator.pop(context);
                                    reportController.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      alertPopup('EVENT REPORTED'),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                          content: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            maxLines: null,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: lightPink,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: primaryPink,
                                  width: 2.5,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'What\'s wrong with this event?',
                            ),
                            controller: reportController,
                          ),
                        ),
                      );
                    }
                  : null,
              child: CircleAvatar(
                backgroundColor: getCodeColor(event.category),
                child: const Center(
                  child: Icon(
                    Icons.report,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Report",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: !isPreview
                  ? () {
                      FlutterClipboard.copy(event.code.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        alertPopup('EVENT CODE COPIED'),
                      );
                    }
                  : null,
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: !isPreview
                  ? () {
                      RegistrationService _registrationService =
                          RegistrationService();
                      _registrationService.register(context, event);
                    }
                  : null,
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
        onTap: !isPreview
            ? () {
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
              }
            : null,
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
