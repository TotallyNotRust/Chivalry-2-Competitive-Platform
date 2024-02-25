// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessage {
  final int fromId;
  final String fromUsername;
  final String message;
  final DateTime sentAt;
  ChatMessage({
    required this.fromId,
    required this.fromUsername,
    required this.message,
    required this.sentAt,
  });

  

  ChatMessage copyWith({
    int? fromId,
    String? fromUsername,
    String? message,
    DateTime? sentAt,
  }) {
    return ChatMessage(
      fromId: fromId ?? this.fromId,
      fromUsername: fromUsername ?? this.fromUsername,
      message: message ?? this.message,
      sentAt: sentAt ?? this.sentAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fromId': fromId,
      'fromUsername': fromUsername,
      'message': message,
      'sentAt': sentAt.millisecondsSinceEpoch,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      fromId: map['fromId'] as int,
      fromUsername: map['fromUsername'] as String,
      message: map['message'] as String,
      sentAt: DateTime.fromMillisecondsSinceEpoch(map['sentAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) => ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatMessage(fromId: $fromId, fromUsername: $fromUsername, message: $message, sentAt: $sentAt)';
  }

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;
  
    return 
      other.fromId == fromId &&
      other.fromUsername == fromUsername &&
      other.message == message &&
      other.sentAt == sentAt;
  }

  @override
  int get hashCode {
    return fromId.hashCode ^
      fromUsername.hashCode ^
      message.hashCode ^
      sentAt.hashCode;
  }
}
