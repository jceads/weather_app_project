import 'package:flutter/material.dart';

class CustomCityText extends Text {
  CustomCityText(String data, this.context)
      : super(
          data,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        );
  final BuildContext context;
}
