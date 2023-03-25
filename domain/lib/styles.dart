import 'package:flutter/material.dart';

class ThemeStyles {
  static Color mainColor = const Color.fromRGBO(40, 46, 56, 1);
  static const Color fontPrimary = const Color.fromRGBO(255, 255, 255, 1);
  static Color secondaryColor = const Color.fromRGBO(49, 56, 68, 1);
  static Color actionColor = const Color.fromRGBO(255, 91, 91, 1);

  static TextStyle regularHeading = const TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    letterSpacing: 2,
    fontSize: 20,
    fontFamily: "Loto",
    fontWeight: FontWeight.w700,
  );

  static TextStyle innerHeading = const TextStyle(
    color: Color.fromRGBO(255, 255, 255, 0.72),
    fontSize: 14,
    letterSpacing: 2,
    fontFamily: "Loto",
    fontWeight: FontWeight.w600,
  );

  static TextStyle regularParagraph = const TextStyle(
    color: Color.fromRGBO(255, 255, 255, 0.72),
    fontSize: 14,
    letterSpacing: 2,
    fontFamily: "Loto",
    fontWeight: FontWeight.w400,
  );

  static TextStyle whiteParagraph = const TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontSize: 14,
    letterSpacing: 2,
    fontFamily: "Loto",
    fontWeight: FontWeight.w400,
  );
}
