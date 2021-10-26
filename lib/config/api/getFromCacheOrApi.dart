import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<dynamic, dynamic>> getFromCacheOrApi(
    String url, String cacheKey, SharedPreferences sharedPreferences,
    {bool getFromCache = true}) async {
  Dio dio = new Dio();

  var response;

  String cachedResponse = sharedPreferences.getString(cacheKey) ?? '';

  if (cachedResponse != '' && getFromCache == true) {
    response = jsonDecode(cachedResponse);
  } else {
    response = await dio.get(url);
  }

  Map<dynamic, dynamic> responseMapped = {
    'statusCode': '',
    'cachedResponse': false,
    'data': {},
  };

  if (response is Response) {
    responseMapped['statusCode'] = response.statusCode;
    responseMapped['data'] = response.data;
    responseMapped['cachedResponse'] = false;
  } else {
    responseMapped['statusCode'] = response['statusCode'];
    responseMapped['data'] = response['data'];
    responseMapped['cachedResponse'] = true;
  }

  return responseMapped;
}
