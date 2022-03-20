import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/product/models/forecast_model.dart';

class HourOfDay extends StatelessWidget {
  HourOfDay({Key? key, required this.model}) : super(key: key);
  final Forecast? model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("${model?.forecastday?[i].hour?[i].time}"), //bug
              Text("${model?.forecastday?[i].day?.avgtempC}"),
              SizedBox(
                width: 32,
                height: 32,
                child: Image.network(
                    "https:${model?.forecastday?[i].day?.condition?.icon}"),
              ),
              Row(
                children: [
                  Text("${model?.forecastday?[i].hour?[i].tempC}°"),
                  Text("${model?.forecastday?[i].hour?[i].feelslikeC}°",
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              )
            ],
          ),
        );
      },
      itemCount: model?.forecastday?.length,
    ));
  }
}



// Expanded(
//       child: ListView.builder(
//         itemBuilder: (context, index) => HourOfDay(
//             model: model?.foreCastModel?.forecast?.forecastday?[index],
//             index: index),
//         itemCount:
//             model?.foreCastModel?.forecast?.forecastday?[index].hour?.length,
//       ),
//     )











// return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text("${model?.hour?[index].time}"), //bug
//           SizedBox(
//               width: 32,
//               height: 32,
//               child: Image.network("https:${model?.day?.condition?.icon}")),
//           Row(children: [
//             Text(
//               "${model?.hour?[index].tempC}° ",
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             Text("${model?.hour?[index].feelslikeC}°",
//                 style: Theme.of(context).textTheme.bodySmall)
//           ])
//         ],
//       ),
//     );