import 'package:dartz/dartz.dart';
import 'package:flutter_core/core/errors/failures.dart';
import 'package:flutter_core/src/features/auth/data/api/auth_api_client.dart';
import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_core/src/features/auth/domain/entities/auth_token.dart';
import 'package:flutter_core/src/features/auth/data/models/login_request.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  ResultFuture<AuthToken> login(LoginRequest request) async {
    try {
      final response = await _apiClient.login(request);
      return right(
        AuthToken(
          accessToken: response.data.token.accessToken,
          refreshToken: response.data.token.refreshToken,
        ),
      );
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultVoid logout() async {
    try {
      //await _apiClient.logout();
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultFuture<bool> isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }
}
