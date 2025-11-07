import 'package:boiler_plate/data/data_sources/remote_data_source/auth/auth_data_source.dart';
import 'package:boiler_plate/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.authDataSource});
  final AuthDataSource authDataSource;

  @override
  Future<dynamic> login(dynamic request) async {
    final response = await authDataSource.login(request);
    return response;
  }
}
