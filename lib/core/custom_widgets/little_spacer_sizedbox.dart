import 'package:flutter/cupertino.dart';

class LittleSizedBox extends SizedBox {
  final BuildContext context;
  final double percentage;

  LittleSizedBox(this.context, this.percentage)
      : super(height: MediaQuery.of(context).size.height * (percentage / 100));
}
