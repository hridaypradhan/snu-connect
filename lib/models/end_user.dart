class EndUser {
  String name, email, phone, photoUrl;
  EndUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.photoUrl,
  });

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
