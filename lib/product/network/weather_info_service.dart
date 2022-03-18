import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_with_chad_api/product/enums/service_path.dart';
import 'package:weather_with_chad_api/product/models/astronomy_model.dart';
import 'package:weather_with_chad_api/product/models/forecast_model.dart';
import 'package:weather_with_chad_api/product/models/location_model.dart';
import 'package:weather_with_chad_api/product/models/realtime_model.dart';
import 'package:weather_with_chad_api/product/network/network_manager.dart';

abstract class IGetWeatherInfoService {
  final Dio dio;

  IGetWeatherInfoService(this.dio);

  Future<CurrentModel?> getCurrentData(String city);
  Future<ForecastModel?> getForecastData(String city);
  Future<AstronomyModel?> getAstronomyData(String city);
  Future<LocationModel?> getLocationData(String city);
}

class GetWeatherInfoService extends IGetWeatherInfoService {
  GetWeatherInfoService(NetworkManager dio) : super(Dio());

  @override
  Future<CurrentModel?> getCurrentData(String city) async {
    try {
      final response = await dio.get(
          "${ServicePath.base_Url.rawValue}${ServicePath.current.rawValue}${ServicePath.api_key.rawValue}&q=$city&aqi=yes");
      if (response.statusCode == 200) {
        return CurrentModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("message: ${e.message}");
      log("response path${e.requestOptions.path}");
      log("response code${e.response?.statusCode}");
    }
    return null;
  }

  @override
  Future<ForecastModel?> getForecastData(String city) async {
    try {
      final response = await dio.get(
          "${ServicePath.base_Url.rawValue}${ServicePath.forecast.rawValue}${ServicePath.api_key.rawValue}&q=$city&aqi=yes");
      if (response.statusCode == 200) {
        return ForecastModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log("message: ${e.message}");
      log("response path${e.requestOptions.path}");
      log("response code${e.response?.statusCode}");
    }
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
  }
}
