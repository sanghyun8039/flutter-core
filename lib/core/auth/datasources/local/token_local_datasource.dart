import 'package:flutter_core/core/utils/typedef.dart';

abstract class TokenLocalDataSource {
  ResultVoid setAccessToken(String accessToken);
  ResultVoid setRefreshToken(String refreshToken);
  ResultVoid saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  ResultVoid clearTokens();
  ResultFuture<bool> hasTokens();
  ResultFuture<String?> getAccessToken();
  ResultFuture<String?> getRefreshToken();
}
