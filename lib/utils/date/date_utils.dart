import 'package:intl/intl.dart';

class MyDateUtils {
  static String convertStringServer(dynamic date,
      {format = "dd/MM/yyyy HH:mm", String defaultValue}) {
    if (date == null || date == "") {
      return defaultValue;
    }
    if (date.toString().contains("/")) {
      return date.toString();
    } else {
      if (date == null || date == "" || date is List) {
        return null;
      } else {
        DateTime now = DateTime.now();
        if (date is String) {
          now = DateTime.parse(date);
        } else {
          now = date;
        }

        String formattedDate = DateFormat(format).format(now);
        return formattedDate;
      }
    }
  }

  static DateTime convertStringToDateTime(String date,
      {bool isDateTime = false, String format = "dd/MM/yyyy HH:mm"}) {
    if (date == null || date == "" || date == "null") {
      return null;
    } else {
      if (date.contains("Z")) {
        DateTime tempDate =
            DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
        return tempDate;
      } else {
        if (date.contains("/")) {
          DateTime tempDate;
          if (date.contains(":")) {
            tempDate = DateFormat(format).parse(date);
          } else {
            tempDate = DateFormat(format).parse("$date 00:00");
          }

          return tempDate;
        } else {
          DateTime tempDate = isDateTime
              ? DateTime.parse(date)
              : new DateFormat(format).parse(date);
          return tempDate;
        }
      }
    }
  }
}
