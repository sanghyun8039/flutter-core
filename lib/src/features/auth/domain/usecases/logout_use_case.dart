import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  ResultVoid call() {
    return _authRepository.logout();
  }
}
