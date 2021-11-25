import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/widgets/text_logo.dart';
import 'package:snu_connect/screens/login/login_screen.dart';
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
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 15.0),
                child: const TextLogo(height: 80.0),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DelayedDisplay(
                      child: Image.asset('assets/images/welcome.png'),
                    ),
                    const DelayedDisplay(
                      delay: Duration(milliseconds: 1),
                      child: Text(
                        'to snu connect.',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 15.0),
                child: const TextLogo(height: 80.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 40.0),
                  DelayedDisplay(
                    child: OnboardingItem(
                      text: 'register for events with a single swipe',
                      imagePath: 'assets/images/register_for_events.png',
                    ),
                  ),
                  DelayedDisplay(
                    delay: Duration(seconds: 1),
                    child: OnboardingItem(
                      text: 'make teams for events, competitions and more',
                      imagePath: 'assets/images/make_teams.png',
                      leftText: false,
                    ),
                  ),
                  DelayedDisplay(
                    delay: Duration(seconds: 2),
                    child: OnboardingItem(
                      text:
                          'find someone to play, carpool, or run errands with',
                      imagePath: 'assets/images/find_someone.png',
                    ),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 15.0),
                child: const Hero(
                  child: TextLogo(height: 80.0),
                  tag: 'icon',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/login.png'),
                    const SizedBox(height: 50.0),
                    const Text(
                      'login with just your snu id and password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        next: const Icon(
          Icons.chevron_right,
          size: 40.0,
        ),
        showSkipButton: true,
        skip: TextButton(
          child: const Text(
            'Skip',
            style: TextStyle(
              color: primaryPink,
            ),
          ),
          onPressed: () => Navigator.pushNamed(
            context,
            LoginScreen.id,
          ),
        ),
        onDone: () => Navigator.pushNamed(
          context,
          LoginScreen.id,
        ),
        done: const Text(
          "Let's Go",
          style: TextStyle(
            color: primaryPink,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
