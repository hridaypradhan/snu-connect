import 'package:flutter/material.dart';
import 'package:snu_connect/constants/colors.dart';

class TextLogo extends StatelessWidget {
  final double? height;
  const TextLogo({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryPink),
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Image.asset(
        'assets/images/logo_name.png',
        height: height,
      ),
    );
  }
}
