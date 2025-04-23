import 'package:dartz/dartz.dart';
import 'package:flutter_core/core/auth/datasources/local/token_local_datasource.dart';
import 'package:flutter_core/core/errors/failures.dart';
import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  final FlutterSecureStorage _storage;

  TokenLocalDataSourceImpl(this._storage);

  @override
  ResultVoid setAccessToken(String accessToken) async {
    try {
      await _storage.write(key: _accessTokenKey, value: accessToken);
      return right(unit);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultVoid setRefreshToken(String refreshToken) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultVoid saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await Future.wait([
        _storage.write(key: _accessTokenKey, value: accessToken),
        _storage.write(key: _refreshTokenKey, value: refreshToken),
      ]);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultVoid clearTokens() async {
    try {
      await _storage.deleteAll();
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultFuture<bool> hasTokens() async {
    try {
      final accessToken = await _storage.read(key: _accessTokenKey);
      final refreshToken = await _storage.read(key: _refreshTokenKey);
      return right(accessToken != null && refreshToken != null);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultFuture<String?> getAccessToken() async {
    try {
      final accessToken = await _storage.read(key: _accessTokenKey);
      return right(accessToken);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }

  @override
  ResultFuture<String?> getRefreshToken() async {
    try {
      final refreshToken = await _storage.read(key: _refreshTokenKey);
      return right(refreshToken);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }
}
