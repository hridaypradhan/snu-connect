import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/end_user.dart';
import 'package:snu_connect/screens/individual_chat/individual_chat_screen.dart';

class ConversationThread extends StatefulWidget {
  final EndUser otherUser;
  const ConversationThread({
    Key? key,
    required this.otherUser,
  }) : super(key: key);

  @override
  State<ConversationThread> createState() => _ConversationThreadState();
}

class _ConversationThreadState extends State<ConversationThread>
    with SingleTickerProviderStateMixin {
  Animation<Color?>? animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.transparent,
      end: lightRed,
    ).animate(controller)
      ..addListener(
        () {
          setState(() {});
        },
      );
  }

  void animateColor() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animateColor();
        Future.delayed(
          const Duration(
            milliseconds: 450,
          ),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // TODO Individual chat screen should take the current user and build itself accordingly
                builder: (context) => IndividualChatScreen(
                  otherUser: widget.otherUser,
                ),
              ),
            );
          },
        ).then(
          (value) => controller.reset(),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: animation?.value,
          border: Border.all(color: primaryPink, width: 2),
          borderRadius: BorderRadius.circular(35),
        ),
        child: ListTile(
          leading: const CircleAvatar(),
          title: Text(widget.otherUser.name ?? 'Name'),
          subtitle: const Text('read this ...'),
          trailing: const Icon(
            Icons.circle,
            size: 15.0,
            color: primaryPink,
          ),
        ),
      ),
    );
  }
}
