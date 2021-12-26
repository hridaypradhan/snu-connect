import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global/constants/colors.dart';
import '../../../global/constants/enums.dart';
import '../../../providers/event_provider.dart';

class CategoryCard extends StatelessWidget {
  final Category? category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var eventProvider = Provider.of<EventProvider>(context);
    return GestureDetector(
      onTap: () {
        eventProvider.pickCategory(category);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0,
        ),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
          color: getCategoryColor(category),
        ),
        width: size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: getCategoryImage(category),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryToText(category),
                ),
                Icon(
                  eventProvider.selectedCategory == category
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
