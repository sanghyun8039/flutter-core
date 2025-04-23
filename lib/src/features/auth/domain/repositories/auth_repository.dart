import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/data/models/login_request.dart';
import 'package:flutter_core/src/features/auth/domain/entities/auth_token.dart';

abstract class AuthRepository {
  ResultFuture<AuthToken> login(LoginRequest request);
  //Future<AuthToken> socialLogin(SocialLoginRequest request);
  ResultVoid logout();
  ResultVoid saveTokens(AuthToken token);
  ResultVoid clearTokens();
  ResultFuture<bool> isAuthenticated();
}
