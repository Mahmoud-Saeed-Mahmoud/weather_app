// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'current.dart';
import 'location.dart';

class CurrentWeather {
  Location? location;
  Current? current;

  CurrentWeather({this.location, this.current});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() => 'CurrentWeather(location: $location, current: $current)';
}
