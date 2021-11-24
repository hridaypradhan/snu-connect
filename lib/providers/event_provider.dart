import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/models/end_user.dart';

class EventProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Category? _selectedCategory;
  int _peopleCount = 1;
  bool _buttonIsPressed = false;

  bool get buttonIsPressed => _buttonIsPressed;
  Category? get selectedCategory => _selectedCategory;
  int get peopleCount => _peopleCount;

  Future<void> uploadEvent(Event event) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser?.email)
        .collection('created')
        .add(
          event.toMap(),
        );
    await _firestore.collection('events').add(
          event.toMap(),
        );
    _peopleCount = 1;
    _selectedCategory = null;
    notifyListeners();
  }

  Future<void> deleteEvent(Event event) async {
    var personalCollection = _firestore
        .collection('users')
        .doc(_auth.currentUser?.email)
        .collection('created');
    var generalCollection = _firestore.collection('events');
    await personalCollection
        .where(
          'code',
          isEqualTo: event.code,
        )
        .get()
        .then(
      (value) {
        personalCollection.doc(value.docs[0].id).delete();
      },
    );
    await generalCollection
        .where(
          'code',
          isEqualTo: event.code,
        )
        .get()
        .then(
      (value) {
        generalCollection.doc(value.docs[0].id).delete();
      },
    );
  }

  pressButton() {
    _buttonIsPressed = true;
    notifyListeners();
  }

  unpressButton() {
    _buttonIsPressed = false;
    notifyListeners();
  }

  pickCategory(Category? newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  changePeopleCount(int toAdd) {
    if (_peopleCount == 1 && toAdd == -1) return;
    _peopleCount += toAdd;
    notifyListeners();
  }

  clearData() {
    _selectedCategory = null;
    notifyListeners();
  }

  List<Event> get dummyEvents => _dummyEvents;
  final _dummyEvents = [
    Event(
      maxPeople: 10,
      peopleCount: 5,
      category: Category.sports,
      dateTime: DateTime.now(),
      venue: 'Football Ground',
      description: 'Please join me. I need a team of 10. Match tomorrow',
      host: EndUser(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
        photoUrl: 'sample',
      ),
      name: 'Football Match',
    ),
    Event(
      maxPeople: 100,
      peopleCount: 54,
      category: Category.events,
      dateTime: DateTime.now(),
      venue: 'B315',
      description: 'Please join me. I need a team of 10. Match tomorrow',
      host: EndUser(
        email: 'hp103',
        phone: '1234567890',
        photoUrl: 'sample',
        name: 'Hriday',
      ),
      name: 'TEDxSNU',
    ),
    Event(
      maxPeople: 1,
      peopleCount: 0,
      category: Category.errands,
      dateTime: DateTime.now(),
      venue: 'Mini Mart',
      description: 'Please join me. I need a team of 10. Match tomorrow',
      host: EndUser(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
        photoUrl: 'sample',
      ),
      name: 'Detergent Run',
    ),
    Event(
      maxPeople: 1,
      peopleCount: 0,
      category: Category.items,
      dateTime: DateTime.now(),
      description: 'Please join me. I need a team of 10. Match tomorrow',
      venue: '506 1A',
      host: EndUser(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
        photoUrl: 'sample',
      ),
      name: 'Hair Dryer',
    ),
    Event(
      maxPeople: 1,
      peopleCount: 0,
      category: Category.lostFound,
      dateTime: DateTime.now(),
      description: 'Please join me. I need a team of 10. Match tomorrow',
      venue: '506 1A',
      host: EndUser(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
        photoUrl: 'sample',
      ),
      name: 'Bose Speakers',
    ),
    Event(
      maxPeople: 2,
      peopleCount: 0,
      category: Category.studies,
      description: 'Please join me. I need a team of 10. Match tomorrow',
      dateTime: DateTime.now(),
      venue: '1A Study Room',
      host: EndUser(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
        photoUrl: 'sample',
      ),
      name: 'CSD319 Doubts',
    ),
    Event(
      maxPeople: 10,
      peopleCount: 5,
      category: Category.transport,
      description: 'Please join me. I need a team of 10. Match tomorrow',
      dateTime: DateTime.now(),
      venue: 'Inner Gate',
      host: EndUser(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
        photoUrl: 'sample',
      ),
      name: 'Metro',
    ),
  ];
}
