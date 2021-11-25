import 'package:bubble/bubble.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/widgets/alert_popup.dart';
import 'package:snu_connect/models/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.isMe,
    required this.message,
  }) : super(key: key);

  final bool isMe;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        FlutterClipboard.copy(message.text).then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
            alertPopup('MESSAGE COPIED'),
          ),
        );
      },
      child: Bubble(
        style: BubbleStyle(
          nip: isMe ? BubbleNip.rightTop : BubbleNip.leftTop,
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
          alignment: isMe ? Alignment.topRight : Alignment.topLeft,
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isMe ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
