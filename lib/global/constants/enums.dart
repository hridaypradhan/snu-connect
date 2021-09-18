import 'package:flutter/material.dart';

enum Category {
  sports,
  studies,
  transport,
  events,
  lostFound,
  items,
  errands,
}

String categoryToText(Category? category) {
  String snippet = category.toString().substring(9);
  switch (snippet) {
    case 'sports':
      return 'Sports';
    case 'studies':
      return 'Studies';
    case 'transport':
      return 'Transport';
    case 'events':
      return 'Events';
    case 'lostFound':
      return 'Lost and Found';
    case 'items':
      return 'Items';
    case 'errands':
      return 'Errands';
    default:
      return 'Misc';
  }
}

Color getCategoryColor(Category? category) {
  switch (category) {
    case Category.errands:
      return Colors.redAccent;
    case Category.events:
      return Colors.orangeAccent;
    case Category.items:
      return Colors.yellowAccent;
    case Category.lostFound:
      return Colors.greenAccent;
    case Category.sports:
      return Colors.blueAccent;
    case Category.studies:
      return Colors.indigoAccent;
    case Category.transport:
      return Colors.white;
    default:
      return Colors.white;
  }
}
