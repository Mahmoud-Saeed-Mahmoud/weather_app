// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'alerts.dart';
import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class ForecastWeather {
  Location? location;
  Current? current;
  Forecast? forecast;
  Alerts? alerts;

  ForecastWeather({this.location, this.current, this.forecast, this.alerts});

  ForecastWeather.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
    alerts = json['alerts'] != null ? Alerts.fromJson(json['alerts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    if (alerts != null) {
      data['alerts'] = alerts!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ForecastWeather(location: $location, current: $current, forecast: $forecast, alerts: $alerts)';
  }
}
