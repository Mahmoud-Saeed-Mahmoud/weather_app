import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/forecast_weather_provider.dart';
import 'hour_widget.dart';

class ForecastBodyWidget extends ConsumerWidget {
  const ForecastBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ref.watch(forecasttWeatherProvider).when(
            data: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('today', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 10,
                ),
                HourWidget(
                  hourData: data.forecast!.forecastday![0].hour!,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('tomorrow', style: Theme.of(context).textTheme.titleLarge),
                HourWidget(
                  hourData: data.forecast!.forecastday![1].hour!,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('after tomorrow',
                    style: Theme.of(context).textTheme.titleLarge),
                HourWidget(
                  hourData: data.forecast!.forecastday![2].hour!,
                ),
              ],
            ),
            error: (error, stackTrace) => Text(
              error.toString(),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
