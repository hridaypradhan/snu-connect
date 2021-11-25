import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/providers/base_provider.dart';
import 'package:snu_connect/providers/event_provider.dart';
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
    var eventProvider = Provider.of<EventProvider>(context);
    var baseProvider = Provider.of<BaseProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: FilterListWidget<Category>(
          selectedListData: eventProvider.selectedCategoryFilters,
          searchFieldHintText: "Event code",
          listData: _categories,
          hideHeaderText: true,
          selectedItemsText: 'selected categories',
          applyButonTextBackgroundColor: primaryPink,
          onApplyButtonClick: (list) {
            if (list != null) {
              if (eventProvider.searchBoxText!.isEmpty) {
                eventProvider.setCategoryFilters(list);
                if (list.isNotEmpty) {
                  eventProvider.filterEvents(list);
                  baseProvider.changePage(0);
                }
              } else {
                eventProvider.searchEvents(eventProvider.searchBoxText);
                eventProvider.setSearchBoxText("");
                baseProvider.changePage(0);
              }
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
            eventProvider.setSearchBoxText(text);
            //eventProvider.searchEvents(text);
            //baseProvider.changePage(0);

            return [];
          },
        ),
      ),
    );
  }
}
