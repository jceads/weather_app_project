import 'package:flutter/material.dart';

import '../../product/models/forecast_model.dart';

class NextDaysTemp extends StatelessWidget {
  NextDaysTemp({Key? key, required this.model, required this.index})
      : super(key: key);
  final ForeCastModel? model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${DateTime.now().day + (index + 1)}",
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${model?.forecast?.forecastday?[index].day?.avgtempC}°",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
