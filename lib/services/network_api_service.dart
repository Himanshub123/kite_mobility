import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:kite_mobility/services/app_exceptions.dart';
import 'package:kite_mobility/services/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseAPIService {
  @override
  Future<dynamic> getApi(String url) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    if (kDebugMode) {
      print("Network request url: $url");
      print("Network request data: $data");
    }
    dynamic responseData;
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: <String, String>{
                'Content-Type': 'application/json',
              },
              body: data)
          .timeout(const Duration(seconds: 10));
      responseData = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print("Network response: $responseData");
    }
    return responseData;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 420:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error accoured while communicating with server ${response.statusCode} ${response.body}');
    }
  }
}
