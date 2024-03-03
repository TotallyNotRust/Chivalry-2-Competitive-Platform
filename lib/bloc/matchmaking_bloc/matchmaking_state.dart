// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'matchmaking_bloc.dart';

class MatchmakingState {
  final bool isMatchmaking;
  final Match? match;
  final List<Message> messages;
  MatchmakingState({
    required this.isMatchmaking,
    this.match,
    this.messages = const [],
  });

  MatchmakingState copyWith({
    bool? isMatchmaking,
    Match? match,
    List<Message>? messages,
  }) {
    return MatchmakingState(
      isMatchmaking: isMatchmaking ?? this.isMatchmaking,
      match: match ?? this.match,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isMatchmaking': isMatchmaking,
      'match': match?.toMap(),
      'messages': messages.map((x) => x.toMap()).toList(),
    };
  }

  factory MatchmakingState.fromMap(Map<String, dynamic> map) {
    return MatchmakingState(
      isMatchmaking: map['isMatchmaking'] as bool,
      match: map['match'] != null ? Match.fromMap(map['match'] as Map<String,dynamic>) : null,
      messages: List<Message>.from((map['messages'] as List<int>).map<Message>((x) => Message.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchmakingState.fromJson(String source) => MatchmakingState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MatchmakingState(isMatchmaking: $isMatchmaking, match: $match, messages: $messages)';

  @override
  bool operator ==(covariant MatchmakingState other) {
    if (identical(this, other)) return true;
  
    return 
      other.isMatchmaking == isMatchmaking &&
      other.match == match &&
      listEquals(other.messages, messages);
  }

  @override
  int get hashCode => isMatchmaking.hashCode ^ match.hashCode ^ messages.hashCode;
}

