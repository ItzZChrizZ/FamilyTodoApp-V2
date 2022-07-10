// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Utils {
  static showSnackbar(BuildContext context, String text) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));

  static DateTime toDateTime(Timestamp value) {
    if (value == null) return DateTime.now();

    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime date) {
    if (date == null) return null;
    return date.toUtc();
  }
}
