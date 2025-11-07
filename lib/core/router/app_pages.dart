import 'package:boiler_plate/core/router/app_routes.dart';
import 'package:boiler_plate/presentations/auth/views/login_view.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.loginView;

  static final routes = [
    // Splash
    GetPage(name: AppRoutes.loginView, page: () => const LoginView()),
  ];
}
