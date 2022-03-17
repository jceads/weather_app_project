import 'package:json_annotation/json_annotation.dart';

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
  Location? location;
  Current? current;
  Forecast? forecast;
  Alerts? alerts;

  ForecastModel({this.location, this.current, this.forecast, this.alerts});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return _$ForecastModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForecastModelToJson(this);
  }
}

@JsonSerializable()
class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}

@JsonSerializable()
class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  int? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  double? pressureIn;
  int? precipMm;
  int? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  int? visKm;
  int? uv;
  int? gustKph;
  AirQuality? airQuality;

  Current(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.isDay,
      this.condition,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.visKm,
      this.uv,
      this.gustKph,
      this.airQuality});

  factory Current.fromJson(Map<String, dynamic> json) {
    return _$CurrentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CurrentToJson(this);
  }
}

@JsonSerializable()
class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return _$ConditionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConditionToJson(this);
  }
}

@JsonSerializable()
class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirQuality(
      {this.co,
      this.no2,
      this.o3,
      this.so2,
      this.pm25,
      this.pm10,
      this.usEpaIndex,
      this.gbDefraIndex});

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return _$AirQualityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AirQualityToJson(this);
  }
}

@JsonSerializable()
class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return _$ForecastFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForecastToJson(this);
  }
}

@JsonSerializable()
class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return _$ForecastdayFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForecastdayToJson(this);
  }
}

@JsonSerializable()
class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  int? avgvisKm;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  int? uv;

  Day(
      {this.maxtempC,
      this.mintempC,
      this.avgtempC,
      this.maxwindKph,
      this.totalprecipMm,
      this.totalprecipIn,
      this.avgvisKm,
      this.avghumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv});

  factory Day.fromJson(Map<String, dynamic> json) {
    return _$DayFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DayToJson(this);
  }
}

@JsonSerializable()
class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination});

  factory Astro.fromJson(Map<String, dynamic> json) {
    return _$AstroFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AstroToJson(this);
  }
}

@JsonSerializable()
class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? windchillC;
  double? heatindexC;
  double? dewpointC;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  int? visKm;
  int? visMiles;
  double? gustMph;
  double? gustKph;
  int? uv;

  Hour(
      {this.timeEpoch,
      this.time,
      this.tempC,
      this.isDay,
      this.condition,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.windchillC,
      this.heatindexC,
      this.dewpointC,
      this.willItRain,
      this.chanceOfRain,
      this.willItSnow,
      this.chanceOfSnow,
      this.visKm,
      this.visMiles,
      this.gustMph,
      this.gustKph,
      this.uv});

  factory Hour.fromJson(Map<String, dynamic> json) {
    return _$HourFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HourToJson(this);
  }
}

@JsonSerializable()
class Alerts {
  List<Alert>? alert;
  Alerts({
    required this.alert,
  });

  Alerts.fromJson(Map<String, dynamic> json) {
    alert = json["alert"];
  }
  toJson() {
    return _$AlertsToJson(this);
  }
}

@JsonSerializable()
class Alert {
  String? headline;
  String? msgtype;
  String? severity;
  String? urgency;
  String? areas;
  String? category;
  String? certainty;
  String? event;
  String? note;
  String? effective;
  String? expires;
  String? desc;
  String? instruction;

  Alert(
      {this.headline,
      this.msgtype,
      this.severity,
      this.urgency,
      this.areas,
      this.category,
      this.certainty,
      this.event,
      this.note,
      this.effective,
      this.expires,
      this.desc,
      this.instruction});

  factory Alert.fromJson(Map<String, dynamic> json) {
    return _$AlertFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AlertToJson(this);
  }
}
