// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:c2cp/data_classes/account.dart';

class Match {
  final int id;
  final int gamemode;
  final List<Account> players;
  Match({
    required this.id,
    required this.gamemode,
    required this.players,
  });

  Match copyWith({
    int? id,
    int? gamemode,
    List<Account>? players,
  }) {
    return Match(
      id: id ?? this.id,
      gamemode: gamemode ?? this.gamemode,
      players: players ?? this.players,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'gamemode': gamemode,
      'players': players.map((x) => x.toMap()).toList(),
    };
  }

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      id: map['id'] as int,
      gamemode: map['gamemode'] as int,
      players: List<Account>.from((map['players'] as List<int>).map<Account>((x) => Account.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Match.fromJson(String source) => Match.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Match(id: $id, gamemode: $gamemode, players: $players)';

  @override
  bool operator ==(covariant Match other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.gamemode == gamemode &&
      listEquals(other.players, players);
  }

  @override
  int get hashCode => id.hashCode ^ gamemode.hashCode ^ players.hashCode;
}
