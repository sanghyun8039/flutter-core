import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/data/models/login_request.dart';
import 'package:flutter_core/src/features/auth/domain/entities/auth_token.dart';
import 'package:flutter_core/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  ResultFuture<AuthToken> call(LoginRequest request) {
    return _authRepository.login(request);
  }
}
