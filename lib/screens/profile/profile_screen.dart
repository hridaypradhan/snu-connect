import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/screens/onboarding/onboarding_screen.dart';
import 'package:snu_connect/screens/profile/widgets/created_event_card.dart';
import 'package:snu_connect/screens/profile/widgets/profile_tab.dart';
import 'package:snu_connect/screens/profile/widgets/registered_event_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/profilelogo1.png',
                height: 150,
                width: 150,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  _auth.currentUser?.photoURL ??
                      "https://th.bing.com/th/id/OIP.xzc47dQSt-cE3rX1BxxsNgHaFu?pid=ImgDet&rs=1",
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _auth.currentUser?.displayName ?? 'SNU Student',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            _auth.currentUser?.email ?? 'ab123@snu.edu.in',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
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
          Container(
            margin: const EdgeInsets.all(10.0),
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
                  icon: Icon(
                    Icons.app_registration,
                    size: 20.0,
                  ),
                ),
                ProfileTab(
                  label: 'CREATED',
                  icon: Icon(
                    Icons.create,
                    size: 20.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _firestore
                      .collection('users')
                      .doc(_auth.currentUser?.email)
                      .collection('registered')
                      .orderBy('dateTime')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          'You haven\'t registered for any events. \nJoin one now!',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return GridView.count(
                      childAspectRatio: 1.7,
                      crossAxisCount: 2,
                      children: List.generate(
                        snapshot.data!.docs.length,
                        (index) => RegisteredEventCard(
                          event: Event.fromMap(
                            snapshot.data!.docs[index].data(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _firestore
                      .collection('users')
                      .doc(_auth.currentUser?.email)
                      .collection('created')
                      .orderBy('dateTime')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          'You don\'t have any events. \nCreate one now!',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return GridView.count(
                      childAspectRatio: 1.7,
                      crossAxisCount: 2,
                      children: List.generate(
                        snapshot.data!.docs.length,
                        (index) => CreatedEventCard(
                          event: Event.fromMap(
                            snapshot.data!.docs[index].data(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
