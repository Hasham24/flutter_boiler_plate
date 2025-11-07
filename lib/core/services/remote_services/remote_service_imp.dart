import 'dart:convert';
import 'package:boiler_plate/core/constants/storage_keys_constants.dart';
import 'package:boiler_plate/core/network/map_dio_error.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:boiler_plate/core/services/remote_services/remote_service.dart';
import 'package:boiler_plate/core/network/network_exception.dart';
import 'package:get_storage/get_storage.dart';

@LazySingleton(as: HttpClient)
class DioHttpClient implements HttpClient {
  factory DioHttpClient(
    @Named('BaseUrl') String baseUrl,
    @Named('ConnectTimeout') Duration connectTimeout,
    @Named('ReceiveTimeout') Duration receiveTimeout,
  ) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    final dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final box = GetStorage();
          final token = box.read<String>(StorageKeys.authToken) ?? '';
          final lang = box.read<String>(StorageKeys.languageKey) ?? 'en';

          options.headers.addAll({
            'Authorization': token.isNotEmpty ? token : 'UP!and\$',
            'app_id': '1',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'lang': lang,
          });

          return handler.next(options);
        },
        onError: (err, handler) {
          return handler.next(err);
        },
      ),
    );

    return DioHttpClient._(dio);
  }
  DioHttpClient._(this._dio);
  final Dio _dio;

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? mapSuccess,
  }) async {
    try {
      final r = await _dio.get(path, queryParameters: queryParameters);
      return _mapResponse(r, mapSuccess);
    } on DioException catch (e) {
      throw mapDioError(e);
    }
  }

  @override
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? mapSuccess,
  }) async {
    try {
      final r = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return _mapResponse(r, mapSuccess);
    } on DioException catch (e) {
      throw mapDioError(e);
    }
  }

  @override
  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? mapSuccess,
  }) async {
    try {
      final r = await _dio.put(
        path,
        data: data is String ? data : _tryEncode(data),
        queryParameters: queryParameters,
      );
      return _mapResponse(r, mapSuccess);
    } on DioException catch (e) {
      throw mapDioError(e);
    }
  }

  @override
  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? mapSuccess,
  }) async {
    try {
      final r = await _dio.delete(
        path,
        data: data is String ? data : _tryEncode(data),
        queryParameters: queryParameters,
      );
      return _mapResponse(r, mapSuccess);
    } on DioException catch (e) {
      throw mapDioError(e);
    }
  }

  T _mapResponse<T>(Response r, T Function(dynamic data)? mapSuccess) {
    final status = r.statusCode ?? 0;
    if (status >= 200 && status < 300) {
      if (mapSuccess != null) return mapSuccess(r.data);
      return r.data as T;
    } else {
      throw NetworkException(message: 'HTTP error', statusCode: status);
    }
  }

  dynamic _tryEncode(dynamic data) {
    if (data == null) return null;
    if (data is String) return data;
    try {
      return json.encode(data);
    } catch (_) {
      return data;
    }
  }
}
