import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/domain/entities/auth_token.dart';
import 'package:flutter_core/src/features/auth/data/models/login_request.dart';

abstract class AuthRemoteDataSource {
  ResultFuture<AuthToken> login(LoginRequest request);
  ResultVoid logout();
  ResultFuture<bool> isAuthenticated();
}
