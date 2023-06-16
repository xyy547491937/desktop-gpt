import 'package:floor/floor.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'message.freezed.dart';
// part 'message.g.dart';
@ForeignKey(
  childColumns: ["session_id"],
  parentColumns: ['id'],
  entity: Message,
)
@ColumnInfo(name: "session_id")
late final int sessionId;

@entity
class Message {
  @primaryKey
  final String id;
  final String content;
  final bool isUser;
  final DateTime timestamp;
  Message({
    required this.id,
    required this.content,
    required this.isUser,
    required this.timestamp,
  });
}

extension MessageExtension on Message {
  Message copyWith({
    String? id,
    String? content,
    bool? isUser,
    DateTime? timestamp,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      isUser: isUser ?? this.isUser,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
