import 'package:dio/dio.dart';
import 'package:flutter_core/core/auth/models/refresh_token_request_model.dart';
import 'package:flutter_core/core/auth/models/refresh_token_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'token_api_client.g.dart';

@RestApi()
abstract class TokenApiClient {
  factory TokenApiClient(
    Dio dio, {
    required String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _TokenApiClient;

  @POST("/auth/refreshToken")
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest request,
  );
}
