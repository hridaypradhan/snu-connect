import 'package:flutter/cupertino.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/models/user.dart';

class EventProvider extends ChangeNotifier {
  Category? _selectedCategory;
  String? _venue = '';
  String? _eventName = '';
  int _peopleCount = 1;
  DateTime? _selectedDateTime;

  Category? get selectedCategory => _selectedCategory;
  int get peopleCount => _peopleCount;
  String? get eventName => _eventName;
  String? get venue => _venue;
  DateTime? get selectedDateTime => _selectedDateTime;

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

  List<Event> get dummyEvents => _dummyEvents;
  final _dummyEvents = [
    Event(
      maxPeople: 10,
      peopleCount: 5,
      category: Category.sports,
      dateTime: DateTime.now(),
      venue: 'Football Ground',
      host: User(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
      ),
      name: 'Football Match',
    ),
    Event(
      maxPeople: 100,
      peopleCount: 54,
      category: Category.events,
      dateTime: DateTime.now(),
      venue: 'B315',
      host: User(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
      ),
      name: 'TEDxShivNadarUniversity',
    ),
    Event(
      maxPeople: 1,
      peopleCount: 0,
      category: Category.errands,
      dateTime: DateTime.now(),
      venue: 'Mini Mart',
      host: User(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
      ),
      name: 'Detergent Run',
    ),
    Event(
      maxPeople: 1,
      peopleCount: 0,
      category: Category.items,
      dateTime: DateTime.now(),
      venue: '506 1A',
      host: User(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
      ),
      name: 'Hair Dryer',
    ),
    Event(
      maxPeople: 1,
      peopleCount: 0,
      category: Category.lostFound,
      dateTime: DateTime.now(),
      venue: '506 1A',
      host: User(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
      ),
      name: 'Bose Speakers',
    ),
    Event(
      maxPeople: 2,
      peopleCount: 0,
      category: Category.studies,
      dateTime: DateTime.now(),
      venue: '1A Study Room',
      host: User(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
      ),
      name: 'CSD319 Doubts',
    ),
    Event(
      maxPeople: 10,
      peopleCount: 5,
      category: Category.transport,
      dateTime: DateTime.now(),
      venue: 'Inner Gate',
      host: User(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
      ),
      name: 'Metro',
    ),
  ];
}
