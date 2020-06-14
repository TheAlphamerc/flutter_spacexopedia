import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spacexopedia/exceptions/exceptions.dart';

class DioClient {
  final Dio _dio;
  final String baseEndpoint;
  final bool logging;

  DioClient(
    this._dio, {
    this.baseEndpoint,
    this.logging = false,
  })  : assert(baseEndpoint != null),
        assert(logging != null) {
    if (logging) {
      _dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          responseHeader: true,
          requestBody: true,
          responseBody: true,
        ),
      );
    }
  }

  Future<Response<T>> get<T>(
    String endpoint, {
    Options options,
    queryParameters,
  }) async {
    try {
      return await _dio.get(
        '$baseEndpoint$endpoint',
        // options: _createOptions(options, session),
        queryParameters: queryParameters,
      );
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response<T>> post<T>(
    String endpoint, {
    data,
    Options options,
  }) async {
    try {
      return await _dio.post(
        '$baseEndpoint$endpoint',
        data: data,
      );
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

 
  Map<String, dynamic> getJsonBody<T>(Response<T> response) {
    try {
      return response.data as Map<String, dynamic>;
    } on Exception catch (e, stackTrace) {
      debugPrint(stackTrace.toString());
      throw Exception('Bad body format');
    }
  }

  List<dynamic> getJsonBodyList<T>(Response<T> response) {
    try {
      return response.data as List<dynamic>;
    } on Exception catch (e, stackTrace) {
      debugPrint(stackTrace.toString());
      throw SchemeConsistencyException('Bad body format');
    }
  }

  Exception _handleError(DioError e) {
    switch (e.response.statusCode) {
      case 404:
        return ApiDataNotFoundException();
      case 500:
        return ApiInternalServerException();
      default:
        return ApiException(e.message);
    }
  }
}
