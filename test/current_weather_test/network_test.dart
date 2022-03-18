import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_with_chad_api/product/network/network_manager.dart';
import 'package:weather_with_chad_api/product/network/weather_info_service.dart';

void main() {
  test('is network manager working?', () async {
    GetWeatherInfoService service =
        GetWeatherInfoService(NetworkManager.instance);
    final response = await service.getCurrentData("antalya");
    inspect(response);
    expect(response, isNotNull);
  });
  test("forecast data", () async {
    GetWeatherInfoService service =
        GetWeatherInfoService(NetworkManager.instance);
    final response = await service.getForecastData("antalya");

    inspect(response);
    expect(response, isNotNull);
  });
}
