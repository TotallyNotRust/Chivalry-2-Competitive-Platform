import 'package:c2cp/widgets/default_sliver_app_bar.dart';
import 'package:c2cp/widgets/home_page_button.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            DefaultSliverAppBar(hideHome: true),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: HomePageButton(
                text: "Play",
                callBack: (p0) {
                  context.go("/play");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
