import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/user.dart';

class ConversationThread extends StatelessWidget {
  final User otherUser;
  const ConversationThread({
    Key? key,
    required this.otherUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: primaryPink, width: 2),
        borderRadius: BorderRadius.circular(35),
      ),
      child: ListTile(
        leading: const CircleAvatar(),
        title: Text(otherUser.name),
        subtitle: const Text('read this ...'),
        trailing: const Icon(
          Icons.circle,
          size: 15.0,
          color: primaryPink,
        ),
      ),
    );
  }
}
