import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/screens/base/widgets/category_card.dart';

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
          onApplyButtonClick: (list) {
            if (list != null) {
              print("Selected items count: ${list.length}");
            }
          },
          choiceChipBuilder: (context, category, isSelected) =>
              Expanded(child: CategoryCard(category: category)),
          choiceChipLabel: (Category? category) {
            return categoryToText(category);
          },
          validateSelectedItem: (list, val) {
            ///  identify if item is selected or not
            return list!.contains(val);
          },
          onItemSearch: (list, text) {
            /// When text change in search text field then return list containing that text value
            ///
            ///Check if list has value which matchs to text
            return [];
          },
        ),
      ),
    );
  }
}
