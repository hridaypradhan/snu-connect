import 'package:bottom_sheet_expandable_bar/bottom_sheet_bar_icon.dart';
import 'package:bottom_sheet_expandable_bar/bottom_sheet_expandable_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/providers/base_provider.dart';
import 'package:snu_connect/screens/base/widgets/create_event_form.dart';
import 'package:snu_connect/screens/onboarding/onboarding_screen.dart';

class BaseScreen extends StatefulWidget {
  static const String id = 'base_screen';
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var baseProvider = Provider.of<BaseProvider>(context);
    return SafeArea(
      child: Scaffold(
        // TODO Remove drawer
        // drawer: Drawer(
        //   child: TextButton(
        //     onPressed: () {
        //       FirebaseAuth.instance.signOut().then(
        //         (value) {
        //           GoogleSignIn().disconnect();
        //           Navigator.pushNamedAndRemoveUntil(
        //             context,
        //             OnboardingScreen.id,
        //             (route) => false,
        //           );
        //         },
        //       );
        //     },
        //     child: const Text('Log Out :('),
        //   ),
        // ),
        extendBody: true,
        bottomNavigationBar: BottomBarSheet(
          bottomSheetHeight: size.height,
          currentIndex: baseProvider.currentPage,
          bottomBarHeight: 70.0,
          backgroundColor: lightPink,
          backgroundBarColor: lightPink,
          iconExpand: const Icon(
            Icons.add,
            size: 40.0,
          ),
          iconColor: primaryPink,
          buttonPosition: ButtonBottomBarPosition.end,
          innerChild: const CreateEventForm(),
          children: [
            BottomSheetBarIcon(
              icon: const Icon(Icons.home),
              color: primaryPink,
              onTap: () {
                baseProvider.changePage(0);
              },
            ),
            BottomSheetBarIcon(
              icon: const Icon(Icons.search),
              color: primaryPink,
              onTap: () {
                baseProvider.changePage(1);
              },
            ),
            BottomSheetBarIcon(
              icon: const Icon(Icons.chat),
              color: primaryPink,
              onTap: () {
                baseProvider.changePage(2);
              },
            ),
            BottomSheetBarIcon(
              icon: const Icon(Icons.person),
              color: primaryPink,
              onTap: () {
                baseProvider.changePage(3);
              },
            ),
          ],
        ),
        body: baseProvider.getPage,
      ),
    );
  }
}
