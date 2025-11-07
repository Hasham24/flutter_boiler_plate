import 'package:boiler_plate/core/bindings/initial_binding.dart';
import 'package:boiler_plate/core/constants/storage_keys_constants.dart';
import 'package:boiler_plate/core/di/injection.dart';
import 'package:boiler_plate/core/localization/app_translations.dart';
import 'package:boiler_plate/core/router/app_pages.dart';
import 'package:boiler_plate/core/utils/app_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:boiler_plate/data/data_sources/local_data_source/local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:boiler_plate/core/router/app_routes.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize dependencies first
  await configureDependencies();

  await GetStorage.init();
  await AppTranslations.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Locale _getInitialLocale() {
    try {
      final localStorage = sl<LocalStorageRepository>();
      final savedLanguage =
          localStorage.getString(StorageKeys.languageKey) ?? 'en';

      return Locale(savedLanguage);
    } catch (e) {
      return const Locale('en');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter BoilerPlate',
      initialBinding: InitialBinding(),
      navigatorObservers: [routeObserver],
      translations: AppTranslations(),
      locale: _getInitialLocale(),
      fallbackLocale: const Locale('ar'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
          surface: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginView,
      getPages: AppPages.routes,
    );
  }
}
