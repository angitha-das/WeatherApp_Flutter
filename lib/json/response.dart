import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse extends Object with _$BaseResponseSerializerMixin{
 final Coord coord;
 final List<Weather> weather;
 final String base;
 final Main main;
 final int visibility;

 @JsonKey(nullable: true)
 final Wind wind;

 final Clouds clouds;
 final int dt;
 final Sys sys;
 final int id;
 final String name;
 final int cod;

 BaseResponse(
   this.coord,
   this.weather,
   this.base,
   this.main,
   this.visibility,
   this.wind,
   this.clouds,
   this.dt,
   this.sys,
   this.id,
   this.name,
   this.cod
 );

 factory BaseResponse.fromJson(Map<String, dynamic> json) =>  _$BaseResponseFromJson(json);
}

@JsonSerializable()
class Coord extends Object with _$CoordSerializerMixin{
  final double lon;
  final double lat;

  Coord(
   this.lon,
   this.lat,
 );

 factory Coord.fromJson(Map<String, dynamic> json) =>  _$CoordFromJson(json);
}

@JsonSerializable()
class Clouds extends Object with _$CloudsSerializerMixin{
  final int all;
  
  Clouds(
   this.all,
 );

 factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@JsonSerializable()
class Main extends Object  with _$MainSerializerMixin {
final double temp;
final double pressure;
final int humidity;
@JsonKey(name: "temp_min")
final double tempMin;
@JsonKey(name: "temp_max")
final double tempMax;

Main(
   this.temp,
   this.pressure,
   this.humidity,
   this.tempMin,
   this.tempMax
 );

 factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@JsonSerializable()
class Sys extends Object with _$SysSerializerMixin{
final int type;
final int id;
final double message;
final String country;
final int sunrise;
final int sunset;

Sys(
   this.type,
   this.id,
   this.message,
   this.country,
   this.sunrise,
   this.sunset
 );

factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@JsonSerializable()
class Weather extends Object with _$WeatherSerializerMixin{
final int id;
final String main;
final String description;
final String icon;

Weather(
   this.id,
   this.main,
   this.description,
   this.icon
 );

 factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@JsonSerializable()
class Wind extends Object with _$WindSerializerMixin{
final double speed;
final double deg;

Wind(
   this.speed,
   this.deg
 );

 factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

