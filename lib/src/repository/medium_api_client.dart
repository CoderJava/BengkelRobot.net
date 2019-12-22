import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:website_bengkel_robot/src/model/latestpost/latest_post_response.dart';
import 'package:website_bengkel_robot/src/util/dio_logging_interceptor.dart';

class MediumApiClient {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://bengkelrobot.net:8001';

  MediumApiClient() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<LatestPostResponse> getLatestPostResponse() async {
    try {
      var response = await _dio.get('/latest-post');
      return LatestPostResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint('Error occured $error with stacktrace $stacktrace');
      return LatestPostResponse.withError('$error');
    }
  }
}