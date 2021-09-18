import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/widgets/large_button.dart';
import 'package:snu_connect/screens/base/base_screen.dart';
import 'package:snu_connect/screens/login/widgets/email_field.dart';
import 'package:snu_connect/screens/login/widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  final TextEditingController _netIdController = TextEditingController(),
      _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizedBox division = SizedBox(height: size.height * 0.06);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: primaryPink,
              size: 40.0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'icon',
                  child: Image.asset('assets/images/logo_name.png'),
                ),
                division,
                EmailField(controller: _netIdController),
                division,
                PasswordField(controller: _passwordController),
                division,
                LargeButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      BaseScreen.id,
                      (route) => false,
                    );
                  },
                  text: 'LOG IN',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
