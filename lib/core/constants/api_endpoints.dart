import 'app_env.dart';

class ApiEndpoints {
  // Base URL from environment
  static String get baseUrl => AppEnv.baseUrl;
  static String get login => "${baseUrl}login";
}
