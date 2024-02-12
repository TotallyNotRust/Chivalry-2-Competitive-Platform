import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c2cp/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'matchmaking_event.dart';
part 'matchmaking_state.dart';

class MatchmakingBloc extends Bloc<MatchmakingEvent, MatchmakingState> {
  MatchmakingBloc() : super(MatchmakingState(isMatchmaking: false)) {
    on<StartMatchmaking>(startMatchmaking);
    on<MatchFound>(matchFound);
  }

  Future startMatchmaking(
    StartMatchmaking event,
    Emitter<MatchmakingState> emit,
  ) async {
    print("Start matchmaking");
    String response =
        await GetIt.I.get<ApiService>().startMatchmaking(event.gameMode.id);
    print("Done matchmaking");
    print(response);
    add(MatchFound());
  }

  Future matchFound(MatchFound event, Emitter<MatchmakingState> emit) async {}
}

enum GameMode {
  oneVsOne("1v1", 0),
  twoVsTwo("2v2", 1),
  fiveVsFive("5v5", 2);

  final String gameModeName;
  final int id;
  const GameMode(this.gameModeName, this.id);
}
