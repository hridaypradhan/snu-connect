import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/screens/search/widgets/category_filter.dart';

class SearchScreen extends StatelessWidget {
  final List<Category> _categories = [
    Category.errands,
    Category.events,
    Category.items,
    Category.lostFound,
    Category.sports,
    Category.studies,
    Category.transport,
  ];
  static const id = 'search_screen';
  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FilterListWidget<Category>(
          searchFieldHintText: "Event code",
          listData: _categories,
          hideHeaderText: true,
          selectedItemsText: 'selected categories',
          applyButonTextBackgroundColor: primaryPink,
          onApplyButtonClick: (list) {
            if (list != null) {
              print("Selected items count: ${list.length}");
            }
          },
          choiceChipBuilder: (context, category, isSelected) => CategoryFilter(
            category: category,
            isSelected: isSelected,
          ),
          choiceChipLabel: (Category? category) {
            return categoryToText(category);
          },
          validateSelectedItem: (list, val) {
            return list!.contains(val);
          },
          onItemSearch: (list, text) {
            return [];
          },
        ),
      ),
    );
  }
}
