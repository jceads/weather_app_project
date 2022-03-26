import 'package:flutter/material.dart';

class ColorGen {
  double? degree;
  List<Color> generateColorList(double? degree) {
    if (degree != null) {
      if (degree > 15) {
        return [
          Color.fromARGB(255, 211, 102, 0),
          Colors.yellow,
        ];
      } else if (degree < 15 && degree > 0) {
        return [
          Colors.blue,
          Colors.blue.shade300,
        ];
      } else {
        return [
          Colors.blueGrey,
          Colors.lightBlue.shade100,
        ];
      }
    } else {
      null;
    }
    return [];
  }

  Color? generateColor(double? degree) {}
}
