import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/end_user.dart';
import 'package:snu_connect/providers/event_provider.dart';
import 'package:snu_connect/screens/onboarding/onboarding_screen.dart';
import 'package:snu_connect/screens/profile/widgets/profile_tab.dart';
import 'package:snu_connect/screens/profile/widgets/registered_event_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EndUser user = EndUser(
      name: 'Shraddha Arora',
      email: 'sa350@snu.edu.in',
      phone: '9911211379',
    );

    var eventProvider = Provider.of<EventProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          // Image.asset('assets/images/name.png'),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/profilelogo.png'),
              const CircleAvatar(
                radius: 35,
                //TODO fix logo, background image center
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/OIP.xzc47dQSt-cE3rX1BxxsNgHaFu?pid=ImgDet&rs=1"),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              Text(
                user.email + ' | ' + user.phone,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
OutlinedButton(
                child: const Text('Log Out'),
                style: OutlinedButton.styleFrom(primary: Colors.pink),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then(
                    (value) {
                      GoogleSignIn().disconnect();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        OnboardingScreen.id,
                        (route) => false,
                      );
                    },
                  );
                },
              ),
            ],
          ),
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
