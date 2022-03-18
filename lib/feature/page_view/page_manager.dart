import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_chad_api/core/constants/pad_value.dart';
import 'package:weather_with_chad_api/core/custom_widgets/top_bar.dart';
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
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is WriteCityState) {
            return Scaffold(
              body: Center(
                  child: Column(
                children: [
                  TextField(),
                  ElevatedButton(
                      onPressed: () {
                        context.read<PageManagerCubit>().getData("istanbul");
                      },
                      child: Text("data"))
                ],
              )),
            );
          } else if (state is ShowCitiesState) {
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 211, 102, 0),
                    Colors.yellow,
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
                child: CurrentCityView(
                    currentIndex: 0, index: 0, model: state.list.first),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}






/*
decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 211, 102, 0),
                    Colors.yellow,
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),*/