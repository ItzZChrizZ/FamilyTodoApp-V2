// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'dart:async';
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

  static StreamTransformer<QuerySnapshot, List<T>> transformer<T>(
          T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
          final snaps = data.docs.map((doc) => doc.data()).toList();
          final users = snaps.map((json) => fromJson(json as Map<String, dynamic>)).toList();

          sink.add(users);
        },
      );
}
