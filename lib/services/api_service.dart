import 'dart:io';

import 'package:c2cp/data_classes/account.dart';
import 'package:dio/dio.dart';

const endpoint = "http://192.168.1.112:8081";

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
        "$endpoint/login",
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
    final response = await dio.post("$endpoint/api/account-info");

    print(response);

    return Account.fromMap(response.data);
  }

  Future<String> ping() async {
    final response = await dio.post("$endpoint/api/ping");

    print(response);

    return response.data;
  }

  Future startMatchmaking(int gameMode) async {
    final x = await dio.post(
      "$endpoint/api/matchmake",
      options: Options(
        receiveTimeout: null,
        validateStatus: (_) => true,
      ),
      data: {
        "id": 1,
      },
    );
    return await x.data;
  }
}
