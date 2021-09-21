import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/providers/event_provider.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var eventProvider = Provider.of<EventProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: lightPink,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            width: size.width * 0.35,
            child: Center(
              child: Text(
                eventProvider.selectedDateTime?.day == null
                    ? 'Date'
                    : '${eventProvider.selectedDateTime?.day}',
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: lightPink,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          width: size.width * 0.35,
          child: Center(
            child: Text(
              eventProvider.selectedDateTime?.day == null
                  ? 'Time'
                  : '${eventProvider.selectedDateTime?.minute}',
            ),
          ),
        ),
      ],
    );
  }
}
