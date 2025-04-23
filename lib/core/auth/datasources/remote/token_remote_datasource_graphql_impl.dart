import 'package:dartz/dartz.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter_core/core/auth/datasources/remote/token_remote_datasource.dart';
import 'package:flutter_core/core/utils/typedef.dart';

class TokenRemoteDataSourceGraphqlImpl implements TokenRemoteDataSource {
  final Client _client;

  TokenRemoteDataSourceGraphqlImpl(this._client);

  @override
  ResultFuture<String?> refreshToken(String refreshToken) async {
    // final request = GRefreshTokenReq((b) => b
    //   ..vars.refreshToken = refreshToken
    // );

    // final response = await _client.request(request).first;
    // return response.data?.refreshToken?.accessToken;
    return right(null);
  }
}
