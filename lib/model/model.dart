import 'package:weather_app/json/response.dart';

class WeatherModel{
  final double temperature;
  final String city;
  final String country;
  final String weatherType;
  final String icon;

WeatherModel({
this.temperature,
this.city,
this.country,
this.weatherType,
this.icon});

WeatherModel.fromResponse(BaseResponse response): 
temperature = (response.main.temp - 273),
city = response.name,
country = response.sys.country,
weatherType = response.weather[0]?.description,
icon = response.weather[0]?.icon;

}