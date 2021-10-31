import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              tabs: const [
                Expanded(
                  child: ProfileTab(
                    label: 'REGISTERED',
                    icon: Icon(Icons.app_registration, size: 20.0),
                  ),
                ),
                Expanded(
                  child: ProfileTab(
                    label: 'CREATED',
                    icon: Icon(Icons.create, size: 20.0),
                  ),
                )
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
