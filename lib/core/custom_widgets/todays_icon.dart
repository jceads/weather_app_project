import 'package:flutter/material.dart';

class TodaysIcon extends StatelessWidget {
  final String img;
  BuildContext context;

  TodaysIcon({Key? key, required this.img, required this.context})
      : super(key: key);

  @override
  Widget build(context) {
    return Stack(children: [
      Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: Image.network(
            "https:$img",
            scale: 0.5,
          ),
        ),
      ),
      CircleAvatar(minRadius: 100, backgroundColor: Colors.white12),
    ]);
  }
}
