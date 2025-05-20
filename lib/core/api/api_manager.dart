import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_constant.dart';

@singleton
class ApiManager {
  final dio = Dio();

  Future<Response> getData(
      {required String endPoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? headers}) {
    return dio.get(ApiConstants.baseUrl + endPoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (status) => true,
          headers: headers,
        ));
  }

  Future<Response> postData(
      {required String endPoint,
      Object? body,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? headers}) {
    return dio.post(ApiConstants.baseUrl + endPoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (status) => true,
          headers: headers,
        ));
  }
  Future<Response> deleteData(
      {required String endPoint,
      Object? body,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? headers}) {
    return dio.delete(ApiConstants.baseUrl + endPoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (status) => true,
          headers: headers,
        ));
  }  Future<Response> updateData(
      {required String endPoint,
      Object? body,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? headers}) {
    return dio.put(ApiConstants.baseUrl + endPoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (status) => true,
          headers: headers,
        ));
  }
}
