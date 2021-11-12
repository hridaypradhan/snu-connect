import 'dart:math';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/end_user.dart';

class Event {
  String? code, description, name, venue;
  Category? category;
  DateTime dateTime;
  EndUser host;
  int peopleCount, maxPeople;

  Event({
    required this.name,
    required this.category,
    required this.dateTime,
    required this.host,
    required this.venue,
    required this.peopleCount,
    required this.maxPeople,
    required this.description,
    this.code,
  }) {
    if (code == null) generateCode(4);
  }

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        code: json["code"],
        description: json["description"],
        name: json["name"],
        venue: json["venue"],
        category: categoryFromText(json["category"]),
        dateTime: DateTime.parse(json["dateTime"].toDate().toString()),
        host: EndUser.fromMap(json["host"]),
        peopleCount: json["peopleCount"],
        maxPeople: json["maxPeople"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "description": description,
        "name": name,
        "venue": venue,
        "category": categoryToText(category),
        "dateTime": dateTime,
        "host": host.toMap(),
        "peopleCount": peopleCount,
        "maxPeople": maxPeople,
      };

  String generateCode(int length) {
    var random = Random();
    const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    return List.generate(
        length, (index) => _chars[random.nextInt(_chars.length)]).join();
  }

  @override
  String toString() {
    return '$name - $venue - $category - $maxPeople - $description';
  }
}
