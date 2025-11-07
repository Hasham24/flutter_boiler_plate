import 'dart:io';
import 'package:dio/dio.dart';

import 'network_exception.dart';

/// Map a DioException to a user-friendly NetworkException
NetworkException mapDioError(DioException error) {
  final String? requestUrl = _safeRequestUrl(error);

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return NetworkException.timeout();

    case DioExceptionType.cancel:
      return NetworkException(
        message: 'Request was cancelled.',
        url: requestUrl,
        originalError: error,
      );

    case DioExceptionType.badCertificate:
    case DioExceptionType.connectionError:
      // Often caused by no internet or TLS issues
      if (error.error is SocketException) {
        return NetworkException.noInternet();
      }
      return NetworkException(
        message: 'Network connection error. Please try again.',
        url: requestUrl,
        originalError: error,
      );

    case DioExceptionType.badResponse:
      final int statusCode = error.response?.statusCode ?? 0;
      final String serverMessage = _extractServerMessage(error.response?.data);

      if (statusCode == 401) return NetworkException.unauthorized();
      if (statusCode == 403) return NetworkException.forbidden();

      if (statusCode == 404) {
        // Return server's response instead of static "not found"
        return NetworkException(
          message: serverMessage.isNotEmpty
              ? serverMessage
              : 'Resource not found.',
          statusCode: statusCode,
          url: requestUrl,
          originalError: error,
        );
      }

      if (statusCode >= 500) return NetworkException.serverError(statusCode);

      return NetworkException(
        message: serverMessage.isNotEmpty
            ? serverMessage
            : 'Request failed with status $statusCode.',
        statusCode: statusCode,
        url: requestUrl,
        originalError: error,
      );

    case DioExceptionType.unknown:
      if (error.error is SocketException) {
        return NetworkException.noInternet();
      }
      return NetworkException(
        message: 'An unexpected error occurred. Please try again.',
        url: requestUrl,
        originalError: error,
      );
  }
}

String? _safeRequestUrl(DioException error) {
  try {
    return error.requestOptions.uri.toString();
  } catch (_) {
    return null;
  }
}

String _extractServerMessage(dynamic data) {
  try {
    if (data is Map) {
      final dynamic m1 = data['message'] ?? data['msg'] ?? data['error'];
      if (m1 is String && m1.isNotEmpty) return m1;

      if (data['errors'] is List && (data['errors'] as List).isNotEmpty) {
        final first = (data['errors'] as List).first;
        if (first is String) return first;
        if (first is Map && first.values.isNotEmpty) {
          final dynamic v = first.values.first;
          if (v is String) return v;
        }
      }
    }

    if (data is String && data.isNotEmpty) return data;
  } catch (_) {}
  return '';
}
