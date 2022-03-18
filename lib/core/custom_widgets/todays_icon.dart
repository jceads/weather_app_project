import 'package:flutter/material.dart';

class TodaysIcon extends StatelessWidget {
  final IconData icon;
  BuildContext context;

  TodaysIcon({Key? key, required this.icon, required this.context})
      : super(key: key);

  @override
  Widget build(context) {
    return Stack(children: [
      Positioned(
        child: Icon(icon, size: 120),
        left: 40,
        top: 40,
      ),
      CircleAvatar(minRadius: 100, backgroundColor: Colors.white12),
    ]);
  }
}
