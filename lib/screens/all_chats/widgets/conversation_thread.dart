import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/user.dart';

class ConversationThread extends StatefulWidget {
  final User otherUser;
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

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.transparent, end: lightPink)
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  void animateColor() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {animateColor()},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: animation?.value,
          border: Border.all(color: primaryPink, width: 2),
          borderRadius: BorderRadius.circular(35),
        ),
        child: ListTile(
          leading: const CircleAvatar(),
          title: Text(widget.otherUser.name),
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
