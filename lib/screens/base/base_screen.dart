import 'package:bottom_sheet_expandable_bar/bottom_sheet_bar_icon.dart';
import 'package:bottom_sheet_expandable_bar/bottom_sheet_expandable_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/constants/colors.dart';
import 'package:snu_connect/providers/base_provider.dart';

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
    var baseProvider = Provider.of<BaseProvider>(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomBarSheet(
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
              icon: const Icon(Icons.person),
              color: primaryPink,
              onTap: () {
                baseProvider.changePage(2);
              },
            ),
          ],
        ),
        body: baseProvider.getPage,
      ),
    );
  }
}
