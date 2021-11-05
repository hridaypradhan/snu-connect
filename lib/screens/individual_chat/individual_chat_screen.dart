import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/message.dart';
import 'package:snu_connect/screens/individual_chat/widgets/message_bubble.dart';

String myEmail = 'km224';
final List<Message> dummyMessages = [
  Message(
    text: '1',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '2',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '3',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '4',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '5',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '6',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '7',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '8',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '9',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '10',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '11',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '12',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '13',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '14',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '15',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '16',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '17',
    senderEmail: 'km224',
    timestamp: DateTime.now(),
  ),
  Message(
    text: '18',
    senderEmail: 'sa350',
    timestamp: DateTime.now(),
  ),
];

class IndividualChatScreen extends StatefulWidget {
  static const id = 'individual_chat';
  const IndividualChatScreen({Key? key}) : super(key: key);

  @override
  State<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => _controller.jumpTo(_controller.position.maxScrollExtent),
    );
    super.initState();
  }

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
                children: [
                  // TODO Add DP
                  Icon(
                    Icons.circle,
                    size: size.width * 0.1,
                    color: primaryPink,
                  ),
                  // TODO Add Name
                  Text(
                    'Friend',
                    style: TextStyle(fontSize: size.width * 0.07),
                  ),
                  SizedBox(width: size.width * 0.4),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(size.width * 0.04),
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                  color: lightPink,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  reverse: true,
                  child: ListView.builder(
                    controller: _controller,
                    shrinkWrap: true,
                    itemCount: dummyMessages.length,
                    itemBuilder: (context, index) {
                      // TODO Compare to user's email ID
                      bool isMe = dummyMessages[index].senderEmail == myEmail;
                      return MessageBubble(
                        isMe: isMe,
                        message: dummyMessages[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                15.0,
                0.0,
                15.0,
                15.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type a message",
                  hintStyle: const TextStyle(color: primaryPink),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: primaryPink,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: primaryPink,
                      width: 2.5,
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
