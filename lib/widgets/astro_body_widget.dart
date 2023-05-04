import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/moon_phases_enum.dart';
import 'astro_per_day_widget.dart';

import '../providers/forecast_weather_provider.dart';

class AstroBodyWidget extends ConsumerWidget {
  const AstroBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ref.watch(forecasttWeatherProvider).when(
            data: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('today', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                    'assets/images/${MoonPhasesEnum.moonPhaseImageMap[MoonPhasesEnum.values.firstWhere((element) => data.forecast!.forecastday![0].astro!.moonPhase == element.value)]}.png'),
                AstroPerDayWidget(
                    astroData: data.forecast!.forecastday![0].astro!),
                const SizedBox(
                  height: 10,
                ),
                Text('tomorrow', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                    'assets/images/${MoonPhasesEnum.moonPhaseImageMap[MoonPhasesEnum.values.firstWhere((element) => data.forecast!.forecastday![1].astro!.moonPhase == element.value)]}.png'),
                AstroPerDayWidget(
                    astroData: data.forecast!.forecastday![1].astro!),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'after tomorrow',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Image.asset(
                    'assets/images/${MoonPhasesEnum.moonPhaseImageMap[MoonPhasesEnum.values.firstWhere((element) => data.forecast!.forecastday![2].astro!.moonPhase == element.value)]}.png'),
                AstroPerDayWidget(
                    astroData: data.forecast!.forecastday![2].astro!),
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
