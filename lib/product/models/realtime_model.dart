class CurrentModel {
  Location? location;
  Current? current;

  CurrentModel({this.location, this.current});

  CurrentModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    return data;
  }
}

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

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  int? tempC;
  int? isDay;
  Condition? condition;
  int? windKph;
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
  double? gustKph;
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

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    visKm = json['vis_km'];
    uv = json['uv'];
    gustKph = json['gust_kph'];
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['vis_km'] = visKm;
    data['uv'] = uv;
    data['gust_kph'] = gustKph;
    if (airQuality != null) {
      data['air_quality'] = airQuality!.toJson();
    }
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  int? pm10;
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

  AirQuality.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    usEpaIndex = json['us-epa-index'];
    gbDefraIndex = json['gb-defra-index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['co'] = co;
    data['no2'] = no2;
    data['o3'] = o3;
    data['so2'] = so2;
    data['pm2_5'] = pm25;
    data['pm10'] = pm10;
    data['us-epa-index'] = usEpaIndex;
    data['gb-defra-index'] = gbDefraIndex;
    return data;
  }
}
