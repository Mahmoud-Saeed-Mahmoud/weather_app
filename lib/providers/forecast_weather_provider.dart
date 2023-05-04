import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/forecast_weather.dart';

import '../datasources/remote/api.dart';
import '../models/request_type_enum.dart';

class ForecastWeatherProvider
    extends StateNotifier<AsyncValue<ForecastWeather>> {
  ForecastWeatherProvider(this._api) : super(const AsyncValue.loading());
  final Api _api;

  Future<void> getForecastWeather(Map<String, String> query) async {
    state = const AsyncValue.loading();
    try {
      final respnose = await _api.gettWeather(
        typeEnum: RequestTypeEnum.forecast,
        query: query,
      );
      final forecasttWeather = ForecastWeather.fromJson(respnose.data);
      state = AsyncValue.data(forecasttWeather);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final forecasttWeatherProvider = StateNotifierProvider.autoDispose<
    ForecastWeatherProvider, AsyncValue<ForecastWeather>>(
  (ref) {
    ref.keepAlive();
    return ForecastWeatherProvider(
      ref.watch(apiProvider),
    );
  },
);
