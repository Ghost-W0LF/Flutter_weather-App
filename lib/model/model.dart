import 'package:meta/meta.dart';
import 'dart:convert';

class Weather {
  final List<ListElement> list;
  final City city;

  Weather({
    required this.list,
    required this.city,
  });

  factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city.toJson(),
      };
}

class City {
  final String name;

  final String country;

  final int sunrise;
  final int sunset;

  City({
    required this.name,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class ListElement {
  final int dt;
  final MainClass main;
  final List<WeatherElement> oeather;
  final Clouds clouds;

  final Sys sys;
  final DateTime dtTxt;


  ListElement({
    required this.dt,
    required this.main,
    required this.oeather,
    required this.clouds,

    required this.sys,
    required this.dtTxt,

  });

  factory ListElement.fromRawJson(String str) =>
      ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        oeather: List<WeatherElement>.from(
            json["weather"].map((x) => WeatherElement.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),

        sys: Sys.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),

      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(oeather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "sys": sys.toJson(),
        "dt_txt": dtTxt.toIso8601String(),

      };
}

class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromRawJson(String str) => Clouds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class MainClass {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  MainClass({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory MainClass.fromRawJson(String str) =>
      MainClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}


class Sys {
  final Pod pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromRawJson(String str) => Sys.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]]!,
      );

  Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
      };
}

enum Pod { D, N }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class WeatherElement {
  final int id;
  final MainEnum main;
  final String description;
  final String icon;

  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherElement.fromRawJson(String str) =>
      WeatherElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: mainEnumValues.map[json["main"]]!,
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": description,
        "icon": icon,
      };
}

enum MainEnum { CLEAR, CLOUDS, RAIN }

final mainEnumValues = EnumValues({
  "Clear": MainEnum.CLEAR,
  "Clouds": MainEnum.CLOUDS,
  "Rain": MainEnum.RAIN
});


class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
