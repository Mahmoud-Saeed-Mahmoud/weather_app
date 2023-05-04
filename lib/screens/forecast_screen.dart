import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_mode_provider.dart';
import '../widgets/forecast_body_widget.dart';

class ForecastScreen extends ConsumerWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            colorFilter:
                const ColorFilter.mode(Colors.black12, BlendMode.darken),
            image: AssetImage(ref.watch(themeModeProvider) == ThemeMode.dark
                ? 'assets/images/mountains_night_moon.png'
                : 'assets/images/mountains_day_sun.png'),
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: const Padding(
          padding: EdgeInsets.only(top: 70.0),
          child: ForecastBodyWidget(),
        ),
      ),
    );
  }
}
