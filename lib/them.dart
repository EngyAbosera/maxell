import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get headerStyle {
  return GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
    ),
  );
}

TextStyle get profileTextStyle {
  return GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}
TextStyle get subProfileTextStyle {
  return GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );
}

TextStyle get subHeaderStyle {
  return GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get headerStylePage {
  return GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  );
}

class Themes {
  static const primaryColor = Color.fromRGBO(36, 101, 241, 1);
  static const accentColor = Color.fromRGBO(36, 101, 241, 0.7);
}
