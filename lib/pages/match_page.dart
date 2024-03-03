import 'package:c2cp/bloc/login/authentication_bloc.dart';
import 'package:c2cp/bloc/matchmaking_bloc/matchmaking_bloc.dart';
import 'package:c2cp/data_classes/message.dart';
import 'package:c2cp/services/api_service.dart';
import 'package:c2cp/widgets/default_sliver_app_bar.dart';
import 'package:c2cp/widgets/play.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Scaffold(
      body: BlocBuilder<MatchmakingBloc, MatchmakingState>(
        builder: (context, state) => CustomScrollView(
          slivers: [
            const DefaultSliverAppBar(),
            const SliverToBoxAdapter(
              child: Text("You are in a match"),
            ),
            SliverToBoxAdapter(
              child: ClayContainer(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Players",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...(state.match?.players ?? [])
                          .map((e) => Text(e.username))
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: ClayContainer(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Messages",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...(state.messages ?? [])
                          .map((e) => MessageWidget(message: e)),
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: CupertinoTextField(
                                  controller: messageController),
                            ),
                            CupertinoButton(
                              onPressed: () =>
                                  BlocProvider.of<MatchmakingBloc>(context).add(
                                SendMessage(
                                  message: Message.fromContext(
                                    context,
                                    messageController.text,
                                  ),
                                ),
                              ),
                              child: const ClayContainer(
                                child: Text("Send"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(message.from.username, style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(
          width: 10,
        ),
        Text(message.message),
      ],
    );
  }
}
