import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_with_chad_api/product/enums/service_path.dart';
import 'package:weather_with_chad_api/product/network/network_manager.dart';
import 'package:weather_with_chad_api/product/network/weather_info_service.dart';

void main() {
  GetWeatherInfoService service =
      GetWeatherInfoService(NetworkManager.instance);
  test('is network manager working? / realtime data', () async {
    final response = await service.getCurrentData("antalya");
    inspect(response);
    expect(response, isNotNull);
  });
  test("forecast data", () async {
    final response = await service.getForecastData("antalya");

    inspect(response);
    expect(response, isNotNull);
  });
  test("astro data test", () async {
    final response = await service.getAstronomyData("antalya");
    inspect(response);
    expect(response, isNotNull);
  });
}
