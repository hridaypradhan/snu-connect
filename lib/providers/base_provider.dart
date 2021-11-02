import 'package:flutter/material.dart';
import 'package:snu_connect/screens/all_chats/all_chats_screen.dart';
import 'package:snu_connect/screens/home/home_screen.dart';
import 'package:snu_connect/screens/profile/profile_screen.dart';

class BaseProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  Widget get getPage {
    switch (_currentPage) {
      case 0:
        return const HomeScreen();
      case 2:
        return AllChatsScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  void changePage(int newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
