import 'package:c2cp/bloc/login/authentication_bloc.dart';
import 'package:c2cp/services/api_service.dart';
import 'package:c2cp/widgets/play.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: SizedBox(
              child: Image.asset(
                "assets/logo.png",
                height: 60,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
            ],
          ),
          const SliverToBoxAdapter(child: RankedSection()),
        ],
      ),
    );
  }
}
