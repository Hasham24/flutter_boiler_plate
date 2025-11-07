// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boiler_plate/core/di/register_module.dart' as _i743;
import 'package:boiler_plate/core/manager/language_manager.dart' as _i786;
import 'package:boiler_plate/core/manager/user_manager.dart' as _i358;
import 'package:boiler_plate/core/services/remote_services/remote_service.dart'
    as _i234;
import 'package:boiler_plate/core/services/remote_services/remote_service_imp.dart'
    as _i353;
import 'package:boiler_plate/core/storage/local_storage.dart' as _i193;
import 'package:boiler_plate/data/data_sources/local_data_source/local_storage_data_source.dart'
    as _i53;
import 'package:boiler_plate/data/data_sources/local_data_source/local_storage_repository.dart'
    as _i479;
import 'package:boiler_plate/data/data_sources/remote_data_source/auth/auth_data_source.dart'
    as _i111;
import 'package:boiler_plate/data/data_sources/remote_data_source/auth/auth_data_source_imp.dart'
    as _i196;
import 'package:boiler_plate/data/repositories/auth_repo_implementation.dart'
    as _i854;
import 'package:boiler_plate/domain/repositories/auth_repository.dart' as _i884;
import 'package:boiler_plate/domain/use_cases/auth/singup_usecases.dart'
    as _i371;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i792.GetStorage>(() => registerModule.getStorage);
    gh.lazySingleton<_i358.UserManager>(() => _i358.UserManager());
    gh.factory<Duration>(
      () => registerModule.connectTimeout,
      instanceName: 'ConnectTimeout',
    );
    gh.factory<Duration>(
      () => registerModule.receiveTimeout,
      instanceName: 'ReceiveTimeout',
    );
    gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
    gh.lazySingleton<_i479.LocalStorageRepository>(
      () => _i53.LocalStorageDataSource(gh<_i792.GetStorage>()),
    );
    gh.lazySingleton<_i234.HttpClient>(
      () => _i353.DioHttpClient(
        gh<String>(instanceName: 'BaseUrl'),
        gh<Duration>(instanceName: 'ConnectTimeout'),
        gh<Duration>(instanceName: 'ReceiveTimeout'),
      ),
    );
    gh.lazySingleton<_i111.AuthDataSource>(
      () => _i196.AuthDataSourceImp(httpClient: gh<_i234.HttpClient>()),
    );
    gh.lazySingleton<_i786.LanguageManager>(
      () => _i786.LanguageManager(gh<_i479.LocalStorageRepository>()),
    );
    gh.lazySingleton<_i193.StorageService>(
      () => _i193.StorageService(gh<_i479.LocalStorageRepository>()),
    );
    gh.lazySingleton<_i884.AuthRepo>(
      () => _i854.AuthRepoImpl(authDataSource: gh<_i111.AuthDataSource>()),
    );
    gh.lazySingleton<_i371.LoginUseCases>(
      () => _i371.LoginUseCases(gh<_i884.AuthRepo>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i743.RegisterModule {}
