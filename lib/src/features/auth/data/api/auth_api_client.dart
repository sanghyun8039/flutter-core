import 'package:dio/dio.dart';
import 'package:flutter_core/src/features/auth/data/models/login_request.dart';
import 'package:flutter_core/src/features/auth/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(
    Dio dio, {
    required String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AuthApiClient;

  @POST("/api/admin/auth/login")
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST("/api/admin/auth/logout")
  Future<void> logout();
}
