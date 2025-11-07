import 'package:boiler_plate/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginUseCases {
  final AuthRepo _authRepo;

  LoginUseCases(this._authRepo);

  Future<dynamic> call(dynamic request) {
    return _authRepo.login(request);
  }
}
