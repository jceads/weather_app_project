import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_chad_api/core/constants/pad_value.dart';
import 'package:weather_with_chad_api/feature/current_city/current_city_view.dart';
import 'package:weather_with_chad_api/feature/page_view/page_manager_model.dart';
import 'package:weather_with_chad_api/product/models/base_model.dart/base_model.dart';
import 'package:weather_with_chad_api/product/models/forecast_model.dart';
import 'package:weather_with_chad_api/product/models/realtime_model.dart';
import 'package:weather_with_chad_api/product/network/network_manager.dart';
import 'package:weather_with_chad_api/product/network/weather_info_service.dart';

class PageManager extends StatelessWidget {
  PageManager({Key? key}) : super(key: key);
  ForeCastModel? foreCastModel;
  RealTimeModel? realTimeModel;
  int currentIndex = 0;
  List<BaseModel> list = [];
  var cityInputController = TextEditingController();
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageManagerCubit(list,
          GetWeatherInfoService(NetworkManager.instance), cityInputController),
      child: BlocConsumer<PageManagerCubit, PageManagerState>(
        listener: (context, state) {
          if (state is WriteCityState) {
            AlertDialog(
              title: Text("Enter a city name"),
              actions: [
                TextFormField(
                  controller: cityInputController,
                  onTap: () {
                    context
                        .read<PageManagerCubit>()
                        .getData(cityInputController.text);
                  },
                ),
              ],
            );
          }
        },
        builder: (context, state) {
          if (state is ShowCitiesState) {
            return PageView.builder(
              itemBuilder: (context, index) => CurrentCityView(
                  realTimeModel: list[index].realTimeModel,
                  foreCastModel: list[index].foreCastModel,
                  currentIndex: currentIndex,
                  index: index),
              itemCount: list.length,
            );
          } else if (state is WriteCityState) {
            return Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: PaddingValue.padAll,
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (val) {
                          context.read<PageManagerCubit>().getData(val);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<PageManagerCubit>()
                              .getData(_controller.text);
                        },
                        child: Text("Search"))
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.amber,
            );
          }
        },
      ),
    );
  }
}
