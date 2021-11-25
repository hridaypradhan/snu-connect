import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/constants/enums.dart';

class CategoryFilter extends StatelessWidget {
  final Category? category;
  final bool? isSelected;
  const CategoryFilter({
    Key? key,
    required this.category,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
      width: size.width * 0.46,
      height: size.width * 0.4,
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
                isSelected!
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
