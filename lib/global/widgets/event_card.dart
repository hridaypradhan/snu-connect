import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../constants/colors.dart';
import 'alert_popup.dart';
import '../../models/event.dart';
import '../constants/enums.dart';
import '../../screens/more_info/more_info_screen.dart';
import '../../services/registration_service.dart';

class EventCard extends StatefulWidget {
  final Event event;
  final bool isPreview;

  const EventCard({
    Key? key,
    required this.event,
    this.isPreview = false,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isRegistering = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Slidable(
      actionPane: const SlidableScrollActionPane(),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: !widget.isPreview
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
                                var toReport = widget.event.toMap();

                                toReport.addAll(
                                  {
                                    'reason': reportController.text,
                                    'reporterName':
                                        _auth.currentUser?.displayName,
                                    'reporterEmail': _auth.currentUser?.email,
                                    'reportTime': DateTime.now(),
                                  },
                                );

                                _firestore
                                    .collection('reportedEvents')
                                    .doc(widget.event.code)
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
                backgroundColor: getCodeColor(widget.event.category),
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
              onTap: !widget.isPreview
                  ? () {
                      FlutterClipboard.copy(widget.event.code.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        alertPopup('EVENT CODE COPIED'),
                      );
                    }
                  : null,
              child: CircleAvatar(
                backgroundColor: getCodeColor(widget.event.category),
                child: const Center(
                  child: Icon(
                    Icons.copy,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Copy Code",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isRegistering
                ? CircularProgressIndicator(
                    color: getCodeColor(widget.event.category),
                  )
                : InkWell(
                    onTap: !widget.isPreview
                        ? () {
                            RegistrationService _registrationService =
                                RegistrationService();

                            setState(
                              () {
                                isRegistering = true;
                              },
                            );

                            _registrationService.register(
                              context,
                              widget.event,
                            );

                            Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                setState(
                                  () {
                                    isRegistering = false;
                                  },
                                );
                              },
                            );
                          }
                        : null,
                    child: CircleAvatar(
                      backgroundColor: getCodeColor(widget.event.category),
                      child: const Center(
                        child: Icon(
                          Icons.app_registration,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 10),
            const Text('Register'),
          ],
        ),
      ],
      child: InkWell(
        onTap: !widget.isPreview
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MoreInfoScreen(
                        event: widget.event,
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
            color: getCategoryColor(widget.event.category),
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
                        widget.event.name ?? '',
                        style: const TextStyle(fontSize: 30.0),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: getCodeColor(widget.event.category),
                      ),
                      child: Text(
                        widget.event.code.toString(),
                        style: const TextStyle(fontSize: 15.0),
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
                            DateFormat.MMMEd().format(widget.event.dateTime),
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            DateFormat.jm().format(widget.event.dateTime),
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.event.venue ?? '',
                            style: const TextStyle(fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${widget.event.peopleCount} / ${widget.event.maxPeople} ',
                                style: const TextStyle(fontSize: 15.0),
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
                              color: getCodeColor(widget.event.category),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              categoryToText(widget.event.category),
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.18,
                        width: size.width * 0.4,
                        child: getCategoryImage(widget.event.category),
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
