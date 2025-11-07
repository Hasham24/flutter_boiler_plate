import 'dart:convert';
import 'package:boiler_plate/core/constants/api_endpoints.dart';
import 'package:boiler_plate/core/services/remote_services/remote_service.dart';
import 'package:boiler_plate/data/data_sources/remote_data_source/auth/auth_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImp implements AuthDataSource {
  AuthDataSourceImp({required HttpClient httpClient})
    : _httpClient = httpClient;
  final HttpClient _httpClient;

  @override
  Future<dynamic> login(dynamic request) async {
    final response = await _httpClient.post(ApiEndpoints.login, data: request);

    final Object jsonMap = response is Map<String, dynamic>
        ? response
        : json.decode(response as String) as Map<String, dynamic>;

    return jsonMap;
  }
}
