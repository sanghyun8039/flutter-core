import 'package:dartz/dartz.dart';
import 'package:flutter_core/core/auth/datasources/remote/token_remote_datasource.dart';
import 'package:flutter_core/core/errors/failures.dart';
import 'package:flutter_core/core/network/dio/api_clients/token_api_client.dart';
import 'package:flutter_core/core/auth/models/refresh_token_request_model.dart';
import 'package:flutter_core/core/utils/typedef.dart';

class TokenRemoteDataSourceRestImpl implements TokenRemoteDataSource {
  final TokenApiClient _apiClient;

  TokenRemoteDataSourceRestImpl(this._apiClient);

  @override
  ResultFuture<String?> refreshToken(String refreshToken) async {
    try {
      final response = await _apiClient.refreshToken(
        RefreshTokenRequest(refreshToken),
      );
      return right(response.accessToken);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }
}
