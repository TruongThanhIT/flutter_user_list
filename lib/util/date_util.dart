import 'package:intl/intl.dart';

class DateUtil {
  static const DATE_TIME_FORMAT_1 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const DATE_TIME_FORMAT_2 = 'dd/MM/yyyy';

  DateTime convertStringToDate(String dateStr) =>
      new DateFormat(DATE_TIME_FORMAT_1).parse(dateStr);

  String convertDateToString(DateTime date) =>
      new DateFormat(DATE_TIME_FORMAT_2).format(date);

  String formatDateTime(String date) {
    DateTime parseDate = new DateFormat(DATE_TIME_FORMAT_1).parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat(DATE_TIME_FORMAT_2);
    return outputFormat.format(inputDate);
  }
}
