import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Global {
  static BuildContext? context;
  static String? apiKey = dotenv.env['API_KEY'];
  static String? apiUrl = dotenv.env['API_URL'];
  static String? imageUrl = dotenv.env['IMAGE_URL'];

  static String? getPoster(String? path) => path != null ? (imageUrl! + path) : null;
  static Future getJSON(String? path) async =>
      await rootBundle.loadString(path!).then((value) => json.decode(value));
  static String isAdult(bool isAdult) => isAdult ? '21+' : '13+';
}
