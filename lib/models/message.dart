class Message {
  late final String content;
  late final bool isUser;
  late final String? id;
  late final DateTime timestamp;

  Message(
      {required this.content,
      required this.isUser,
      required this.timestamp,
      this.id});

  Map<String, dynamic> toJson() => {
        "content": content,
        "isUser": isUser,
        "id": id,
        "timestamp": timestamp.toIso8601String()
      };

  Message copyWith({
    String? content,
    bool? isUser,
    DateTime? timestamp,
  }) =>
      Message(
        content: content ?? this.content,
        isUser: isUser ?? this.isUser,
        timestamp: timestamp ?? this.timestamp,
      );
}
