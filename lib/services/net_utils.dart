// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter_test_pln/utils/app_exception.dart';

class NetworkUtil {
  static NetworkUtil instance = NetworkUtil.internal();
  late Dio _dio;

  NetworkUtil.internal() {
    _dio = Dio();
  }

  factory NetworkUtil() => instance;

  Future<dynamic> post(String path,
      {Map<String, dynamic>? body,
      Map<String, String>? headers,
      Map<String, String>? param,
      encoding}) async {
    Map<String, String> headerJson = {
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
    if (headers != null) {
      headerJson.addAll(headers);
    }
    try {
      Response response = await _dio.post(
        path,
        queryParameters: param,
        data: body,
        options: Options(
          headers: headerJson,
        ),
      );
      return _returnResponse(response);
    } catch (e) {
      print(e);
      throw handleError(e);
    }
  }

  Future<dynamic> put(String path,
      {Map<String, dynamic>? body,
      Map<String, String>? headers,
      Map<String, String>? param,
      encoding}) async {
    Map<String, String> headerJson = {
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
    if (headers != null) {
      headerJson.addAll(headers);
    }
    try {
      Response response = await _dio.put(
        path,
        queryParameters: param,
        data: body,
        options: Options(
          headers: headerJson,
        ),
      );
      return _returnResponse(response);
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? param,
      Map<String, String>? headers,
      encoding}) async {
    Map<String, String> headerJson = {
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
    if (headers != null) {
      headerJson.addAll(headers);
    }
    try {
      Response response = await _dio.get(
        path,
        queryParameters: param,
        options: Options(
          headers: headerJson,
        ),
      );
      return _returnResponse(response);
    } catch (e) {
      print(path);
      print(headers);
      throw handleError(e);
    }
  }
  Future<dynamic> delete(String path,
      {Map<String, dynamic>? param,
      Map<String, String>? headers,
      encoding}) async {
    Map<String, String> headerJson = {
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
    if (headers != null) {
      headerJson.addAll(headers);
    }
    try {
      Response response = await _dio.delete(
        path,
        queryParameters: param,
        options: Options(
          headers: headerJson,
        ),
      );
      return _returnResponse(response);
    } catch (e) {
      print(path);
      print(headers);
      throw handleError(e);
    }
  }
  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data['message']);
      case 401:
        throw RefreshTokenFailedException('Response 401');
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
        throw FetchDataException('Error 500 : ${response.data['message']}');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic handleError(dynamic error) {
    // ignore: deprecated_member_use
    if (error is DioError) {
      if (error.response != null) {
        return _returnResponse(error.response!);
      } else {
        throw FetchDataException('No Internet connection');
      }
    } else {
      throw error;
    }
  }
}
