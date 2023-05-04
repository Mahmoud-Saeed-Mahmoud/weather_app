import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/current_weather.dart';

import '../datasources/remote/api.dart';
import '../models/request_type_enum.dart';

class CurrentWeatherProvider extends StateNotifier<AsyncValue<CurrentWeather>> {
  CurrentWeatherProvider(this._api) : super(const AsyncValue.loading());
  final Api _api;

  Future<void> getCurrentWeather(Map<String, String> query) async {
    state = const AsyncValue.loading();
    try {
      final respnose = await _api.gettWeather(
        typeEnum: RequestTypeEnum.current,
        query: query,
      );
      final currentWeather = CurrentWeather.fromJson(respnose.data);
      state = AsyncValue.data(currentWeather);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final currentWeatherProvider = StateNotifierProvider.autoDispose<
    CurrentWeatherProvider, AsyncValue<CurrentWeather>>(
  (ref) {
    ref.keepAlive();
    return CurrentWeatherProvider(
      ref.watch(apiProvider),
    );
  },
);
