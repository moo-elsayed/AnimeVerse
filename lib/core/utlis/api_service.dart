import 'dart:developer';

import 'package:dio/dio.dart';
import '../../shared_preferences_manager.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://anime.apiclub.site/';

  Future<Response> get({
    required String url,
  }) async {
    String? apiKey = await getApiKey();
    log(apiKey!);
    var response = await dio.get(
      url,
      options: Options(headers: {
        'Authorization': 'Bearer $apiKey', // Bearer Token
        'X-API-Key': apiKey, // Custom header
      }),
    );
    return response;
  }
}

Future<String?> getApiKey() async {
  return await SharedPreferencesManager.getApiKey();
}
