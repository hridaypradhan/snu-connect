import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:snu_connect/models/user.dart';
import 'package:snu_connect/screens/all_chats/widgets/conversation_thread.dart';

List<User> dummyUsers = [
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
  User(
    name: 'Shraddha',
    email: 'sa350',
    phone: '123456789',
  ),
];

class AllChatsScreen extends StatelessWidget {
  AllChatsScreen({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();
  static const String id = 'all_chats';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chats',
            style: TextStyle(
              fontSize: 47,
              fontWeight: FontWeight.bold,
            ),
          ),
          AnimSearchBar(
            width: 400,
            textController: textController,
            onSuffixTap: () {},
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dummyUsers.length,
              itemBuilder: (context, index) => ConversationThread(
                otherUser: dummyUsers[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
