class Message {
  final String text, senderEmail;
  final DateTime timestamp;

  const Message({
    required this.text,
    required this.senderEmail,
    required this.timestamp,
  });
}
