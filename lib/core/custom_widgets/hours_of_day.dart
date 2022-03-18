import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/product/models/forecast_model.dart';

class HourOfDay extends StatelessWidget {
  HourOfDay({Key? key, required this.model, required this.index})
      : super(key: key);
  final ForeCastModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
              "${model.forecast?.forecastday?[index].hour?[index].tempC} text"), //bug
          Image.network(
              "${model.forecast?.forecastday?[index].hour?[index].condition?.icon} icon"),
          Row(children: [
            Text(
              "${model.forecast?.forecastday?[index].hour?[index].tempC} tempc",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("13", style: Theme.of(context).textTheme.bodySmall)
          ])
        ],
      ),
    );
  }
}
