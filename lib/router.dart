import 'package:c2cp/bloc/matchmaking_bloc/matchmaking_bloc.dart';
import 'package:c2cp/pages/account_page.dart';
import 'package:c2cp/pages/home_page.dart';
import 'package:c2cp/pages/match_page.dart';
import 'package:c2cp/pages/play_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainRouter extends StatefulWidget {
  const MainRouter({super.key});

  @override
  State<MainRouter> createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {
  _MainRouterState() {
    goRouter = GoRouter(routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const PageWrapper(child: HomePage()),
      ),
      GoRoute(
        path: "/play",
        builder: (context, state) => const PageWrapper(child: PlayPage()),
      ),
      GoRoute(
        path: "/account",
        builder: (context, state) => const PageWrapper(child: AccountPage()),
      ),
      GoRoute(
        path: "/match",
        builder: (context, state) => const PageWrapper(child: MatchPage()),
      ),
    ]);
  }

  late final GoRouter goRouter;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => context.go("/"),
      child: MaterialApp.router(
        routerConfig: goRouter,
      ),
    );
  }
}

class PageWrapper extends StatelessWidget {
  const PageWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchmakingBloc, MatchmakingState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            child,
            state.isMatchmaking ? QueuePopup() : SizedBox(),
            state.match != null &&
                    GoRouter.of(context).routeInformationProvider.value.uri.path !=
                        "/match"
                ? MatchPopup()
                : SizedBox(),
            Positioned( top: 0, left: 0, child: Material(child: Text(GoRouter.of(context).routeInformationProvider.value.uri.path))),
          ],
        );
      },
    );
  }
}

class QueuePopup extends StatelessWidget {
  const QueuePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Material(
          child: Container(
            width: 200,
            height: 70,
            color: Colors.pink,
            child: const Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 5,
                  child: Text(
                    "Queued",
                    style: TextStyle(backgroundColor: Colors.pink),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MatchPopup extends StatelessWidget {
  const MatchPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      child: Listener(
        onPointerUp: (event) => context.go("/match"),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: Material(
            child: Container(
              width: 200,
              height: 70,
              color: Colors.green,
              child: const Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 5,
                    child: Text(
                      "In match",
                      style: TextStyle(backgroundColor: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
