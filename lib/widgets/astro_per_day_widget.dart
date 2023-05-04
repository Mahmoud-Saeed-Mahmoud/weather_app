import 'package:flutter/material.dart';
import '../models/astro.dart';

class AstroPerDayWidget extends StatelessWidget {
  const AstroPerDayWidget({
    super.key,
    required this.astroData,
  });

  final Astro astroData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Text(
                  'Sunrise : ',
                ),
                Text(
                  astroData.sunrise!,
                ),
                const VerticalDivider(),
                const Text(
                  'Sunset : ',
                ),
                Text(
                  astroData.sunset!,
                ),
                const VerticalDivider(),
                const Text(
                  'Moonrise : ',
                ),
                Text(
                  astroData.moonrise!,
                ),
                const VerticalDivider(),
                const Text(
                  'Moonset : ',
                ),
                Text(
                  astroData.moonset!,
                ),
                const VerticalDivider(),
                const Text(
                  'Moon Illumination : ',
                ),
                Text(
                  '${astroData.moonIllumination!}%',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
