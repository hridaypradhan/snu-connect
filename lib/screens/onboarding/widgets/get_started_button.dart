import 'package:flutter/material.dart';
import 'package:snu_connect/constants/colors.dart';
import 'package:snu_connect/screens/login/login_screen.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () => Navigator.pushReplacementNamed(
        context,
        LoginScreen.id,
      ),
      splashColor: Colors.grey,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: primaryPink,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'GET STARTED',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
