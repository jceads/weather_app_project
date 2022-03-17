import 'package:flutter_test/flutter_test.dart';
import 'package:weather_with_chad_api/product/network/weather_info_service.dart';

void main() {
  test('current data is null?', () async {
    IGetWeatherInfoService? service;
    final response = await service?.getCurrentData("antalya");
    expect(response, isNotNull);
  });
}
