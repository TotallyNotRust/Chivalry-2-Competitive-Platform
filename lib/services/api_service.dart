import 'dart:async';
import 'dart:io';

import 'package:c2cp/bloc/matchmaking_bloc/matchmaking_bloc.dart';
import 'package:c2cp/data_classes/account.dart';
import 'package:c2cp/data_classes/match.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

const endpoint = "192.168.1.112";
const ajax_api_endpoint = "http://$endpoint:8081";
const matchmaking_socket_endpoint = "http://$endpoint:3001";

class ApiService {
  String? _token;
  final dio = Dio();

  set token(String token) {
    dio.options.headers["authorization"] = "Bearer $token";
    _token = token;
    print("New token $_token");
  }

  Future<Map?> login(String identifier, String password) async {
    print("Sending request");
    try {
      final response = await dio.post(
        "$ajax_api_endpoint/login",
        options: Options(contentType: "application/x-www-form-urlencoded"),
        data: {
          "identifier": identifier,
          "password": password,
        },
      );

      token = response.data["auth"]["token"];

      return response.data as Map;
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  Future<Account> getAccount() async {
    final response = await dio.post("$ajax_api_endpoint/api/account-info");

    print(response);

    return Account.fromMap(response.data);
  }

  Future<String> ping() async {
    final response = await dio.post("$ajax_api_endpoint/api/ping");

    print(response);

    return response.data;
  }

  Future<bool> joinQueue(MatchmakingBloc bloc) async {
    Completer<bool> queue_joined = Completer();
    Completer<bool> connection_done = Completer();
    final socket = IO.io(
      matchmaking_socket_endpoint,
      OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.onConnectError(
      (data) {
        print(data);
        connection_done.complete(false);
      },
    );
    socket.onConnect((_) {
      print('connected to matchmaking bloc');
      connection_done.complete(true);
    });

    socket.connect();
    print("connected maby ${socket.connected}");
    await connection_done.future;
    if (socket.connected) {
      socket.on(
        "match-found",
        (data) => bloc.add(
          MatchFound(match: Match.fromJson(data)),
        ),
      );
      socket.on("joined-queue", (data) {
        print("Joined queue {got data $data}");
        queue_joined.complete(true);
      });

      socket.emit("start-queue", _token);
    } else {
      queue_joined.complete(false);
    }

    return queue_joined.future;
  }
}
