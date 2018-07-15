import 'package:rx_command/rx_command.dart';
import 'package:geolocation/geolocation.dart';

import 'package:weather_app/model/model.dart';
import 'package:weather_app/model/weather_repo.dart';

class ModelCommand {
  final WeatherRepo weatherRepo;

  final RxCommand<Null, bool> getGpsCommand;
  final RxCommand<Null, LocationResult> updateLocationCommand;
  final RxCommand<LocationResult, WeatherModel> updateWeatherCommand;
  final RxCommand<bool, bool> radioCheckedCommand;

  ModelCommand._(
    this.weatherRepo,
    this.updateLocationCommand,
    this.updateWeatherCommand,
    this.getGpsCommand,
    this.radioCheckedCommand,
  );

  factory ModelCommand(WeatherRepo repo) {
    final _getGpsCommand = RxCommand.createAsync2<bool>(repo.getGps,null);

    final _radioCheckedCommand = RxCommand.createSync3<bool, bool>((b) => b);

    final _updateLocationCommand = RxCommand.createAsync2<LocationResult>(
        repo.updateLocation, _getGpsCommand.results);

    final _updateWeatherCommand =
        RxCommand.createAsync3<LocationResult,WeatherModel>(
          repo.updateWeather);

    _updateLocationCommand.results
        .listen((data) => _updateWeatherCommand(data));

    _updateWeatherCommand(null);

    return ModelCommand._(
      repo,
      _updateLocationCommand,
      _updateWeatherCommand,
      _getGpsCommand,
      _radioCheckedCommand,
    );
  }
}