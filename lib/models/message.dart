class Message {
  late final String content;
  late final bool isUser;
  late final DateTime timestamp;
  Message(
      {required this.content, required this.isUser, required this.timestamp});

  Map<String, dynamic> toJson() => {
        "content": content,
        "isUser": isUser,
        "timestamp": timestamp.toIso8601String()
      };
}
