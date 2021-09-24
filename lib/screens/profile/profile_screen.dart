import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/providers/event_provider.dart';
import 'package:snu_connect/screens/profile/widgets/profile_tab.dart';
import 'package:snu_connect/screens/profile/widgets/registered_event_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var eventProvider = Provider.of<EventProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Image.asset('assets/images/name.png'),
          Image.asset('assets/images/profile_logo.png'),
          Text(
            'Shraddha Arora',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ignore: prefer_const_constructors
            Text(
              'sa350@snu.edu.in | 9911211379',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ]),

          // snu connect text
          // logo
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
              tabs: const [
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
          Expanded(
            child: TabBarView(
              children: [
                GridView.count(
                  childAspectRatio: 1.7,
                  crossAxisCount: 2,
                  children: List.generate(
                    eventProvider.dummyEvents.length,
                    (index) => RegisteredEventCard(
                      event: eventProvider.dummyEvents[index],
                    ),
                  ),
                ),
                GridView.count(
                  childAspectRatio: 1.7,
                  crossAxisCount: 2,
                  children: List.generate(
                    eventProvider.dummyEvents.length,
                    (index) => RegisteredEventCard(
                      event: eventProvider.dummyEvents[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
