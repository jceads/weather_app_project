import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/product/models/forecast_model.dart';

class HourOfDay extends StatelessWidget {
  HourOfDay({Key? key, required this.model, required this.index})
      : super(key: key);
  final ForeCastModel? model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("${model?.forecast?.forecastday?[0].hour?[index].time}"), //bug
          Icon(Icons.sunny),
          Row(children: [
            Text(
              "${model?.forecast?.forecastday?[0].hour?[index].tempC}° ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("${model?.forecast?.forecastday?[0].hour?[index].feelslikeC}°",
                style: Theme.of(context).textTheme.bodySmall)
          ])
        ],
      ),
    );
  }
}
