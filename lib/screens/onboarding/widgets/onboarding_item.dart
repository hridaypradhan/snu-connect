import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String text, imagePath;
  final bool leftText;

  const OnboardingItem({
    Key? key,
    required this.text,
    required this.imagePath,
    this.leftText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Flexible image = Flexible(
      child: Image.asset(imagePath),
    );

    return Container(
      margin: EdgeInsets.only(
        bottom: size.height * 0.03,
        left: size.height * 0.05,
        right: size.height * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!leftText) image,
          if (!leftText) SizedBox(width: size.width * 0.05),
          Flexible(
            child: Text(
              text,
              textAlign: leftText ? TextAlign.right : TextAlign.left,
              style: const TextStyle(
                fontSize: 19.0,
              ),
            ),
          ),
          if (leftText) SizedBox(width: size.width * 0.05),
          if (leftText) image,
        ],
      ),
    );
  }
}
