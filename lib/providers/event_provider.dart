import 'package:flutter/cupertino.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/models/user.dart';

class EventProvider extends ChangeNotifier {
  Category? _selectedCategory;
  String? _venue = 'N/A';
  String? _eventName = 'N/A';
  String? _eventDescription = '';
  int _peopleCount = 1;
  DateTime _selectedDateTime = DateTime.now();
  bool _buttonIsPressed = false;
  List<Category> _selectedCategoryFilters = [];
  String? _searchBoxText = "";
  Event? _toUpload;

  bool get buttonIsPressed => _buttonIsPressed;
  Category? get selectedCategory => _selectedCategory;
  int get peopleCount => _peopleCount;
  String? get eventName => _eventName;
  String? get venue => _venue;
  String? get eventDescription => _eventDescription;
  DateTime? get selectedDateTime => _selectedDateTime;
  List<Category> get selectedCategoryFilters => _selectedCategoryFilters;
  String? get searchBoxText => _searchBoxText;

  Event createEvent() {
    Event newEvent = Event(
      category: _selectedCategory,
      dateTime: _selectedDateTime,
      host: User(
        email: 'hp103',
        phone: '1234567890',
        name: 'Hriday',
      ),
      maxPeople: _peopleCount,
      venue: _venue,
      peopleCount: 0,
      name: _eventName,
      description: _eventDescription,
    );
    print(newEvent);
    _toUpload = newEvent;
    return newEvent;
  }

  pressButton() {
    _buttonIsPressed = true;
    notifyListeners();
  }

  unpressButton() {
    _buttonIsPressed = false;
    notifyListeners();
  }

  clearFields() {
    _selectedCategory = null;
    _venue = '';
    _eventName = '';
    _peopleCount = 1;
    _selectedDateTime = DateTime.now();
    _toUpload = null;
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

  setDescription(String? newDescription) {
    _eventDescription = newDescription;
    notifyListeners();
  }

  setVenue(String? newVenue) {
    _venue = newVenue;
    notifyListeners();
  }

  setEventName(String? newEventName) {
    _eventName = newEventName;
    notifyListeners();
  }

  setCategoryFilters(List<Category> newList) {
    _selectedCategoryFilters = newList;
    notifyListeners();
  }

  clearData() {
    _selectedCategory = null;
    notifyListeners();
  }

  setSearchBoxText(String? newText) {
    _searchBoxText = newText;
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
      host: User(
        email: 'hp103',
        phone: '1234567890',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
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

  List<Event> get activeEvents => _activeEvents;
  var _activeEvents = [
    Event(
      maxPeople: 10,
      peopleCount: 5,
      category: Category.sports,
      dateTime: DateTime.now(),
      venue: 'Football Ground',
      description: 'Please join me. I need a team of 10. Match tomorrow',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
      host: User(
        email: 'hp103',
        phone: '1234567890',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
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
      description: 'Please join me. I need a team of 10. Match tomorrow',
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

  filterEvents(List<Category> selectedCategories) {
    if (selectedCategories.isEmpty) {
      _activeEvents = _dummyEvents;
      notifyListeners();
      return;
    }
    _activeEvents = [];
    List selectedCategoriesText = [];
    for (int i = 0; i < selectedCategories.length; i++) {
      selectedCategoriesText.add(categoryToText(selectedCategories[i]));
    }
    for (Event e in _dummyEvents) {
      if (selectedCategoriesText.contains(categoryToText(e.category))) {
        _activeEvents.add(e);
      }
    }

    notifyListeners();
  }

  searchEvents(String? text) {
    if (text!.isEmpty) {
      _activeEvents = _dummyEvents;
      notifyListeners();
      return;
    }
    _activeEvents = [];
    for (Event e in _dummyEvents) {
      if (e.code!.startsWith(text.toUpperCase())) {
        _activeEvents.add(e);
      }
    }
    notifyListeners();
  }
}
