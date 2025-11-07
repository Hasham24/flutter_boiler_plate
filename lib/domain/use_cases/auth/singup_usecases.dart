import 'package:boiler_plate/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginUseCases {
  LoginUseCases(this._authRepo);
  final AuthRepo _authRepo;

  Future<dynamic> call(dynamic request) {
    return _authRepo.login(request);
  }
}
