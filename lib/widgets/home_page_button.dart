import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({super.key, required this.text, required this.callBack});

  final String text;
  final Function(PointerUpEvent) callBack;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: callBack,
      child: ClayContainer(
        height: 100,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
