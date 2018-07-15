import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'assets/icons.dart';
import 'package:flutter_google_places_autocomplete/flutter_google_places_autocomplete.dart';

const kGoogleApiKey = "API_KEY";
// to get places detail (lat/lng)
GoogleMapsPlaces _places = new GoogleMapsPlaces(kGoogleApiKey);

void main() {
  runApp(new MaterialApp(
    home: new MyHomePage(),
  ));
}

class Weather extends StatelessWidget {
  final Map<String, dynamic> data;
  Weather(this.data);
  Widget build(BuildContext context) {
    
    String temp = (data['main']['temp'] - 273).toInt().toString() + '°C';
    String place = data['name'] +',' +data['sys']['country'];
  
    String icon = data['weather'][0]['icon'];
    String desc = 'So, its ' + data['weather'][0]['main'];
    
    
    return new Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,  
    children: <Widget>[
      new Text(weatherIcon('${(icon)}'), style: new TextStyle(
            fontFamily: 'WeatherIcons-Regular',
            fontSize: 120.0,
          )),
      new Text('${(temp)}', style: new TextStyle(
            fontFamily: 'WeatherIcons-Regular',
            fontSize: 100.0,
          )),
      new Text('${(place)}' ,style: new TextStyle(
            fontFamily: 'WeatherIcons-Regular',
            fontSize: 20.0,
          )),//Place
      new Text('${(desc)}' ,style: new TextStyle(
            fontFamily: 'WeatherIcons-Regular',
            fontSize: 40.0,
          )),//Place
  ],
);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Future<http.Response> _response;

  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    setState(() {
      _response = http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=kochi&APPID=<OPEN_WEATHER_APIKEY>'
      );
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new FutureBuilder(
          future: _response,
          builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
            if (!response.hasData)
              return new Text('Loading...');
            else if (response.data.statusCode != 200) {
              return new Text('Could not connect to weather service.');
            } else {
              Map<String, dynamic> json = JSON.decode(response.data.body);
              if (json['cod'] == 200)
                return new Weather(json);
              else
                return new Text('Weather service error: $json.');
            }
          }
        )
      ),
    );
  }
}