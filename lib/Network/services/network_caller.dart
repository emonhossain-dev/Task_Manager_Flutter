import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final String errorMessage;
  final Map<String, dynamic>? responseData;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.errorMessage = 'Something went wrong!',
    this.responseData,
  });
}

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);
      debugPrint('Response Status Code: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        // Handle successful response
        final decodeResponse = jsonDecode(response.body);
        debugPrint('Decoded Response: $decodeResponse');

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeResponse,
        );
      } else {
        // Handle error response
        debugPrint('Error: ${response.statusCode}');
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      // Handle exceptions
      debugPrint('Exception: $e');
      return NetworkResponse(
        isSuccess: false,
        errorMessage: e.toString(),
        statusCode: -1,
      );
    }
  }


  static Future<NetworkResponse> PostRequest(String url, Map<String, dynamic> body) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await post(uri, body: jsonEncode(body), headers: {
        'Content-Type': 'application/json',
      });
      debugPrint('Response Status Code: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');
      final decodeResponse = jsonDecode(response.body);
      if (response.statusCode == 200 && decodeResponse['status'] == 'success') {
        // Handle successful response




        debugPrint('Decoded Response: $decodeResponse');

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeResponse,
        );


      } else {
        // Handle error response
        debugPrint('Error: ${response.statusCode}');
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      // Handle exceptions
      debugPrint('Exception: $e');
      return NetworkResponse(
        isSuccess: false,
        errorMessage: e.toString(),
        statusCode: -1,
      );
    }
  }
}
