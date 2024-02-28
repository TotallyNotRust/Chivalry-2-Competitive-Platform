part of 'matchmaking_bloc.dart';

class MatchmakingState {
  final bool isMatchmaking;
  MatchmakingState({
    required this.isMatchmaking,
  });

  MatchmakingState copyWith({
    bool? isMatchmaking,
  }) {
    return MatchmakingState(
      isMatchmaking: isMatchmaking ?? this.isMatchmaking,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isMatchmaking': isMatchmaking,
    };
  }

  factory MatchmakingState.fromMap(Map<String, dynamic> map) {
    return MatchmakingState(
      isMatchmaking: map['isMatchmaking'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchmakingState.fromJson(String source) => MatchmakingState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MatchmakingState(isMatchmaking: $isMatchmaking)';

  @override
  bool operator ==(covariant MatchmakingState other) {
    if (identical(this, other)) return true;
  
    return 
      other.isMatchmaking == isMatchmaking;
  }

  @override
  int get hashCode => isMatchmaking.hashCode;
}

