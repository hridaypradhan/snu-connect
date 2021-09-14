import 'package:flutter/material.dart';
import 'package:snu_connect/constants/colors.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryPink),
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'snu',
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(width: 10.0),
          Icon(
            Icons.link,
            color: primaryPink,
          ),
          SizedBox(width: 10.0),
          Text(
            'connect',
            style: TextStyle(fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
