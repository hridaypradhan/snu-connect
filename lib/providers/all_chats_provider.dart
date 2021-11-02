import 'package:flutter/material.dart';
import 'package:snu_connect/models/user.dart';

final List<User> _dummyUsers = [
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Mehak',
    email: 'sa350',
    phone: '123456789',
  ),
];

class AllChatsProvider extends ChangeNotifier {
  List<User> filteredList = _dummyUsers;

  void filterList(String query) {
    List<User> matchingUsers = [];

    for (User u in _dummyUsers) {
      if (u.name.toLowerCase().startsWith(query.toLowerCase())) {
        matchingUsers.add(u);
      }
    }
    filteredList = matchingUsers;
    notifyListeners();
  }

  List<User> get dummyUsers => _dummyUsers;
}
