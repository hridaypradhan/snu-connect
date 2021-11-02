import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/message.dart';
import 'package:snu_connect/screens/individual_chat/widgets/message_bubble.dart';

String myEmail = 'km224';
final List<Message> dummyMessages = [
  Message(
    text: 'Hi hello much greetings to you my fellow person',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
      text: 'Bye dear detestable human xyzabc asdjhfljf;asd;',
      senderEmail: 'sa350',
      timestamp: DateTime.now()),
  Message(
      text: 'Ok mother kill me then',
      senderEmail: 'km224',
      timestamp: DateTime.now()),
  Message(
    text: 'Hmm',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: 'No',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: 'Why no?',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
      text: 'Ok mother kill me then',
      senderEmail: 'km224',
      timestamp: DateTime.now()),
  Message(
    text: 'Hmm',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: 'No',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: 'Why no?',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
      text: 'Ok mother kill me then',
      senderEmail: 'km224',
      timestamp: DateTime.now()),
  Message(
    text: 'Hmm',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: 'No',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: 'Why no?',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
      text: 'Ok mother kill me then',
      senderEmail: 'km224',
      timestamp: DateTime.now()),
  Message(
    text: 'Hmm',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: 'No',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: 'Why no?',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
];

class IndividualChatScreen extends StatelessWidget {
  static const id = 'individual_chat';
  const IndividualChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                15.0,
                15.0,
                15.0,
                0,
              ),
              child: Row(
                children: const [
                  // TODO Add DP
                  Icon(
                    Icons.circle,
                    size: 55,
                    color: primaryPink,
                  ),
                  // TODO Add Name
                  Text(
                    'Friend',
                    style: TextStyle(fontSize: 40),
                  ),
                  // TODO Make size dependent
                  SizedBox(width: 150),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: lightPink,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        dragStartBehavior: DragStartBehavior.down,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: dummyMessages.length,
                        itemBuilder: (context, index) {
                          // TODO Compare to user's email ID
                          bool isMe =
                              dummyMessages[index].senderEmail == myEmail;
                          return MessageBubble(
                            isMe: isMe,
                            message: dummyMessages[index],
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          hintStyle: const TextStyle(color: primaryPink),
                          fillColor: Colors.pinkAccent,
                          hoverColor: Colors.white,
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 3.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 3.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: primaryPink,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
