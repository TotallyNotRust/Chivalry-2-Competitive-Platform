import 'package:c2cp/pages/account_page.dart';
import 'package:c2cp/pages/home_page.dart';
import 'package:c2cp/pages/play_page.dart';
import 'package:flutter/material.dart';
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
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/play",
        builder: (context, state) => const PlayPage(),
      ),
      GoRoute(
        path: "/account",
        builder: (context, state) => const AccountPage(),
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
