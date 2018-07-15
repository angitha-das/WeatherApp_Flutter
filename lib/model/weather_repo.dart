import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_app/json/response.dart';

import 'package:weather_app/model/model.dart';
import 'package:weather_app/const.dart';

import 'package:geolocation/geolocation.dart';

class WeatherRepo {
  final http.Client client;

  WeatherRepo({this.client});

  Future<WeatherModel> updateWeather(LocationResult result) async{
    String url;
    if(result != null){
      url = 'http://api.openweathermap.org/data/2.5/weather?q=london&APPID=32bb7ff51531486db457f78a3fbe331d' ;
    }else{
      url = 'http://api.openweathermap.org/data/2.5/weather?q=london&APPID=32bb7ff51531486db457f78a3fbe331d' ;
    }

     final response = await client.get(url);
     return WeatherModel.fromResponse(BaseResponse.fromJson(json.decode(response.body)));
  }

  Future<LocationResult> updateLocation() async {
    Future<LocationResult> result = Geolocation.lastKnownLocation();
    return result;
  }

  Future<bool> getGps() async {
    final GeolocationResult result = await Geolocation.isLocationOperational();
    if (result.isSuccessful)
      return true;
    else
      return false;
  }
}