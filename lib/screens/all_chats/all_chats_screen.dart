import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:provider/provider.dart';
import '../../models/end_user.dart';
import '../../providers/all_chats_provider.dart';
import 'widgets/conversation_thread.dart';

class AllChatsScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String id = 'all_chats';

  AllChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allChatsProvider = Provider.of<AllChatsProvider>(context);
    textController.addListener(
      () {
        allChatsProvider.filterList(textController.text);
      },
    );
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          const Text(
            'Chats',
            style: TextStyle(
              fontSize: 47,
              fontWeight: FontWeight.bold,
            ),
          ),
          AnimSearchBar(
            autoFocus: true,
            width: 400,
            textController: textController,
            onSubmitted: (s) {},
            onSuffixTap: () {
              textController.clear();
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _firestore
                  .collection('users')
                  .doc(_auth.currentUser?.email)
                  .collection('chats')
                  .orderBy('unread')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No chats yet!'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) => snapshot.data!.docs[index]
                            .data()['name']
                            .toString()
                            .toLowerCase()
                            .startsWith(textController.text.toLowerCase())
                        ? ConversationThread(
                            otherUser: EndUser.fromMap(
                              snapshot.data!.docs[index].data(),
                            ),
                            unread: snapshot.data!.docs[index].data()['unread'],
                          )
                        : Container(),
                  );
                } else {
                  return const Center(
                    child: Text('No chats yet!'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
