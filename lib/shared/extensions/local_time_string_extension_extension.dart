import 'package:intl/intl.dart' show DateFormat;

extension LocalTimeStringExtensionExtension on String {
  String toFormattedDateTime() {
    // Parse the local time string to a DateTime object.
    final dateTime = DateTime.parse(this);

    // Format the date in the format of "day name, yyyy-MM-dd".
    final dateFormatter = DateFormat('EEEE, yyyy-MM-dd');
    final date = dateFormatter.format(dateTime);

    // Format the time in the format of "HH:mm".
    final timeFormatter = DateFormat('HH:mm');
    final time = timeFormatter.format(dateTime);

    // Combine the formatted date and time.
    return '$date at $time';
  }

  String toDayOfWeek() {
    // Parse the local time string to a DateTime object.
    final dateTime = DateTime.parse(this);

    // Format the date in the format of "day name".
    final dateFormatter = DateFormat('EEEE');
    final dayOfWeek = dateFormatter.format(dateTime);

    // Return the formatted day of the week.
    return dayOfWeek;
  }

  String toHour({bool is12HourFormat = false}) {
    // Parse the local time string to a DateTime object.
    final dateTime = DateTime.parse(this);

    // Format the time in the 12-hour or 24-hour format.
    final timeFormatter = DateFormat(is12HourFormat ? 'h:mm a' : 'HH:mm');
    final hour = timeFormatter.format(dateTime);

    // Return the formatted hour.
    return hour;
  }
}
