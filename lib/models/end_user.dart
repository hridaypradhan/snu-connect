import 'package:firebase_auth/firebase_auth.dart';

class EndUser {
  String? name, email, phone, photoUrl;
  EndUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.photoUrl,
  });

  factory EndUser.fromAuth() {
    var user = FirebaseAuth.instance.currentUser;
    return EndUser(
      email: user?.email,
      name: user?.displayName,
      photoUrl: user?.photoURL,
      phone: user?.phoneNumber,
    );
  }

  factory EndUser.fromMap(Map<String, dynamic> json) => EndUser(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "phone": phone,
        "photoUrl": photoUrl,
      };
}
