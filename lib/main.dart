import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/providers/all_chats_provider.dart';
import 'package:snu_connect/providers/base_provider.dart';
import 'package:snu_connect/providers/event_provider.dart';
import 'package:snu_connect/screens/base/base_screen.dart';
import 'package:snu_connect/screens/individual_chat/individual_chat_screen.dart';
import 'package:snu_connect/screens/login/login_screen.dart';
import 'package:snu_connect/screens/onboarding/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => BaseProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => EventProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => AllChatsProvider(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(secondary: primaryPink),
                textTheme: GoogleFonts.spartanTextTheme(),
                textSelectionTheme:
                    const TextSelectionThemeData(cursorColor: primaryPink),
                bottomSheetTheme: const BottomSheetThemeData(
                  backgroundColor: Colors.transparent,
                ),
              ),
              home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const BaseScreen();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Scaffold(
                      body: Center(
                        // TODO Change to login image
                        child: CircularProgressIndicator(
                          color: primaryPink,
                        ),
                      ),
                    );
                  }
                  return const OnboardingScreen();
                },
              ),
              routes: {
                OnboardingScreen.id: (context) => const OnboardingScreen(),
                LoginScreen.id: (context) => const LoginScreen(),
                BaseScreen.id: (context) => const BaseScreen(),
                IndividualChatScreen.id: (context) =>
                    const IndividualChatScreen(),
              },
            ),
          );
        }
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text(snapshot.hasError ? 'Error.' : 'Initializing...'),
            ),
          ),
        );
      },
    );
  }
}
