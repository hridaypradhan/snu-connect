import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/providers/base_provider.dart';
import 'package:snu_connect/providers/event_provider.dart';
import 'package:snu_connect/screens/all_chats/all_chats_screen.dart';
import 'package:snu_connect/screens/base/base_screen.dart';
import 'package:snu_connect/screens/login/login_screen.dart';
import 'package:snu_connect/screens/onboarding/onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: primaryPink),
          textTheme: GoogleFonts.spartanTextTheme(),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: primaryPink),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
        ),
        // Initial route should depend on login status
        initialRoute: BaseScreen.id,
        routes: {
          OnboardingScreen.id: (context) => const OnboardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          BaseScreen.id: (context) => const BaseScreen(),
          AllChatsScreen.id: (context) => AllChatsScreen(),
        },
      ),
    );
  }
}
