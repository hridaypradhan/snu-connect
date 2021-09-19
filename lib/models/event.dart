import 'dart:math';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/user.dart';

class Event {
  String name, venue;
  String? image, code;
  Category category;
  DateTime dateTime;
  User host;
  int peopleCount, maxPeople;

  Event({
    required this.name,
    required this.category,
    required this.dateTime,
    required this.host,
    required this.venue,
    required this.peopleCount,
    required this.maxPeople,
    this.image,
  }) {
    code = generateCode(4);
  }

  String generateCode(int length) {
    var random = Random();
    const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    return List.generate(
        length, (index) => _chars[random.nextInt(_chars.length)]).join();
  }
}
