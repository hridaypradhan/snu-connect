import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/widgets/event_card.dart';
import 'package:snu_connect/providers/event_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      body: ListView(
        children: List.generate(
          eventProvider.dummyEvents.length,
          (index) => EventCard(event: eventProvider.dummyEvents[index]),
        ),
      ),
    );
  }
}
