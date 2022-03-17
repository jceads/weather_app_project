import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_with_chad_api/product/enums/service_path.dart';
import 'package:weather_with_chad_api/product/models/forecast_model.dart';
import 'package:weather_with_chad_api/product/models/realtime_model.dart';
import 'package:weather_with_chad_api/product/network/network_manager.dart';

abstract class IGetWeatherInfoService {
  final Dio dio;

  IGetWeatherInfoService(this.dio);

  Future<CurrentModel?> getCurrentData(String city);
  Future<Forecast?> getForecastData(String city);
}

class GetWeatherInfoService extends IGetWeatherInfoService {
  GetWeatherInfoService(NetworkManager dio) : super(Dio());

  @override
  Future<CurrentModel?> getCurrentData(String city) async {
    final response = await dio.get(
        "${ServicePath.base_Url.rawValue}${ServicePath.current.rawValue}${ServicePath.api_key.rawValue}&q=$city&aqi=yes");
    if (response.statusCode == 200) {
      return CurrentModel.fromJson(response.data);
    } else {
      log("${ServicePath.current}${ServicePath.api_key}&q=$city&aqi=yes");
      log(response.data);
      log("$response");
      log(response.statusCode.toString());
    }
  }

  @override
  Future<Forecast?> getForecastData(String city) {
    // TODO: implement getForecastData
    throw UnimplementedError();
  }
}
