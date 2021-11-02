import 'package:bottom_sheet_expandable_bar/bottom_sheet_bar_icon.dart';
import 'package:bottom_sheet_expandable_bar/bottom_sheet_expandable_bar.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/providers/base_provider.dart';
import 'package:snu_connect/screens/base/widgets/create_event_form.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
              List<String> countList = [
    "Sports",
    "Studies",
    "Transport",
    "Events",
    "Lost & Found",
    "Items",
    "Errands",
    "Misc",
  ];
  List<String>? selectedCountList = [];
            await FilterListDialog.display<String>(
      context,
      listData: countList,
      selectedListData: selectedCountList,
      height: 480,
      selectedTextBackgroundColor: primaryPink,
      applyButonTextBackgroundColor: primaryPink,
      
      headlineText: "Select Categories to Filter",
      searchFieldHintText: "Search for Event Codes",
      choiceChipLabel: (item) {
        return item;
      },
      validateSelectedItem: (list, val) {
          return list!.contains(val);
      },
      onItemSearch: (list, text) {
          if (list!.any((element) =>
              element.toLowerCase().contains(text.toLowerCase()))) {
            return list!
                .where((element) =>
                    element.toLowerCase().contains(text.toLowerCase()))
                .toList();
          }
          else{
            return [];
          }
        },
      onApplyButtonClick: (list) {
        if (list != null) {
          setState(() {
            selectedCountList = List.from(list);
          });
        }
        Navigator.pop(context);
      }); 
          },
        ),
        
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
