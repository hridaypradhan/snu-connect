import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/widgets/alert_popup.dart';
import 'package:snu_connect/models/end_user.dart';
import 'package:snu_connect/models/event.dart';

class RegistrationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  removeRegisteredUser(String emailToRemove, Event event) async {
    await _firestore
        .collection('events')
        .doc(event.code)
        .collection('registered')
        .doc(emailToRemove)
        .delete();
    await _firestore
        .collection('users')
        .doc(event.host.email)
        .collection('created')
        .doc(event.code)
        .collection('registered')
        .doc(emailToRemove)
        .delete();
    await _firestore.collection('events').doc(event.code).update(
      {
        'peopleCount': FieldValue.increment(-1),
      },
    );
    await _firestore
        .collection('users')
        .doc(event.host.email)
        .collection('created')
        .doc(event.code)
        .update(
      {
        'peopleCount': FieldValue.increment(-1),
      },
    );
    await _firestore
        .collection('users')
        .doc(emailToRemove)
        .collection('registered')
        .doc(event.code)
        .delete();
  }

  register(BuildContext context, Event event) async {
    EndUser currentUser = EndUser.fromAuth();
    if (currentUser.email != event.host.email) {
      var alreadyRegistered = await _firestore
          .collection('users')
          .doc(currentUser.email)
          .collection('registered')
          .doc(event.code)
          .get()
          .then(
            (value) => value.exists,
          );
      if (!alreadyRegistered) {
        var currentEventState =
            await _firestore.collection('events').doc(event.code).get();

        if (currentEventState['peopleCount'] < currentEventState['maxPeople']) {
          var newRegistration = currentUser.toMap();
          await _firestore
              .collection('events')
              .doc(event.code)
              .collection('registered')
              .doc(currentUser.email)
              .set(newRegistration);
          await _firestore
              .collection('users')
              .doc(event.host.email)
              .collection('created')
              .doc(event.code)
              .collection('registered')
              .doc(currentUser.email)
              .set(newRegistration);
          await _firestore.collection('events').doc(event.code).update(
            {
              'peopleCount': FieldValue.increment(1),
            },
          );
          await _firestore
              .collection('users')
              .doc(event.host.email)
              .collection('created')
              .doc(event.code)
              .update(
            {
              'peopleCount': FieldValue.increment(1),
            },
          );
          await _firestore
              .collection('users')
              .doc(currentUser.email)
              .collection('registered')
              .doc(event.code)
              .set(event.toMap());
          await _firestore
              .collection('users')
              .doc(currentUser.email)
              .collection('registered')
              .doc(event.code)
              .update(
            {
              'peopleCount': FieldValue.increment(1),
            },
          );
          ScaffoldMessenger.of(context).showSnackBar(
            alertPopup('REGISTERED!'),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            alertPopup(
              'SORRY, THE EVENT IS FULL',
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          alertPopup(
            'ALREADY REGISTERED FOR THIS EVENT',
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        alertPopup(
          'YOU CAN\'T REGISTER FOR YOUR OWN EVENT',
        ),
      );
    }
  }
}
