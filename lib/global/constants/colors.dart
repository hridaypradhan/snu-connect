import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/enums.dart';

const Color primaryPink = Color(0xfff2005d);
Color? lightPink = Colors.red[100];

Color getCategoryColor(Category? category) {
  switch (category) {
    case Category.sports:
      return const Color(0xfffffdf5);
    case Category.studies:
      return const Color(0xfff5f9ff);
    case Category.transport:
      return const Color(0xfffffbfb);
    case Category.events:
      return const Color(0xfff1ffff);
    case Category.lostFound:
      return const Color(0xfffcfff2);
    case Category.items:
      return const Color(0xfffff0fd);
    case Category.errands:
      return const Color(0xfffff5ed);
    default:
      return Colors.white;
  }
}

Color getCodeColor(Category? category) {
  switch (category) {
    case Category.sports:
      return const Color(0xffffefb9);
    case Category.studies:
      return const Color(0xff8dbdff);
    case Category.transport:
      return const Color(0xffffb3ce);
    case Category.events:
      return const Color(0xff87d7ff);
    case Category.lostFound:
      return const Color(0xffbcff87);
    case Category.items:
      return const Color(0xffec91ff);
    case Category.errands:
      return const Color(0xfff6c97b);
    default:
      return Colors.white;
  }
}

// Color getDarkerCodeColor(Category? category) {
//   // Update darker colors
//   switch (category) {
//     case Category.sports:
//       return const Color(0xffffefb9);
//     case Category.studies:
//       return const Color(0xff8dbdff);
//     case Category.transport:
//       return const Color(0xffffb3ce);
//     case Category.events:
//       return const Color(0xffbcff87);
//     case Category.lostFound:
//       return const Color(0xffeeffa8);
//     case Category.items:
//       return const Color(0xffec91ff);
//     case Category.errands:
//       return const Color(0xffffe2c8);
//     default:
//       return Colors.white;
//   }
// }
