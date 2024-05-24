import 'package:intl/intl.dart';

class DateTimeFormatter {
  /// Returns a date time formatted like "25 June, 2021"
  String formatDate(DateTime date) {
    return DateFormat('d MMMM, y').format(date);
  }

  /// Returns a date time formatted like "25 June, 2021 12:00AM"
  String formatDateTimeIn12Hr(DateTime date) {
    return DateFormat('d MMMM, y h:mma').format(date);
  }

  /// Returns a date time formatted like "25 June, 2021 00:00"
  String formatDateTimeIn24Hr(DateTime date) {
    return DateFormat('d MMMM, y HH:mm').format(date);
  }

  /// Returns a date time formatted like "Feb 27, 2024 - 10:00 AM". Uses default locale to format the time.
  String formatDateTimeWithDefaultLocale(DateTime dateTime, [String dateTimeSeparator = ' - ']) {
    String formattedDate = DateFormat('MMM d, y').format(dateTime);
    String formattedTime = DateFormat.jm().format(dateTime);
    String formattedDateTime = '$formattedDate$dateTimeSeparator$formattedTime';
    return formattedDateTime;
  }

// format date in this format: 2024.02.27 10:00. 24hr format. The default separator is '.' and ' '.
  String formatDateWithCustomSeparators(DateTime date, [String dateSeparator = '.', String dateTimeSeparator = ' ']) {
    return "${date.year}$dateSeparator${date.month}$dateSeparator${date.day}$dateTimeSeparator${date.hour}:${date.minute}";
  }

  /// Returns a date time formatted in 12hr time. eg "12:00AM"
  String formatTimeIn12Hr(DateTime date) {
    return DateFormat('h:mma').format(date);
  }

  /// Returns a date time formatted in 24hr time. eg "00:00"
  String formatTimeIn24Hr(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}
