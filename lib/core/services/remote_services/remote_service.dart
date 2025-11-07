/// Abstraction for making network requests.
/// This keeps the data layer independent of Dio (or any library).
abstract class HttpClient {
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? mapSuccess,
  });

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? mapSuccess,
  });

  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? mapSuccess,
  });

  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? mapSuccess,
  });
}
