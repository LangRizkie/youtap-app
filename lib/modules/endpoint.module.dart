import 'package:application/modules/global.module.dart';
import 'package:dio/dio.dart';

class Endpoint {
  static Dio dio = Dio();

  static Future<Response> get(url, { Map<String, dynamic>? queryParameters }) async {
    Map<String, dynamic> queries = {
      ...?queryParameters,
      'api_key': Global.apiKey
    };

    Response response =
        await dio.get(Global.apiUrl! + url, queryParameters: queries);

    return response;
  }

  static Future<Response> post(url, Map body) async {
    Response response = await dio.post(Global.apiUrl! + url, data: body);

    return response;
  }
}
