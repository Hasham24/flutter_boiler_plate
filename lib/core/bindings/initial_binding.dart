import 'package:boiler_plate/core/di/injection.dart';
import 'package:boiler_plate/core/manager/language_manager.dart';
import 'package:boiler_plate/data/data_sources/local_data_source/local_storage_repository.dart';
import 'package:boiler_plate/presentations/auth/controller/login_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // ✅ Initialize StringsProvider here
    final localStorage = sl<LocalStorageRepository>();

    // ✅ Initialize LanguageManager
    Get.put<LanguageManager>(LanguageManager(localStorage), permanent: true);

    _registerControllers();
  }

  void _registerControllers() {
    // auth controllers bindings
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
