import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/forecast_weather_provider.dart';
import '../screens/astro_screen.dart';
import '../shared/extensions/local_time_string_extension_extension.dart';
import '../shared/style/text_style.dart';

import '../providers/current_weather_provider.dart';
import '../screens/forecast_screen.dart';

class HomeBodyWidget extends ConsumerWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentWeatherProvider).when(
          data: (data) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${data.location!.region!}\n${data.location!.country!}\n\n\n',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        TextSpan(
                          text: 'last updated\n',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        TextSpan(
                          text:
                              data.current!.lastUpdated!.toFormattedDateTime(),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Card(),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'https:${data.current!.condition!.icon}',
                        placeholder: (_, __) =>
                            const CircularProgressIndicator(),
                      ),
                      Text(
                        'its ${data.current!.condition!.text!}',
                        style: rubikText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    ' ${data.current!.tempC!}°C',
                    style: rubikText.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.air),
                            Text(
                              '${data.current!.windKph!} km/h',
                            ),
                            const Text(
                              'Wind',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Icon(Icons.water_drop),
                            Text(
                              '${data.current!.humidity!}%',
                            ),
                            const Text(
                              'Humidity',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Icon(Icons.cloud),
                            Text(
                              '${data.current!.cloud!}%',
                            ),
                            const Text(
                              'Cloud',
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Icon(Icons.visibility),
                            Text(
                              '${data.current!.visKm!} km',
                            ),
                            const Text(
                              'Visibility',
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Icon(Icons.device_thermostat),
                            Text(
                              '${data.current!.uv!}',
                            ),
                            const Text(
                              'UV',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 100),
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const AstroScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(-1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                            ),
                          )
                          .timeout(
                            Duration.zero,
                            onTimeout: () => ref
                                .read(forecasttWeatherProvider.notifier)
                                .getForecastWeather(
                              {
                                'q': 'auto:ip',
                                'alerts': 'yes',
                                'days': '3',
                              },
                            ),
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('Astro',
                              style: rubikText.copyWith(fontSize: 20)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ForecastScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                            ),
                          )
                          .timeout(
                            Duration.zero,
                            onTimeout: () => ref
                                .read(forecasttWeatherProvider.notifier)
                                .getForecastWeather(
                              {
                                'q': 'auto:ip',
                                'alerts': 'yes',
                                'days': '3',
                              },
                            ),
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forecast',
                              style: rubikText.copyWith(fontSize: 20)),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        );
  }
}
