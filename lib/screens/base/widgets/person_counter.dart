import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
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
          onTap: () {
            eventProvider.changePeopleCount(-1);
          },
          child: const CircleAvatar(
            radius: 26.0,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: primaryPink,
              child: Icon(
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
            color: primaryPink,
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 70.0,
          width: 70.0,
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              '${eventProvider.peopleCount}',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        GestureDetector(
          onTap: () {
            eventProvider.changePeopleCount(1);
          },
          child: const CircleAvatar(
            radius: 26.0,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: primaryPink,
              child: Icon(
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
