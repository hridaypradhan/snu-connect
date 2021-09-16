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
      padding: const EdgeInsets.all(15.0),
      child: Image.asset(
        'assets/images/logo_name.png',
        height: 80.0,
      ),
    );
  }
}
