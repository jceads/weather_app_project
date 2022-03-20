import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_with_chad_api/core/constants/pad_value.dart';
import 'package:weather_with_chad_api/core/custom_widgets/city_name_text.dart';
import 'package:weather_with_chad_api/core/custom_widgets/hours_of_day.dart';
import 'package:weather_with_chad_api/core/custom_widgets/next_days_temp.dart';
import 'package:weather_with_chad_api/core/custom_widgets/standart_divider.dart';
import 'package:weather_with_chad_api/product/color_maker/color_generator.dart';
import 'package:weather_with_chad_api/product/models/base_model.dart/base_model.dart';

import '../../core/custom_widgets/little_spacer_sizedbox.dart';
import '../../core/custom_widgets/todays_highest_lowest.dart';
import '../../core/custom_widgets/todays_icon.dart';

class CurrentCityView extends StatelessWidget {
  CurrentCityView(
      {Key? key,
      required this.currentIndex,
      required this.model,
      required this.index,
      required this.iconBTNFunc})
      : super(key: key);

  final VoidCallback iconBTNFunc;
  int index;
  int currentIndex;
  BaseModel? model;
  double? get getTemp => model?.realTimeModel?.current?.tempC;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ColorGen().generateColor(getTemp),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: iconBTNFunc, icon: const Icon(Icons.menu_rounded)),
          title: Text(DateFormat.yMMMMd("en-US").format(DateTime.now())),
        ),
        body: Padding(
          padding: PaddingValue.padAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              currentOverview(context),
              tomorrowsView(context),
              hourValuesofTheDay(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget hourValuesofTheDay(BuildContext context) {
    return HourOfDay(
      hourList: model?.foreCastModel?.forecast?.forecastday?[0].hour,
    );
  }

  Widget tomorrowsView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const stdDivider(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                NextDaysTemp(model: model?.foreCastModel, index: index),
            itemCount: model?.foreCastModel?.forecast?.forecastday?.length,
          ),
        ),
        const stdDivider(),
      ],
    );
  }

  Container currentOverview(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          FirstHalfBuil(context, index),
        ],
      ),
    );
  }

  Row FirstHalfBuil(BuildContext context, int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(children: [
          CustomCityText(
              model?.realTimeModel?.location?.name ?? "City null", context),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(i,
                (index) => Icon(Icons.circle, size: currentIndex == i ? 8 : 4)),
          ),
          LittleSizedBox(context, 2),
          currentDegree(context, "${model?.realTimeModel?.current?.tempC}"),
          TodaysHighestLatest(
              highest: "${model?.realTimeModel?.current?.humidity}",
              lowest: "19"),
          LittleSizedBox(context, 5),
          commentOfTheDay(
              context, "${model?.realTimeModel?.current?.condition?.text}"),
          feelsDegree(context, "${model?.realTimeModel?.current?.feelslikeC}"),
          LittleSizedBox(context, 2),
        ]),
        TodaysIcon(
            context: context,
            img: model?.realTimeModel?.current?.condition?.icon ?? "")
      ],
    );
  }

  Text feelsDegree(BuildContext context, String degree) {
    return Text("feels like: $degree°",
        style: Theme.of(context).textTheme.bodySmall);
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
