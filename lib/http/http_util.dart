import 'package:dio/dio.dart';
import 'dart:async';

var dio = Dio();

class HttpUtil {
  static Future get(String url, {Map<String, dynamic> params}) async {
    var response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  static Future post(String url, {Map<String, dynamic> params}) async {
    var response = await dio.get(url, queryParameters: params);
    return response.data;
  }
}
