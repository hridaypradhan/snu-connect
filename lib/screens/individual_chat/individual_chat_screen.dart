import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/end_user.dart';
import 'package:snu_connect/models/message.dart';
import 'package:snu_connect/screens/individual_chat/widgets/message_bubble.dart';

// TODO Add back button that pops

class IndividualChatScreen extends StatefulWidget {
  static const id = 'individual_chat';
  final EndUser otherUser;
  const IndividualChatScreen({
    Key? key,
    required this.otherUser,
  }) : super(key: key);

  @override
  State<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  final ScrollController _controller = ScrollController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController? _textController;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => _controller.jumpTo(_controller.position.maxScrollExtent),
    );
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
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
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //     widget.otherUser.photoUrl ?? '',
                  //   ),
                  //   radius: size.width * 0.05,
                  // ),
                  // SizedBox(width: size.width * 0.02),
                  Text(
                    '${widget.otherUser.name}',
                    style: TextStyle(fontSize: size.width * 0.06),
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
                  color: lightRed,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  reverse: true,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: _firestore
                        .collection('chats')
                        .doc(_auth.currentUser?.email)
                        .collection(widget.otherUser.email.toString())
                        .orderBy('timestamp')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          controller: _controller,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            bool isMe = snapshot.data!.docs[index]
                                    .data()['senderEmail'] ==
                                _auth.currentUser?.email;
                            return MessageBubble(
                              isMe: isMe,
                              message: Message.fromMap(
                                snapshot.data!.docs[index].data(),
                              ),
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
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
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: (string) {},
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Type a message",
                  hintStyle: const TextStyle(color: primaryPink),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightRed,
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
                    onPressed: () async {
                      if (_textController!.text.isNotEmpty) {
                        var toSend = Message(
                          senderEmail: _auth.currentUser?.email ?? '',
                          text: _textController!.text,
                          timestamp: DateTime.now(),
                        );
                        _firestore
                            .collection('chats')
                            .doc(_auth.currentUser?.email)
                            .collection(widget.otherUser.email.toString())
                            .add(
                              toSend.toMap(),
                            );
                        _firestore
                            .collection('chats')
                            .doc(widget.otherUser.email)
                            .collection(_auth.currentUser?.email ?? '')
                            .add(
                              toSend.toMap(),
                            );
                        _textController?.clear();
                      }
                    },
                  ),
                ),
                controller: _textController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}