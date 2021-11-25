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

Category categoryFromText(String text) {
  switch (text) {
    case 'Sports':
      return Category.sports;
    case 'Studies':
      return Category.studies;
    case 'Transport':
      return Category.transport;
    case 'Events':
      return Category.events;
    case 'Lost & Found':
      return Category.lostFound;
    case 'Items':
      return Category.items;
    case 'Errands':
      return Category.errands;
    default:
      return Category.errands;
  }
}

String categoryToText(Category? category) {
  String? snippet = category?.toString().substring(9);
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
      return 'Lost & Found';
    case 'items':
      return 'Items';
    case 'errands':
      return 'Errands';
    default:
      return 'Misc';
  }
}

Image getCategoryImage(Category? category) {
  switch (category) {
    case Category.sports:
      return Image.asset('assets/images/sports.png');
    case Category.studies:
      return Image.asset('assets/images/make_teams.png');
    case Category.transport:
      return Image.asset('assets/images/transport.png');
    case Category.events:
      return Image.asset('assets/images/hackathon_event.png');
    case Category.lostFound:
      return Image.asset('assets/images/lost_and_found.png');
    case Category.items:
      return Image.asset('assets/images/exchange.png');
    case Category.errands:
      return Image.asset('assets/images/exchange.png');
    default:
      return Image.asset('assets/images/welcome.png');
  }
}
