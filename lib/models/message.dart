class Message {
  final String text, senderEmail;
  final DateTime timestamp;

  const Message({
    required this.text,
    required this.senderEmail,
    required this.timestamp,
  });

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        senderEmail: json["senderEmail"],
        text: json["text"],
        timestamp: DateTime.parse(json["timestamp"].toDate().toString()),
      );

  Map<String, dynamic> toMap() => {
        "senderEmail": senderEmail,
        "text": text,
        "timestamp": timestamp,
      };
}
