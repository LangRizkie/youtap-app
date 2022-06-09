import 'package:application/modules/global.module.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palettes {
  static Color black = const Color(0xFF363434);
  static Color whitesmoke = const Color(0xFFF5F5F5);
  static Color nyctophile = const Color(0xFF080E2C);
  static Color mint = const Color(0xFF44EABB);
  static Color cold = const Color(0xFFF3FDFB);
  static Color aqua = const Color(0xFFD8E8E4);
  static Color naturally = const Color(0xFFCFD1DA);
  static Color solar = const Color(0xFFFFC16C);
}

class ThemeApp {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Palettes.whitesmoke,
      primaryColor: Palettes.black,
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      foregroundColor: Palettes.black,
      backgroundColor: Palettes.whitesmoke,
      elevation: 0,
    );
  }

  static TextTheme get _textTheme {
    final textTheme = Theme.of(Global.context!).textTheme;
    return GoogleFonts.nunitoSansTextTheme(textTheme);
  }
}
