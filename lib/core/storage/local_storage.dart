import 'package:boiler_plate/core/constants/storage_keys_constants.dart';
import 'package:boiler_plate/data/data_sources/local_data_source/local_storage_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StorageService {
  final LocalStorageRepository _localStorage;

  StorageService(this._localStorage);

  // ---------- User ----------
  Future<void> saveUserId(String userId) async {
    await _localStorage.saveString(StorageKeys.userId, userId);
  }

  String? getUserId() {
    return _localStorage.getString(StorageKeys.userId);
  }

  Future<void> clearUserId() async {
    await _localStorage.remove(StorageKeys.userId);
  }

  // ---------- Token ----------
  Future<void> saveAuthToken(String token) async {
    await _localStorage.saveString(StorageKeys.authToken, token);
  }

  String? getAuthToken() {
    return _localStorage.getString(StorageKeys.authToken);
  }

  Future<void> clearAuthToken() async {
    await _localStorage.remove(StorageKeys.authToken);
  }

  // ---------- Language ----------
  Future<void> setLanguage(String langCode) async {
    await _localStorage.saveString(StorageKeys.languageKey, langCode);
  }

  String getLanguage() {
    return _localStorage.getString(StorageKeys.languageKey) ?? 'en';
  }

  // ---------- General ----------
  Future<void> clearAll() async {
    await _localStorage.clearAll();
  }
}
