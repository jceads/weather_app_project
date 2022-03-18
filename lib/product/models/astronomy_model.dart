import 'location_model.dart';

class AstronomyModel {
  Location? location;
  Astronomy? astronomy;

  AstronomyModel({this.location, this.astronomy});

  AstronomyModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    astronomy = json['astronomy'] != null
        ? Astronomy.fromJson(json['astronomy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (astronomy != null) {
      data['astronomy'] = astronomy!.toJson();
    }
    return data;
  }
}

class Astronomy {
  Astro? astro;

  Astronomy({this.astro});

  Astronomy.fromJson(Map<String, dynamic> json) {
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (astro != null) {
      data['astro'] = astro!.toJson();
    }
    return data;
  }
}

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

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['moon_illumination'] = moonIllumination;
    return data;
  }
}
