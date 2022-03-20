import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/product/models/forecast_model.dart';

class HourOfDay extends StatelessWidget {
  HourOfDay({Key? key, required this.hourList}) : super(key: key);
  final List<Hour>? hourList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("${hourList?[i].time}"), //bug
              Text("${hourList?[i].tempC}"),
              SizedBox(
                width: 32,
                height: 32,
                child: Image.network("https:${hourList?[i].condition?.icon}"),
              ),
              Row(
                children: [
                  Text("${hourList?[i].tempC}°"),
                  Text("${hourList?[i].feelslikeC}°",
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              )
            ],
          ),
        );
      },
      itemCount: hourList?.length ?? 7,
    ));
  }
}
