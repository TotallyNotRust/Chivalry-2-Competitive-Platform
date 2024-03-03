import 'dart:async';

import 'package:c2cp/data_classes/message.dart';
import 'package:c2cp/main.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:bloc/bloc.dart';
import 'package:c2cp/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:c2cp/data_classes/match.dart';
import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';


part 'matchmaking_event.dart';
part 'matchmaking_state.dart';

class MatchmakingBloc extends Bloc<MatchmakingEvent, MatchmakingState> {
  MatchmakingBloc() : super(MatchmakingState(isMatchmaking: false)) {
    on<StartMatchmaking>(startMatchmaking);
    on<MatchFound>(matchFound);
    on<NewMessage>(newMessage);
    on<SendMessage>(sendMessage);
  }

  Future startMatchmaking(
    StartMatchmaking event,
    Emitter<MatchmakingState> emit,
  ) async {
    print("joining queue");
    bool isQueing = await GetIt.I.get<ApiService>().joinQueue(this);
    print("Emitting with isMatchmaking=$isQueing");
    emit(state.copyWith(isMatchmaking: isQueing));
  }

  Future matchFound(MatchFound event, Emitter<MatchmakingState> emit) async {
    print("We gots a match");
    emit(state.copyWith(
      match: event.match,
      isMatchmaking: false,
    ));
  }
  

  Future newMessage(NewMessage event, Emitter<MatchmakingState> emit) async {
        print("We gots a message");
    emit(state.copyWith(
      messages: [...state.messages, event.message],
    ));
  }
    Future sendMessage(SendMessage event, Emitter<MatchmakingState> emit) async {
      print("Sending a message");
      await GetIt.I.get<ApiService>().sendMessage(event.message);
  }
}

enum GameMode {
  oneVsOne("1v1", 0),
  twoVsTwo("2v2", 1),
  fiveVsFive("5v5", 2);

  final String gameModeName;
  final int id;
  const GameMode(this.gameModeName, this.id);
}
