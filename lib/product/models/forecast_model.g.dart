// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) =>
    ForecastModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      alerts: json['alerts'] == null
          ? null
          : Alerts.fromJson(json['alerts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastModelToJson(ForecastModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
      'alerts': instance.alerts,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      tzId: json['tzId'] as String?,
      localtimeEpoch: json['localtimeEpoch'] as int?,
      localtime: json['localtime'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tzId': instance.tzId,
      'localtimeEpoch': instance.localtimeEpoch,
      'localtime': instance.localtime,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      lastUpdatedEpoch: json['lastUpdatedEpoch'] as int?,
      lastUpdated: json['lastUpdated'] as String?,
      tempC: json['tempC'] as int?,
      isDay: json['isDay'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windKph: (json['windKph'] as num?)?.toDouble(),
      windDegree: json['windDegree'] as int?,
      windDir: json['windDir'] as String?,
      pressureMb: json['pressureMb'] as int?,
      pressureIn: (json['pressureIn'] as num?)?.toDouble(),
      precipMm: json['precipMm'] as int?,
      precipIn: json['precipIn'] as int?,
      humidity: json['humidity'] as int?,
      cloud: json['cloud'] as int?,
      feelslikeC: (json['feelslikeC'] as num?)?.toDouble(),
      visKm: json['visKm'] as int?,
      uv: json['uv'] as int?,
      gustKph: json['gustKph'] as int?,
      airQuality: json['airQuality'] == null
          ? null
          : AirQuality.fromJson(json['airQuality'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'lastUpdatedEpoch': instance.lastUpdatedEpoch,
      'lastUpdated': instance.lastUpdated,
      'tempC': instance.tempC,
      'isDay': instance.isDay,
      'condition': instance.condition,
      'windKph': instance.windKph,
      'windDegree': instance.windDegree,
      'windDir': instance.windDir,
      'pressureMb': instance.pressureMb,
      'pressureIn': instance.pressureIn,
      'precipMm': instance.precipMm,
      'precipIn': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslikeC': instance.feelslikeC,
      'visKm': instance.visKm,
      'uv': instance.uv,
      'gustKph': instance.gustKph,
      'airQuality': instance.airQuality,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

AirQuality _$AirQualityFromJson(Map<String, dynamic> json) => AirQuality(
      co: (json['co'] as num?)?.toDouble(),
      no2: (json['no2'] as num?)?.toDouble(),
      o3: (json['o3'] as num?)?.toDouble(),
      so2: (json['so2'] as num?)?.toDouble(),
      pm25: (json['pm25'] as num?)?.toDouble(),
      pm10: (json['pm10'] as num?)?.toDouble(),
      usEpaIndex: json['usEpaIndex'] as int?,
      gbDefraIndex: json['gbDefraIndex'] as int?,
    );

Map<String, dynamic> _$AirQualityToJson(AirQuality instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm25': instance.pm25,
      'pm10': instance.pm10,
      'usEpaIndex': instance.usEpaIndex,
      'gbDefraIndex': instance.gbDefraIndex,
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      forecastday: (json['forecastday'] as List<dynamic>?)
          ?.map((e) => Forecastday.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'forecastday': instance.forecastday,
    };

Forecastday _$ForecastdayFromJson(Map<String, dynamic> json) => Forecastday(
      date: json['date'] as String?,
      dateEpoch: json['dateEpoch'] as int?,
      day: json['day'] == null
          ? null
          : Day.fromJson(json['day'] as Map<String, dynamic>),
      astro: json['astro'] == null
          ? null
          : Astro.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastdayToJson(Forecastday instance) =>
    <String, dynamic>{
      'date': instance.date,
      'dateEpoch': instance.dateEpoch,
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      maxtempC: (json['maxtempC'] as num?)?.toDouble(),
      mintempC: (json['mintempC'] as num?)?.toDouble(),
      avgtempC: (json['avgtempC'] as num?)?.toDouble(),
      maxwindKph: (json['maxwindKph'] as num?)?.toDouble(),
      totalprecipMm: (json['totalprecipMm'] as num?)?.toDouble(),
      totalprecipIn: (json['totalprecipIn'] as num?)?.toDouble(),
      avgvisKm: json['avgvisKm'] as int?,
      avghumidity: json['avghumidity'] as int?,
      dailyWillItRain: json['dailyWillItRain'] as int?,
      dailyChanceOfRain: json['dailyChanceOfRain'] as int?,
      dailyWillItSnow: json['dailyWillItSnow'] as int?,
      dailyChanceOfSnow: json['dailyChanceOfSnow'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      uv: json['uv'] as int?,
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'maxtempC': instance.maxtempC,
      'mintempC': instance.mintempC,
      'avgtempC': instance.avgtempC,
      'maxwindKph': instance.maxwindKph,
      'totalprecipMm': instance.totalprecipMm,
      'totalprecipIn': instance.totalprecipIn,
      'avgvisKm': instance.avgvisKm,
      'avghumidity': instance.avghumidity,
      'dailyWillItRain': instance.dailyWillItRain,
      'dailyChanceOfRain': instance.dailyChanceOfRain,
      'dailyWillItSnow': instance.dailyWillItSnow,
      'dailyChanceOfSnow': instance.dailyChanceOfSnow,
      'condition': instance.condition,
      'uv': instance.uv,
    };

Astro _$AstroFromJson(Map<String, dynamic> json) => Astro(
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      moonPhase: json['moonPhase'] as String?,
      moonIllumination: json['moonIllumination'] as String?,
    );

Map<String, dynamic> _$AstroToJson(Astro instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moonPhase': instance.moonPhase,
      'moonIllumination': instance.moonIllumination,
    };

Hour _$HourFromJson(Map<String, dynamic> json) => Hour(
      timeEpoch: json['timeEpoch'] as int?,
      time: json['time'] as String?,
      tempC: (json['tempC'] as num?)?.toDouble(),
      isDay: json['isDay'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windKph: (json['windKph'] as num?)?.toDouble(),
      windDegree: json['windDegree'] as int?,
      windDir: json['windDir'] as String?,
      pressureMb: json['pressureMb'] as int?,
      pressureIn: (json['pressureIn'] as num?)?.toDouble(),
      precipMm: (json['precipMm'] as num?)?.toDouble(),
      precipIn: (json['precipIn'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      cloud: json['cloud'] as int?,
      feelslikeC: (json['feelslikeC'] as num?)?.toDouble(),
      windchillC: (json['windchillC'] as num?)?.toDouble(),
      heatindexC: (json['heatindexC'] as num?)?.toDouble(),
      dewpointC: (json['dewpointC'] as num?)?.toDouble(),
      willItRain: json['willItRain'] as int?,
      chanceOfRain: json['chanceOfRain'] as int?,
      willItSnow: json['willItSnow'] as int?,
      chanceOfSnow: json['chanceOfSnow'] as int?,
      visKm: json['visKm'] as int?,
      visMiles: json['visMiles'] as int?,
      gustMph: (json['gustMph'] as num?)?.toDouble(),
      gustKph: (json['gustKph'] as num?)?.toDouble(),
      uv: json['uv'] as int?,
    );

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'timeEpoch': instance.timeEpoch,
      'time': instance.time,
      'tempC': instance.tempC,
      'isDay': instance.isDay,
      'condition': instance.condition,
      'windKph': instance.windKph,
      'windDegree': instance.windDegree,
      'windDir': instance.windDir,
      'pressureMb': instance.pressureMb,
      'pressureIn': instance.pressureIn,
      'precipMm': instance.precipMm,
      'precipIn': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslikeC': instance.feelslikeC,
      'windchillC': instance.windchillC,
      'heatindexC': instance.heatindexC,
      'dewpointC': instance.dewpointC,
      'willItRain': instance.willItRain,
      'chanceOfRain': instance.chanceOfRain,
      'willItSnow': instance.willItSnow,
      'chanceOfSnow': instance.chanceOfSnow,
      'visKm': instance.visKm,
      'visMiles': instance.visMiles,
      'gustMph': instance.gustMph,
      'gustKph': instance.gustKph,
      'uv': instance.uv,
    };

Alerts _$AlertsFromJson(Map<String, dynamic> json) => Alerts(
      alert: (json['alert'] as List<dynamic>?)
          ?.map((e) => Alert.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlertsToJson(Alerts instance) => <String, dynamic>{
      'alert': instance.alert,
    };

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
      headline: json['headline'] as String?,
      msgtype: json['msgtype'] as String?,
      severity: json['severity'] as String?,
      urgency: json['urgency'] as String?,
      areas: json['areas'] as String?,
      category: json['category'] as String?,
      certainty: json['certainty'] as String?,
      event: json['event'] as String?,
      note: json['note'] as String?,
      effective: json['effective'] as String?,
      expires: json['expires'] as String?,
      desc: json['desc'] as String?,
      instruction: json['instruction'] as String?,
    );

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'headline': instance.headline,
      'msgtype': instance.msgtype,
      'severity': instance.severity,
      'urgency': instance.urgency,
      'areas': instance.areas,
      'category': instance.category,
      'certainty': instance.certainty,
      'event': instance.event,
      'note': instance.note,
      'effective': instance.effective,
      'expires': instance.expires,
      'desc': instance.desc,
      'instruction': instance.instruction,
    };
