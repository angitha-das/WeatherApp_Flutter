// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) =>
    new BaseResponse(
        json['coord'] == null
            ? null
            : new Coord.fromJson(json['coord'] as Map<String, dynamic>),
        (json['weather'] as List)
            ?.map((e) => e == null
                ? null
                : new Weather.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        json['base'] as String,
        json['main'] == null
            ? null
            : new Main.fromJson(json['main'] as Map<String, dynamic>),
        json['visibility'] as int,
        json['wind'] == null
            ? null
            : new Wind.fromJson(json['wind'] as Map<String, dynamic>),
        json['clouds'] == null
            ? null
            : new Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        json['dt'] as int,
        json['sys'] == null
            ? null
            : new Sys.fromJson(json['sys'] as Map<String, dynamic>),
        json['id'] as int,
        json['name'] as String,
        json['cod'] as int);

abstract class _$BaseResponseSerializerMixin {
  Coord get coord;
  List<Weather> get weather;
  String get base;
  Main get main;
  int get visibility;
  Wind get wind;
  Clouds get clouds;
  int get dt;
  Sys get sys;
  int get id;
  String get name;
  int get cod;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'coord': coord,
        'weather': weather,
        'base': base,
        'main': main,
        'visibility': visibility,
        'wind': wind,
        'clouds': clouds,
        'dt': dt,
        'sys': sys,
        'id': id,
        'name': name,
        'cod': cod
      };
}

Coord _$CoordFromJson(Map<String, dynamic> json) => new Coord(
    (json['lon'] as num)?.toDouble(), (json['lat'] as num)?.toDouble());

abstract class _$CoordSerializerMixin {
  double get lon;
  double get lat;
  Map<String, dynamic> toJson() => <String, dynamic>{'lon': lon, 'lat': lat};
}

Clouds _$CloudsFromJson(Map<String, dynamic> json) =>
    new Clouds(json['all'] as int);

abstract class _$CloudsSerializerMixin {
  int get all;
  Map<String, dynamic> toJson() => <String, dynamic>{'all': all};
}

Main _$MainFromJson(Map<String, dynamic> json) => new Main(
    (json['temp'] as num)?.toDouble(),
    (json['pressure'] as num)?.toDouble(),
    json['humidity'] as int,
    (json['temp_min'] as num)?.toDouble(),
    (json['temp_max'] as num)?.toDouble());

abstract class _$MainSerializerMixin {
  double get temp;
  double get pressure;
  int get humidity;
  double get tempMin;
  double get tempMax;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'temp': temp,
        'pressure': pressure,
        'humidity': humidity,
        'temp_min': tempMin,
        'temp_max': tempMax
      };
}

Sys _$SysFromJson(Map<String, dynamic> json) => new Sys(
    json['type'] as int,
    json['id'] as int,
    (json['message'] as num)?.toDouble(),
    json['country'] as String,
    json['sunrise'] as int,
    json['sunset'] as int);

abstract class _$SysSerializerMixin {
  int get type;
  int get id;
  double get message;
  String get country;
  int get sunrise;
  int get sunset;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'id': id,
        'message': message,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset
      };
}

Weather _$WeatherFromJson(Map<String, dynamic> json) => new Weather(
    json['id'] as int,
    json['main'] as String,
    json['description'] as String,
    json['icon'] as String);

abstract class _$WeatherSerializerMixin {
  int get id;
  String get main;
  String get description;
  String get icon;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'main': main,
        'description': description,
        'icon': icon
      };
}

Wind _$WindFromJson(Map<String, dynamic> json) => new Wind(
    (json['speed'] as num)?.toDouble(), (json['deg'] as num)?.toDouble());

abstract class _$WindSerializerMixin {
  double get speed;
  double get deg;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'speed': speed, 'deg': deg};
}
