import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:bubble/bubble.dart';
import 'package:snu_connect/models/message.dart';

//TODO remove this
String myemail = "km224";

class IndividualChatScreen extends StatelessWidget {
  static const id = 'individual_chat';
  IndividualChatScreen({Key? key}) : super(key: key);

  List<Message> dummyMessages = [
    Message(text: 'Hi', senderEmail: 'km224', timestamp: DateTime.now()),
    Message(text: 'Bye', senderEmail: 'sa350', timestamp: DateTime.now()),
    Message(text: 'Ok', senderEmail: 'km224', timestamp: DateTime.now()),
    Message(text: 'Hmm', senderEmail: 'sa350', timestamp: DateTime.now()),
    Message(text: 'No', senderEmail: 'km224', timestamp: DateTime.now()),
    Message(text: 'Why no?', senderEmail: 'sa350', timestamp: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.circle,
                    size: 55,
                    color: primaryPink,
                  ),
                  Text(
                    'Friend',
                    style: TextStyle(fontSize: 41),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: lightPink,
                ),
                margin: const EdgeInsets.all(10.0),
                width: size.width * 0.99,
                height: size.height * 0.80,
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: dummyMessages.length,
                        itemBuilder: (context, index) {
                          bool isMe =
                              dummyMessages[index].senderEmail == myemail;
                          return Bubble(
                            style: BubbleStyle(
                              nip: isMe
                                  ? BubbleNip.rightCenter
                                  : BubbleNip.leftCenter,
                              color: isMe ? Colors.white : primaryPink,
                              borderColor: isMe ? primaryPink : Colors.white,
                              borderWidth: 2,
                              elevation: 4,
                              margin: const BubbleEdges.only(
                                top: 8,
                                right: 8,
                                left: 8,
                              ),
                              alignment:
                                  isMe ? Alignment.topRight : Alignment.topLeft,
                            ),
                            child: Text(dummyMessages[index].text),
                          );
                        }),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Type something ...",
                      hintStyle: TextStyle(color: primaryPink),
                      fillColor: Colors.pinkAccent,
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.send), onPressed: () {}),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
