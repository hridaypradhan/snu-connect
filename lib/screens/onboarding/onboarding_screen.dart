import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:snu_connect/constants/colors.dart';
import 'package:snu_connect/global/widgets/text_logo.dart';
import 'package:snu_connect/screens/login/login_screen.dart';
import 'package:snu_connect/screens/onboarding/widgets/get_started_button.dart';
import 'package:snu_connect/screens/onboarding/widgets/onboarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  static const String id = 'onboarding_screen';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: IntroductionScreen(
        color: primaryPink,
        dotsDecorator: const DotsDecorator(
          activeColor: primaryPink,
        ),
        rawPages: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/welcome.png'),
                const Text(
                  'to snu connect.',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 20.0),
                child: const TextLogo(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  OnboardingItem(
                    text: 'register for events with a single swipe',
                    imagePath: 'assets/images/register_for_events.png',
                  ),
                  OnboardingItem(
                    text: 'make teams for events, competitions and more',
                    imagePath: 'assets/images/make_teams.png',
                    leftText: false,
                  ),
                  OnboardingItem(
                    text: 'find someone to play, carpool, or run errands with',
                    imagePath: 'assets/images/find_someone.png',
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 20.0),
                child: const TextLogo(),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/login.png'),
                    const SizedBox(height: 20.0),
                    const Text(
                      'login with just your snu id and password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const GetStartedButton(),
                  ],
                ),
              ),
            ],
          ),
        ],
        showDoneButton: false,
        onSkip: () => Navigator.pushReplacementNamed(
          context,
          LoginScreen.id,
        ),
        showSkipButton: true,
        skip: TextButton(
          child: const Text(
            'Skip',
            style: TextStyle(
              color: primaryPink,
            ),
          ),
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            LoginScreen.id,
          ),
        ),
        next: const Icon(
          Icons.chevron_right,
          size: 40.0,
        ),
      ),
    );
  }
}
