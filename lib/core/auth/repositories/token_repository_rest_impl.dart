import 'package:dartz/dartz.dart';
import 'package:flutter_core/core/auth/datasources/remote/token_remote_datasource.dart';
import 'package:flutter_core/core/auth/repositories/token_repository.dart';
import 'package:flutter_core/core/errors/failures.dart';
import 'package:flutter_core/core/utils/typedef.dart';
import '../datasources/local/token_local_datasource.dart';

class TokenRepositoryImpl implements TokenRepository {
  final TokenLocalDataSource _localDataSource;
  final TokenRemoteDataSource _remoteDataSource;

  TokenRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  ResultFuture<String?> refreshToken(String refreshToken) async {
    try {
      final newAccessToken = await _remoteDataSource.refreshToken(refreshToken);
      return newAccessToken.fold(
        (failure) => left(failure),
        (token) => right(token),
      );
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultVoid saveTokens({
    required String accessToken,
    required String refreshToken,
  }) => _localDataSource.saveTokens(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );

  @override
  ResultVoid clearTokens() => _localDataSource.clearTokens();

  @override
  ResultFuture<bool> hasTokens() => _localDataSource.hasTokens();

  @override
  ResultVoid setAccessToken(String accessToken) =>
      _localDataSource.setAccessToken(accessToken);

  @override
  ResultVoid setRefreshToken(String refreshToken) =>
      _localDataSource.setRefreshToken(refreshToken);

  @override
  ResultFuture<String?> getAccessToken() => _localDataSource.getAccessToken();

  @override
  ResultFuture<String?> getRefreshToken() => _localDataSource.getRefreshToken();
}
