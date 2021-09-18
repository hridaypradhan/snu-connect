import 'package:flutter/cupertino.dart';
import 'package:snu_connect/global/constants/enums.dart';

class EventProvider extends ChangeNotifier {
  Category? _selectedCategory;
  String? _venue = '';
  String? _eventName = '';
  int _peopleCount = 1;

  Category? get selectedCategory => _selectedCategory;
  int get peopleCount => _peopleCount;
  String? get eventName => _eventName;
  String? get venue => _venue;

  pickCategory(Category? newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  changePeopleCount(int toAdd) {
    if (_peopleCount == 1 && toAdd == -1) return;
    _peopleCount += toAdd;
    notifyListeners();
  }

  setVenue(String? newVenue) {
    _venue = newVenue;
    notifyListeners();
  }

  setEventName(String newEventName) {
    _eventName = newEventName;
    notifyListeners();
  }

  clearData() {
    _selectedCategory = null;
    notifyListeners();
  }
}
