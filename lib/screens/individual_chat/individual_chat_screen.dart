import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:bubble/bubble.dart';
import 'package:snu_connect/models/message.dart';

//TODO remove this
String myemail = "km224";

class IndividualChatScreen extends StatelessWidget {
  static const id = 'individual_chat';
  IndividualChatScreen({Key? key}) : super(key: key);

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: dummyMessages.length,
                        itemBuilder: (context, index) {
                          bool isMe =
                              dummyMessages[index].senderEmail == myemail;
                          return Bubble(
                            style: BubbleStyle(
                              nip:
                                  isMe ? BubbleNip.rightTop : BubbleNip.leftTop,
                              color: isMe ? Colors.white : primaryPink,
                              borderColor: isMe ? primaryPink : Colors.white,
                              borderWidth: 2,
                              elevation: 4,
                              margin: BubbleEdges.only(
                                top: 8,
                                right: isMe ? 8 : 35,
                                left: isMe ? 35 : 8,
                                bottom: 8,
                              ),
                              padding: const BubbleEdges.all(8.0),
                              alignment:
                                  isMe ? Alignment.topRight : Alignment.topLeft,
                            ),
                            child: Text(
                              dummyMessages[index].text,
                              style: TextStyle(
                                  color: isMe ? Colors.black : Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Type something ...",
                        hintStyle: const TextStyle(color: primaryPink),
                        fillColor: Colors.pinkAccent,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 3.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
