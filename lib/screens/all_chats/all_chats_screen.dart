import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/providers/all_chats_provider.dart';
import 'package:snu_connect/screens/all_chats/widgets/conversation_thread.dart';

class AllChatsScreen extends StatelessWidget {
  AllChatsScreen({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();

  static const String id = 'all_chats';

  @override
  Widget build(BuildContext context) {
    var allChatsProvider = Provider.of<AllChatsProvider>(context);
    textController.addListener(
      () {
        allChatsProvider.filterList(textController.text);
      },
    );
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
            onSuffixTap: () {
              textController.clear();
            },
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: allChatsProvider.filteredList.length,
              itemBuilder: (context, index) => ConversationThread(
                otherUser: allChatsProvider.filteredList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
