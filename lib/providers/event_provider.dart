import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/event.dart';

class EventProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Category? _selectedCategory;
  int _peopleCount = 1;
  List<Category> _selectedCategoryFilters = [];
  String? _searchBoxText = "";
  bool _buttonIsPressed = false;

  bool get buttonIsPressed => _buttonIsPressed;
  Category? get selectedCategory => _selectedCategory;
  int get peopleCount => _peopleCount;
  List<Category> get selectedCategoryFilters => _selectedCategoryFilters;
  String? get searchBoxText => _searchBoxText;

  bool checkEventByCategory(Event event) {
    if (_selectedCategoryFilters.isEmpty) {
      return true;
    }
    for (Category? category in _selectedCategoryFilters) {
      if (category == event.category) {
        return true;
      }
    }
    return false;
  }

  bool checkEventByCode(Event event) {
    return event.code!
        .toLowerCase()
        .startsWith(_searchBoxText!.toLowerCase().trim());
  }

  bool filterEvent(Event event) {
    if (_searchBoxText!.isEmpty) {
      return checkEventByCategory(event);
    } else {
      return checkEventByCode(event);
    }
  }

  setCategoryFilters(List<Category> newList) {
    _selectedCategoryFilters = newList;
    notifyListeners();
  }

  setSearchBoxText(String newText) {
    _searchBoxText = newText;
    notifyListeners();
  }

  Future<void> uploadEvent(Event event) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser?.email)
        .collection('created')
        .doc(event.code)
        .set(
          event.toMap(),
        );
    await _firestore.collection('events').doc(event.code).set(
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
}
