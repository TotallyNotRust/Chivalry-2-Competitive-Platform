// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'matchmaking_bloc.dart';

@immutable
abstract class MatchmakingEvent {}

class StartMatchmaking extends MatchmakingEvent {
  GameMode gameMode;
  StartMatchmaking({
    required this.gameMode,
  });
}

class MatchFound extends MatchmakingEvent {}
