// lib/data/data_sources/local/local_storage_data_source.dart
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'local_storage_repository.dart';

@LazySingleton(as: LocalStorageRepository)
class LocalStorageDataSource implements LocalStorageRepository {
  final GetStorage _storage;

  LocalStorageDataSource(this._storage);

  @override
  Future<void> saveString(String key, String value) async {
    await _storage.write(key, value);
  }

  @override
  String? getString(String key) {
    return _storage.read(key);
  }

  @override
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  @override
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
