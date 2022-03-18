import 'dart:convert';

import 'package:weather_with_chad_api/product/models/forecast_model.dart';
import 'package:weather_with_chad_api/product/models/realtime_model.dart';

class BaseModel {
  ForeCastModel? foreCastModel;
  RealTimeModel? realTimeModel;
  BaseModel(
    this.foreCastModel,
    this.realTimeModel,
  );

  BaseModel copyWith({
    ForeCastModel? foreCastModel,
    RealTimeModel? realTimeModel,
  }) {
    return BaseModel(
      foreCastModel ?? this.foreCastModel,
      realTimeModel ?? this.realTimeModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'foreCastModel': foreCastModel?.toJson(),
      'realTimeModel': realTimeModel?.toJson(),
    };
  }

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    return BaseModel(
      map['foreCastModel'] != null
          ? ForeCastModel.fromJson(map['foreCastModel'])
          : null,
      map['realTimeModel'] != null
          ? RealTimeModel.fromJson(map['realTimeModel'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseModel.fromJson(String source) =>
      BaseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'BaseModel(foreCastModel: $foreCastModel, realTimeModel: $realTimeModel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseModel &&
        other.foreCastModel == foreCastModel &&
        other.realTimeModel == realTimeModel;
  }

  @override
  int get hashCode => foreCastModel.hashCode ^ realTimeModel.hashCode;
}
