import 'package:flutter_core/core/auth/repositories/token_repository.dart';
import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_core/src/features/auth/data/models/login_request.dart';
import 'package:flutter_core/src/features/auth/domain/entities/auth_token.dart';
import 'package:flutter_core/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final TokenRepository _tokenRepository;
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._tokenRepository, this._authRemoteDataSource);

  @override
  ResultFuture<AuthToken> login(LoginRequest request) {
    return _authRemoteDataSource.login(request);
  }

  @override
  ResultVoid logout() {
    return _authRemoteDataSource.logout();
  }

  @override
  ResultVoid saveTokens(AuthToken token) {
    return _tokenRepository.saveTokens(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
    );
  }

  @override
  ResultVoid clearTokens() {
    return _tokenRepository.clearTokens();
  }

  @override
  ResultFuture<bool> isAuthenticated() {
    return _authRemoteDataSource.isAuthenticated();
  }
}
