import 'package:blink/core/network/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;
  final PrettyDioLogger prettyDioLogger;

  DioClient(this._dio, this.prettyDioLogger) {
    initialiseDio();
  }

  initialiseDio() {
    _dio.options
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 15)
      ..sendTimeout = const Duration(seconds: 10);
    _dio.interceptors.add(
      prettyDioLogger,
    );
  }

  Future<ResponseWrapper> request({
    required EndPoint endPoint,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _sendRequest(
        type: endPoint.requestType,
        url: endPoint.url,
        data: data,
        queryParams: queryParams,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ResponseWrapper(
        isSuccess: false,
        statusCode: 0,
        description: e.toString(),
      );
    }
  }

  Future<Response> _sendRequest({
    required RequestType type,
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) {
    switch (type) {
      case RequestType.get:
        return _dio.get(url, queryParameters: queryParams);
      case RequestType.post:
        return _dio.post(url, data: data, queryParameters: queryParams);
      case RequestType.patch:
        return _dio.patch(url, data: data, queryParameters: queryParams);
      case RequestType.put:
        return _dio.put(url, data: data, queryParameters: queryParams);
      case RequestType.delete:
        return _dio.delete(url, data: data, queryParameters: queryParams);
    }
  }
}

ResponseWrapper _handleResponse(Response response) {
  final statusCode = response.statusCode ?? 0;

  if (statusCode >= 200 && statusCode < 300) {
    return ResponseWrapper(
      data: response.data,
      statusCode: statusCode,
      isSuccess: true,
    );
  } else {
    return ResponseWrapper(
      data: response.data,
      statusCode: statusCode,
      isSuccess: false,
      description: response.statusMessage ?? 'Request failed',
    );
  }
}

ResponseWrapper _handleError(DioException e) {
  if (e.response != null) {
    return ResponseWrapper(
      data: e.response?.data,
      statusCode: e.response?.statusCode ?? 0,
      isSuccess: false,
      description: e.response?.statusMessage ?? 'Error',
    );
  } else {
    return ResponseWrapper(
      data: null,
      statusCode: 0,
      isSuccess: false,
      description: e.message,
    );
  }
}

class ResponseWrapper<T> {
  final T? data;
  final int statusCode;
  final String? description;
  final bool isSuccess;

  ResponseWrapper({
    this.data,
    required this.statusCode,
    this.description,
    required this.isSuccess,
  });
}
