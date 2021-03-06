import 'dart:developer';

import 'package:dio/dio.dart';

import '../enums/service_path.dart';
import '../models/astronomy_model.dart';
import '../models/base_model.dart/base_model.dart';
import '../models/forecast_model.dart';
import '../models/location_model.dart';
import '../models/realtime_model.dart';
import 'network_manager.dart';

abstract class IGetWeatherInfoService {
  final Dio dio;

  IGetWeatherInfoService(this.dio);

  Future<RealTimeModel?> getCurrentData(String city);
  Future<ForeCastModel?> getForecastData(String city, {int day});
  Future<AstronomyModel?> getAstronomyData(String city);
  Future<LocationModel?> getLocationData(String city);
  Future<BaseModel?> getAsBaseModel(String city);
}

class GetWeatherInfoService extends IGetWeatherInfoService {
  GetWeatherInfoService(NetworkManager dio) : super(Dio());

  @override
  Future<RealTimeModel?> getCurrentData(String city) async {
    try {
      final response = await dio.get(
          "${ServicePath.base_Url.rawValue}${ServicePath.current.rawValue}${ServicePath.api_key.rawValue}&q=$city&aqi=yes");
      if (response.statusCode == 200) {
        return RealTimeModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("message: ${e.message}");
      log("response path${e.requestOptions.path}");
      log("response code${e.response?.statusCode}");
    }
    return null;
  }

  //http://api.weatherapi.com/v1/forecast.json?key=e22f94a48e7e4f499d9191511221303&q=istanbul&days=7&aqi=yes&alerts=no

  @override
  Future<ForeCastModel?> getForecastData(String city, {int day = 7}) async {
    try {
      final response = await dio.get(
          "${ServicePath.base_Url.rawValue}${ServicePath.forecast.rawValue}${ServicePath.api_key.rawValue}&q=$city&days=7&aqi=yes&alerts=no");
      print(
          "${ServicePath.base_Url.rawValue}${ServicePath.forecast.rawValue}${ServicePath.api_key.rawValue}&q=$city&days=7&aqi=yes&alerts=no");
      if (response.statusCode == 200) {
        return ForeCastModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("message: ${e.message}");
      log("response path${e.requestOptions.path}");
      log("response code${e.response?.statusCode}");
    }
    return null;
  }

  @override
  Future<AstronomyModel?> getAstronomyData(String city) async {
    try {
      final response = await dio.get(
          "${ServicePath.base_Url.rawValue}${ServicePath.astro.rawValue}${ServicePath.api_key.rawValue}&q=$city&aqi=yes");
      if (response.statusCode == 200) {
        return AstronomyModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("message: ${e.message}");
      log("response path${e.requestOptions.path}");
      log("response code${e.response?.statusCode}");
    }
    return null;
  }

  @override
  Future<LocationModel?> getLocationData(String city) async {
    try {
      final response = await dio.get(
          "${ServicePath.base_Url.rawValue}${ServicePath.astro.rawValue}${ServicePath.api_key.rawValue}&q=$city&aqi=yes");
      if (response.statusCode == 200) {
        return LocationModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("message: ${e.message}");
      log("response path${e.requestOptions.path}");
      log("response code${e.response?.statusCode}");
    }
    return null;
  }

  @override
  Future<BaseModel?> getAsBaseModel(String city) async {
    final forecast = await getForecastData(city);
    final realTimeModel = await getCurrentData(city);
    return BaseModel(forecast, realTimeModel);
  }
}
