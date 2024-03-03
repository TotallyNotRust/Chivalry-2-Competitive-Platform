// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'matchmaking_bloc.dart';

abstract class MatchmakingEvent {}

class StartMatchmaking extends MatchmakingEvent {
  final GameMode gameMode;
  StartMatchmaking({
    required this.gameMode,
  });
}

class MatchFound extends MatchmakingEvent {
  final Match match;

  MatchFound({required this.match});
}

class NewMessage extends MatchmakingEvent {
  final Message message;

  NewMessage({required this.message});
}
class SendMessage extends MatchmakingEvent {
  final Message message;

  SendMessage({required this.message});
}