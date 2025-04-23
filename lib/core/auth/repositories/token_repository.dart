import 'package:flutter_core/core/utils/typedef.dart';

abstract class TokenRepository {
  ResultFuture<String?> getAccessToken();
  ResultFuture<String?> getRefreshToken();
  ResultVoid saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  ResultVoid clearTokens();
  ResultFuture<bool> hasTokens();
  ResultVoid setAccessToken(String accessToken);
  ResultVoid setRefreshToken(String refreshToken);
  ResultFuture<String?> refreshToken(String refreshToken);
}
