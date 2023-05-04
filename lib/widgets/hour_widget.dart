import 'package:flutter/material.dart';
import '../shared/extensions/local_time_string_extension_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/hour.dart';

class HourWidget extends StatelessWidget {
  const HourWidget({
    super.key,
    required this.hourData,
  });

  final List<Hour> hourData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Card(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        hourData[index].time!.toHour(is12HourFormat: true),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('${hourData[index].feelslikeC}°C '),
                      const SizedBox(
                        height: 10,
                      ),
                      CachedNetworkImage(
                        imageUrl: 'https:${hourData[index].condition!.icon!}',
                        placeholder: (_, __) =>
                            const CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        hourData[index].condition!.text!,
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (_, __) => const VerticalDivider(
                  indent: 20,
                  endIndent: 20,
                ),
                itemCount: hourData.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
