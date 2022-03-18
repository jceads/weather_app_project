import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/core/constants/pad_value.dart';
import 'package:weather_with_chad_api/core/custom_widgets/city_name_text.dart';
import 'package:weather_with_chad_api/core/custom_widgets/hours_of_day.dart';
import 'package:weather_with_chad_api/core/custom_widgets/next_days_temp.dart';
import 'package:weather_with_chad_api/core/custom_widgets/standart_divider.dart';
import 'package:weather_with_chad_api/product/models/forecast_model.dart';
import 'package:weather_with_chad_api/product/models/realtime_model.dart';

import '../../core/custom_widgets/little_spacer_sizedbox.dart';
import '../../core/custom_widgets/todays_highest_lowest.dart';
import '../../core/custom_widgets/todays_icon.dart';
import '../../core/custom_widgets/top_bar.dart';

class CurrentCityView extends StatelessWidget {
  CurrentCityView(
      {Key? key,
      required this.realTimeModel,
      required this.foreCastModel,
      required this.currentIndex,
      required this.index})
      : super(key: key);
  RealTimeModel? realTimeModel;
  ForeCastModel? foreCastModel;
  int index;
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 102, 0),
            Colors.yellow,
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Padding(
          padding: PaddingValue.padAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TopBarWidget(
                onTapEvent: () {},
                textDays: realTimeModel?.current?.condition?.text ?? "null",
              ),
              const SizedBox(height: 20),
              FirstHalfBuil(context, index),
              Column(
                children: [
                  stdDivider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          NextDaysTemp(model: foreCastModel, index: index),
                      itemCount: foreCastModel?.forecast?.forecastday?.length,
                    ),
                  ),
                  stdDivider(),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return HourOfDay(
                            model: foreCastModel ?? ForeCastModel(),
                            index: index);
                      },
                      itemCount: foreCastModel
                          ?.forecast?.forecastday?[index].hour?.length,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row FirstHalfBuil(BuildContext context, int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(children: [
          CustomCityText(realTimeModel?.location?.name ?? "City null", context),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(i,
                (index) => Icon(Icons.circle, size: currentIndex == i ? 8 : 4)),
          ),
          LittleSizedBox(context, 2),
          currentDegree(context, "${realTimeModel?.current?.tempC}"),
          TodaysHighestLatest(
              highest: "${realTimeModel?.current?.humidity}", lowest: "19"),
          LittleSizedBox(context, 5),
          commentOfTheDay(
              context, "${realTimeModel?.current?.condition?.text}"),
          feelsDegree(context, "${realTimeModel?.current?.feelslikeC}"),
          LittleSizedBox(context, 2),
        ]),
        TodaysIcon(context: context, icon: Icons.sunny)
      ],
    );
  }

  Text feelsDegree(BuildContext context, String degree) {
    return Text("$degree°", style: Theme.of(context).textTheme.bodySmall);
  }

  Text commentOfTheDay(BuildContext context, String comment) =>
      Text(comment, style: Theme.of(context).textTheme.bodyLarge);

  Text currentDegree(BuildContext context, String value) {
    return Text("$value°C",
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(color: Colors.white));
  }

  Padding other_day(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Tuesday"),
          const Icon(Icons.sunny),
          Row(children: [
            Text(
              "31",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("13", style: Theme.of(context).textTheme.bodySmall)
          ])
        ],
      ),
    );
  }
}
