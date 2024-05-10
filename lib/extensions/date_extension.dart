import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String format(String format) {
    return DateFormat(format).format(this);
  }
}

extension SmallDate on DateTime {
  String smallDate() {
    return DateFormat('dd.MM.yyyy').format(this);
  }

  String smallDateWithTime() {
    return DateFormat('dd MMMM yyyy HH:mm').format(this);
  }

  String getDay() {
    return DateFormat('dd').format(this);
  }

  String getMonth() {
    return DateFormat('mm').format(this);
  }
}
