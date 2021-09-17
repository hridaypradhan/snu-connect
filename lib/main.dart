import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/constants/colors.dart';
import 'package:snu_connect/providers/base_provider.dart';
import 'package:snu_connect/screens/base/base_screen.dart';
import 'package:snu_connect/screens/login/login_screen.dart';
import 'package:snu_connect/screens/onboarding/onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BaseProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.spartanTextTheme(),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: primaryPink,
          ),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
        ),
        // Initial route should depend on login status
        initialRoute: OnboardingScreen.id,
        routes: {
          OnboardingScreen.id: (context) => const OnboardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          BaseScreen.id: (context) => const BaseScreen(),
        },
      ),
    );
  }
}
