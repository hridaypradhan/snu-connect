// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:snu_connect/models/user.dart';

// class UserInfo {
//   final String? name;
//   final String? avatar;
//   UserInfo({this.name, this.avatar});
// }

// class SearchScreen extends StatelessWidget {
//   SearchScreen({Key? key}) : super(key: key);
//   List<UserInfo> userList = [
//     UserInfo(name: "Jon", avatar: ""),
//     UserInfo(name: "Ethel ", avatar: ""),
//     UserInfo(name: "Elyse ", avatar: ""),
//     UserInfo(name: "Nail  ", avatar: ""),
//     UserInfo(name: "Valarie ", avatar: ""),
//     UserInfo(name: "Lindsey ", avatar: ""),
//     UserInfo(name: "Emelyan ", avatar: ""),
//     UserInfo(name: "Carolina ", avatar: ""),
//     UserInfo(name: "Catherine ", avatar: ""),
//     UserInfo(name: "Stepanida  ", avatar: ""),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Filter List Widget Example "),
//       ),
//       body: SafeArea(
//         child: FilterListWidget<UserInfo>(
//           listData: userList,
//           hideHeaderText: true,
//           onApplyButtonClick: (list) {
//             if (list != null) {
//               print("Selected items count: ${list!.length}");
//             }
//           },
//           label: (item) {
//             /// Used to print text on chip
//             return item!.name;
//           },
//           validateSelectedItem: (list, val) {
//             ///  identify if item is selected or not
//             return list!.contains(val);
//           },
//           onItemSearch: (list, text) {
//             /// When text change in search text field then return list containing that text value
//             ///
//             ///Check if list has value which matchs to text
//             if (list!.any((element) =>
//                 element.name.toLowerCase().contains(text.toLowerCase()))) {
//               /// return list which contains matches
//               return list!
//                   .where((element) =>
//                       element.name.toLowerCase().contains(text.toLowerCase()))
//                   .toList();
//             }
//             else{
//               return [];
//             }
//           },
//         ),
//       ),
//     );
//   }
// }