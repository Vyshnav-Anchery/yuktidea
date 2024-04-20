import 'package:flutter/material.dart';

class AppTheme {
  static Color appPrimaryColor = const Color.fromARGB(255, 217, 137, 106);

  static Color textfieldColor = const Color.fromARGB(57, 182, 176, 176);

  static BoxDecoration cardDecoration = const BoxDecoration(
    color: Color(0xFF292929),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );
}
