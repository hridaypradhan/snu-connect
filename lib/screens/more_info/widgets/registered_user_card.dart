import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/services/registration_service.dart';

class RegisteredUserCard extends StatelessWidget {
  final int serialNumber;
  final String name, email;
  final Event event;
  const RegisteredUserCard({
    required this.serialNumber,
    Key? key,
    required this.name,
    required this.email,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: lightPink,
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                serialNumber.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          title: Text(name),
          subtitle: Text(email),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              if (event.host.email == FirebaseAuth.instance.currentUser?.email)
                const SizedBox(width: 10),
              if (event.host.email == FirebaseAuth.instance.currentUser?.email)
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    RegistrationService().removeRegisteredUser(email, event);
                  },
                ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
