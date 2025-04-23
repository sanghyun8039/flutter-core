import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/domain/entities/auth_token.dart';
import 'package:flutter_core/src/features/auth/domain/repositories/auth_repository.dart';

class SaveTokenUseCase {
  final AuthRepository _authRepository;

  SaveTokenUseCase(this._authRepository);

  ResultVoid call(AuthToken token) {
    return _authRepository.saveTokens(token);
  }
}
