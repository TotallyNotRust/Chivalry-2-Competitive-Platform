import 'package:c2cp/bloc/login/authentication_bloc.dart';
import 'package:c2cp/bloc/matchmaking_bloc/matchmaking_bloc.dart';
import 'package:c2cp/pages/play_page.dart';
import 'package:c2cp/pages/login_page.dart';
import 'package:c2cp/router.dart';
import 'package:c2cp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef RouterGlobalKey = GlobalKey;

void main() {
  GetIt.I.registerLazySingleton(() => ApiService());

  GetIt.I.registerFactoryAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chivalry 2 Competetive Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: getColorScheme(),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationBloc()),
          BlocProvider(create: (context) => MatchmakingBloc())
        ],
        child: Builder(builder: (context) {
          return BlocBuilder(
            bloc: BlocProvider.of<AuthenticationBloc>(context),
            builder: (context, state) {
              if (state is! AuthenticationState) {
                throw Exception("Invalid state type");
              }
              if (state.isAuthenticated) {
                return BlocBuilder<MatchmakingBloc, MatchmakingState>(
                  builder: (context, state) {
                    return MainRouter();
                  },
                );
              }
              return LoginPage();
            },
          );
        }),
      ),
    );
  }
}

ColorScheme getColorScheme() {
  return ColorScheme.light(background: Color(0xFFF2F2F2));
}

