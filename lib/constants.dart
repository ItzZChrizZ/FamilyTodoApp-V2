import 'package:flutter/material.dart';

class Constants {
  static TextStyle title = const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(54, 69, 79, 1),
      fontWeight: FontWeight.bold);

  static TextStyle titleRed = const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(220, 20, 60, 1),
      fontWeight: FontWeight.bold);
  static TextStyle titleWhite = const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(245, 245, 245, 1),
      fontWeight: FontWeight.bold);

  static TextStyle regulerText = const TextStyle(
    fontSize: 18,
    color: Color.fromRGBO(54, 69, 79, 1),
    height: 1.5,
  );
  static TextStyle regulerTextWhite = const TextStyle(
    fontSize: 18,
    color: Color.fromRGBO(245, 245, 245, 1),
    height: 1.5,
  );

  static TextStyle subTitle = const TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(54, 69, 79, 1),
    fontWeight: FontWeight.bold,
  );

  static Color backgroundColor = const Color.fromRGBO(245, 245, 245, 1);
  static Color iconColors = const Color.fromRGBO(255, 250, 250, 1);
  static Color navBarColor = const Color.fromRGBO(54, 69, 79, 1);
  static Color appBarColor = const Color.fromRGBO(54, 69, 79, 1);
  static Color checkBoxColor = const Color.fromARGB(255, 101, 54, 220);
}