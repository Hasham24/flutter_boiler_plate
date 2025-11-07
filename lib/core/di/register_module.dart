// core/di/register_module.dart
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:boiler_plate/core/constants/app_env.dart';

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => AppEnv.baseUrl; // Replace with your API

  @Named("ConnectTimeout")
  Duration get connectTimeout => const Duration(seconds: 15);

  @Named("ReceiveTimeout")
  Duration get receiveTimeout => const Duration(seconds: 15);
   @lazySingleton
  GetStorage get getStorage => GetStorage();
}
