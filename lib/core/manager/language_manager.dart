import 'package:boiler_plate/core/constants/storage_keys_constants.dart';
import 'package:boiler_plate/data/data_sources/local_data_source/local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class LanguageManager extends GetxController {
  static LanguageManager get to => Get.find<LanguageManager>();

  final LocalStorageRepository _localStorage;
  final RxString _currentLanguage = 'en'.obs;

  LanguageManager(this._localStorage);

  String get currentLanguage => _currentLanguage.value;
  bool get isRTL => _currentLanguage.value == 'ar';

  @override
  void onInit() {
    super.onInit();
    // Initialize language from storage
    final savedLanguage = _localStorage.getString(StorageKeys.languageKey) ?? 'en';
    _currentLanguage.value = savedLanguage;
  }

  void setLanguage(String langCode) {
    if (langCode == _currentLanguage.value) return;
    
    // Save to storage
    _localStorage.saveString(StorageKeys.languageKey, langCode);
    
    // Update reactive variable
    _currentLanguage.value = langCode;
    
    // Update GetX locale for RTL and system-wide language change
    final locale = Locale(langCode);
    Get.updateLocale(locale);
  }

  // Listen to language changes
  void listen(Function(String) callback) {
    _currentLanguage.listen(callback);
  }
}
