import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/screens/profile/widgets/profile_tab.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.45),
          Container(
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: lightPink,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: primaryPink,
                width: 1.3,
              ),
            ),
            child: TabBar(
              unselectedLabelColor: Colors.pinkAccent[100],
              labelColor: primaryPink,
              indicatorColor: primaryPink,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2.5,
              labelPadding: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              tabs:const [
                ProfileTab(
                  label: 'REGISTERED',
                  icon: Icon(Icons.app_registration),
                ),
                ProfileTab(
                  label: 'CREATED',
                  icon: Icon(Icons.create),
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                Text('Hello'),
                Text('Hello 2'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
