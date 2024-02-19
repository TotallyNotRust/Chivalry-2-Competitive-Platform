import 'package:c2cp/bloc/login/authentication_bloc.dart';
import 'package:c2cp/services/api_service.dart';
import 'package:c2cp/widgets/default_sliver_app_bar.dart';
import 'package:c2cp/widgets/play.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          DefaultSliverAppBar(),
          SliverToBoxAdapter(child: RankedSection()),
        ],
      ),
    );
  }
}
