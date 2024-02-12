import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:c2cp/data_classes/account.dart';
import 'package:c2cp/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState()) {
    on<LoginEvent>(loginAction, transformer: sequential());
  }

  Future loginAction(
    LoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final response =
        await GetIt.I.get<ApiService>().login(event.identifier, event.password);
    print("Got account $response");
    emit(state.copyWith(account: Account.fromMap(response["account"])));
  }
}
