abstract class LocalStorageRepository {
  Future<void> saveString(String key, String value);
  String? getString(String key);
  Future<void> remove(String key);
  Future<void> clearAll();
}
