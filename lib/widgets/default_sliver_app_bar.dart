import 'package:c2cp/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DefaultSliverAppBar extends StatelessWidget {
  const DefaultSliverAppBar({super.key, this.hideHome = false});

  final bool hideHome;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
        IconButton(onPressed: () => context.go("/account"), icon: const Icon(Icons.account_circle))
      ],
      leading: hideHome ? null : HomeButton(),
    );
  }
}
