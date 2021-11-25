import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/widgets/alert_popup.dart';
import 'package:snu_connect/global/widgets/large_button.dart';
import 'package:snu_connect/screens/base/base_screen.dart';
import 'package:snu_connect/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  bool loadingSpinner = false;
  @override
  Widget build(BuildContext context) {
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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'icon',
                    child: Image.asset('assets/images/logo_name.png'),
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 500),
                    child: LargeButton(
                      text: 'GET STARTED',
                      onPressed: () async {
                        setState(
                          () {
                            loadingSpinner = true;
                          },
                        );
                        await _authService.signInWithGoogle(
                          () {
                            setState(
                              () {
                                loadingSpinner = false;
                              },
                            );
                          },
                        ).then(
                          (loggedInUser) {
                            String? email = loggedInUser.user?.email;
                            if (email != null &&
                                !email.endsWith('@snu.edu.in')) {
                              _authService.signOut();
                              ScaffoldMessenger.of(context).showSnackBar(
                                alertPopup('USE AN SNU ID'),
                              );
                            } else {
                              _authService.writeUserData();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                BaseScreen.id,
                                (route) => false,
                              );
                            }
                          },
                        );
                        setState(
                          () {
                            loadingSpinner = false;
                          },
                        );
                      },
                    ),
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      color: loadingSpinner ? primaryPink : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
