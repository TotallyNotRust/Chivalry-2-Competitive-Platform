// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

class ChatInitial extends ChatState {
  final List<ChatMessage> messages;

  ChatInitial({this.messages = const []});

  ChatInitial copyWith({
    List<ChatMessage>? messages,
  }) {
    return ChatInitial(
      messages: messages ?? this.messages,
    );
  }
}
