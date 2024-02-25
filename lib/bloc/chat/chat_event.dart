part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class RecievedChat extends ChatEvent {
  final ChatMessage message;
  RecievedChat({required this.message});
}

class SendChat extends ChatEvent {
  final ChatMessage message;

  SendChat({required this.message});
}