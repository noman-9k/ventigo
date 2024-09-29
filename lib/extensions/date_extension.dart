import 'dart:developer';

import 'package:flutter/material.dart';
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

  String formateDate() {
    return DateFormat('dd MMMM, yyyy').format(this);
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

  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day;
  }

  DateTime onlyDate() {
    return this;

    return DateTime(this.year, this.month, this.day);
  }

  Color getDayColor() {
    final day = int.parse(DateFormat('dd').format(this));
    final colors = [
      Color(0xFFDDFDF1),
      Color(0xFFFFFFC6),
      Color(0xFFDFF5FF),
      // Colors.green.withOpacity(0.2),
      // Colors.yellow.withOpacity(0.2),
      // Colors.cyanAccent.withOpacity(0.2),
    ];

    return colors[day % colors.length];
  }
}
