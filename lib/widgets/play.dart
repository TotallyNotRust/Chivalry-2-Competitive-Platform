import 'package:c2cp/bloc/login/authentication_bloc.dart';
import 'package:c2cp/bloc/matchmaking_bloc/matchmaking_bloc.dart';
import 'package:c2cp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RankedSection extends StatelessWidget {
  const RankedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Play",
              style: TextStyle(fontSize: 23),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GameModeWidget(gameMode: GameMode.oneVsOne),
                GameModeWidget(gameMode: GameMode.twoVsTwo),
                GameModeWidget(gameMode: GameMode.fiveVsFive),
              ],
            ),
          ],
        ));
  }
}

class GameModeWidget extends StatelessWidget {
  const GameModeWidget({super.key, required this.gameMode});

  final GameMode gameMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Listener(
        onPointerUp: (event) => BlocProvider.of<MatchmakingBloc>(context)
            .add(StartMatchmaking(gameMode: gameMode)),
        child: SizedBox(
          width: 250,
          height: 250,
          child: Listener(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.network(
                    "https://sm.ign.com/ign_nordic/review/c/chivalry-2/chivalry-2-review_uk8b.jpg"),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black87),
                    child: Text(
                      " ${gameMode.gameModeName} ",
                      style: const TextStyle(color: Colors.white, fontSize: 27),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
