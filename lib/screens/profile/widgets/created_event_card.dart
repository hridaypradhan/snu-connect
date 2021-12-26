import 'package:clipboard/clipboard.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../global/widgets/alert_popup.dart';
import '../../../models/event.dart';
import '../../../providers/event_provider.dart';
import '../../more_info/more_info_screen.dart';

class CreatedEventCard extends StatelessWidget {
  final Event event;
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  CreatedEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<EventProvider>(context);
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      front: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onLongPress: () => cardKey.currentState?.toggleCard(),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MoreInfoScreen(
                    event: event,
                  );
                },
              ),
            );
          },
          child: Card(
            elevation: 5.0,
            color: Colors.orange[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  event.name.toString(),
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  DateFormat.MMMEd().format(event.dateTime),
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  DateFormat.jm().format(event.dateTime),
                  style: const TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
      ),
      back: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          elevation: 5.0,
          color: Colors.orange[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.orange,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      FlutterClipboard.copy(event.code.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        alertPopup('EVENT CODE COPIED'),
                      );
                    },
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              CircleAvatar(
                backgroundColor: Colors.orange,
                child: Center(
                  child: IconButton(
                    onPressed: () => cardKey.currentState?.toggleCard(),
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              CircleAvatar(
                backgroundColor: Colors.orange,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      eventProvider.deleteEvent(event);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
