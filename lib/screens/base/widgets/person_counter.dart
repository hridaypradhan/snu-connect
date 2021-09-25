import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/providers/event_provider.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<EventProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onLongPress: () async {
            eventProvider.pressButton();
            do {
              eventProvider.changePeopleCount(-1);
              await Future.delayed(
                const Duration(milliseconds: 200),
              );
            } while (eventProvider.buttonIsPressed);
          },
          onLongPressEnd: (details) => eventProvider.unpressButton(),
          onTap: () {
            eventProvider.changePeopleCount(-1);
          },
          child: CircleAvatar(
            radius: 26.0,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.pink[300],
              child: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.pink[300],
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 105.0,
          width: 105.0,
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              '${eventProvider.peopleCount}',
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        GestureDetector(
          onLongPress: () async {
            eventProvider.pressButton();
            do {
              eventProvider.changePeopleCount(1);
              await Future.delayed(
                const Duration(milliseconds: 200),
              );
            } while (eventProvider.buttonIsPressed);
          },
          onLongPressEnd: (details) => eventProvider.unpressButton(),
          onTap: () {
            eventProvider.changePeopleCount(1);
          },
          child: CircleAvatar(
            radius: 26.0,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.pink[300],
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
