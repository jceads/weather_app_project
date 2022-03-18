import 'package:flutter/material.dart';

class TodaysHighestLatest extends StatelessWidget {
  TodaysHighestLatest({Key? key, required this.highest, required this.lowest})
      : super(key: key);
  final String highest;
  final String lowest;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [Icon(Icons.keyboard_arrow_up), Text("$highest°")],
        ),
        Row(
          children: [Icon(Icons.keyboard_arrow_down), Text("$lowest°")],
        ),
      ],
    );
  }
}
